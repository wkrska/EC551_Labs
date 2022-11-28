`timescale 1ns / 1ps

`include "my_header.vh"

module data_loader(
    input wire clk_100,
    input wire rst,
    input wire [7:0] key_ps2,
    input wire wen_key_ps2,
    input wire [7:0] key_uart,
    input wire wen_key_uart,
    output wire [2:0] mode, // 0=I, 1=L, 2=A, 3=B
    output reg mode_flag,
    output reg [11:0] inst_addr,
    output reg [15:0] inst_write,
    output wire inst_wen,
    output wire [`dwidth_dat_user*2-1:0] alu_out,
    output wire [`dwidth_mat*3*3-1:0] bench_out,
    output reg result_ready,
    output reg ap_start,
    output wire [7:0] debug_state,
    output wire [3:0] count_debug
);

// Translate PS/2 inputs
reg [4:0] trans_key_ps2;
// abridged LUT from key_ps2 to hex
always @(key_ps2) begin
    case(key_ps2) // 0X is number, 1X is char
        8'h45 : trans_key_ps2 = 5'h00;
        8'h16 : trans_key_ps2 = 5'h01;
        8'h1e : trans_key_ps2 = 5'h02;
        8'h26 : trans_key_ps2 = 5'h03;
        8'h25 : trans_key_ps2 = 5'h04;
        8'h2e : trans_key_ps2 = 5'h05;
        8'h36 : trans_key_ps2 = 5'h06;
        8'h3d : trans_key_ps2 = 5'h07;
        8'h3e : trans_key_ps2 = 5'h08;
        8'h46 : trans_key_ps2 = 5'h09;
        8'h1c : trans_key_ps2 = 5'h0a;
        8'h32 : trans_key_ps2 = 5'h0b;
        8'h21 : trans_key_ps2 = 5'h0c;
        8'h23 : trans_key_ps2 = 5'h0d;
        8'h24 : trans_key_ps2 = 5'h0e;
        8'h2b : trans_key_ps2 = 5'h0f;
        8'h29 : trans_key_ps2 = 5'h10; // [space]
        8'h5a : trans_key_ps2 = 5'h11; // [newline]
        8'h12 : trans_key_ps2 = 5'h12; // [L shift]
        8'h59 : trans_key_ps2 = 5'h13; // [R shift]
        // 8'h36 : trans_key_ps2 = 5'h14; // ^ (6)
        8'h55 : trans_key_ps2 = 5'h15; // +
        8'h4e : trans_key_ps2 = 5'h16; // -
        // 8'h3e : trans_key_ps2 = 5'h17; // * (8) custom function
        8'h2d : trans_key_ps2 = 5'h18; // r
        default: trans_key_ps2 = 5'h1F; // D/C
    endcase
end

// Translate UART inputs
reg [4:0] trans_key_uart;
// abridged LUT from key_ps2 to hex
always @(key_uart) begin
    case(key_uart) // 0X is number, 1X is char
        8'h30 : trans_key_uart = 5'h00; // nums
        8'h31 : trans_key_uart = 5'h01;
        8'h32 : trans_key_uart = 5'h02;
        8'h33 : trans_key_uart = 5'h03;
        8'h34 : trans_key_uart = 5'h04;
        8'h35 : trans_key_uart = 5'h05;
        8'h36 : trans_key_uart = 5'h06;
        8'h37 : trans_key_uart = 5'h07;
        8'h38 : trans_key_uart = 5'h08;
        8'h39 : trans_key_uart = 5'h09; 
        8'h41 : trans_key_uart = 5'h0a; //uppercase
        8'h42 : trans_key_uart = 5'h0b;
        8'h43 : trans_key_uart = 5'h0c;
        8'h44 : trans_key_uart = 5'h0d;
        8'h45 : trans_key_uart = 5'h0e;
        8'h46 : trans_key_uart = 5'h0f;
        8'h61 : trans_key_uart = 5'h0a; //lowercase
        8'h62 : trans_key_uart = 5'h0b;
        8'h63 : trans_key_uart = 5'h0c;
        8'h64 : trans_key_uart = 5'h0d;
        8'h65 : trans_key_uart = 5'h0e;
        8'h66 : trans_key_uart = 5'h0f;
        8'h20 : trans_key_uart = 5'h10; // [space]
        8'h0a : trans_key_uart = 5'h11; // [newline]
        8'h52 : trans_key_uart = 5'h18; // R
        8'h72 : trans_key_uart = 5'h18; // r
        default: trans_key_uart = 5'h1F; // D/C
    endcase
end

//----------- control FSM ----------//
reg [7:0] curr_state, next_state;
assign debug_state = curr_state;
reg [3:0] count_c,count_n;
assign count_debug = count_c;
reg [8:0] prev_key, prev_key_n;
reg mode_flag_n;
// Inst write
reg [`dwidth_dat-1:0] inst_write_n;
reg [`awidth_mem-1:0] inst_addr_n;
reg ap_start_n;
// ALU
reg [1:0] ALU_mode_c,ALU_mode_n;
reg [`dwidth_dat_user-1:0] alu_a,alu_b,alu_a_n,alu_b_n;
reg result_ready_n;
// Benchmark
reg [`dwidth_mat*3*3-1:0] mat_a, mat_b, mat_a_n, mat_b_n;


//states
//  note that upper 4 bits are the mode encoding, whereas he lower 4 bits are the state encoding
localparam [7:0]    IDLE=8'h40,
                    I_ch=8'h00, // first char entered, or run
                    I_wb=8'h01, // write inst on enter
                    I_rn=8'h02, // Start datapath
                    L_ch=8'h10, // first char entered, or run
                    L_wb=8'h11, // write inst on enter
                    L_rn=8'h12, // Start datapath
                    A_aa=8'h20, // First operand
                    A_sh=8'h21, // shift?
                    A_op=8'h22, // Operator
                    A_bb=8'h23, // Seond operand
                    A_wb=8'h24, // wb result
                    B_ma=8'h30, // loop until count, writing to first mat
                    B_mb=8'h31, // loop until connt, writing to second mat
                    B_wb=8'h32; // wb result

// Extract mode encoding
assign mode = curr_state[7:4];

// Extract instruction wen
assign inst_wen = ((curr_state==I_wb || curr_state==L_wb) && count_c == 'd4) ? 1'b1 : 1'b0;

// Clocked portion of FSM
always @(posedge clk_100) begin
    if (rst) begin
        curr_state <= IDLE;
        mode_flag <= 0;
        count_c <= 0;
        ap_start <= 0;
        ALU_mode_c <= 0;
        result_ready <= 0;
        inst_write <= 0;
        inst_addr <= 0;
        alu_a <= 0;
        alu_b <= 0;
        mat_a <= 0;
        mat_b <= 0;
        prev_key <= 0;
    end else begin
        curr_state <= next_state;
        mode_flag <= mode_flag_n;
        count_c <= count_n;
        ap_start <= ap_start_n;
        ALU_mode_c <= ALU_mode_n;
        result_ready <= result_ready_n;
        inst_write <= inst_write_n;
        inst_addr <= inst_addr_n;
        alu_a <= alu_a_n;
        alu_b <= alu_b_n;
        mat_a <= mat_a_n;
        mat_b <= mat_b_n;
        prev_key <= prev_key_n;
    end
end

// Combinational FSM component
always @(*) begin
    case(curr_state)
        IDLE: begin
            if (wen_key_ps2) begin // if key pressed
                prev_key_n = key_ps2;
                if (key_ps2 == 8'h5a) begin // if enter is pressed
                    case(prev_key) // if prev key was a mode key, go to that mode and assert mode flag, otherwise wait
                        8'h43 : next_state = I_ch;
                        8'h4B : next_state = L_ch;
                        8'h1C : next_state = A_aa;
                        8'h32 : next_state = B_ma;
                        default: next_state = IDLE;
                    endcase
                    mode_flag_n = 'b1;
                end else begin // do nothing
                    next_state = IDLE;
                    mode_flag_n = 'b0;
                end
            end else begin
                prev_key_n = prev_key;
                next_state = IDLE;
                mode_flag_n = 'b0;
            end

            count_n = 'b0;
            ap_start_n = 'b0;
            ALU_mode_n = 'b0;
            result_ready_n = 'b0;
            inst_write_n = 'b0;
            inst_addr_n = 12'd31;
            alu_a_n = 'b0;
            alu_b_n = 'b0;
            mat_a_n = 'b0;
            mat_b_n = 'b0;
        end
        I_ch: begin // loads the typed keys into 
            //            key typed   &&  is hex             && 4th char      wb   :   key typed   && is "r"                    run  : next ch
            next_state=  (wen_key_ps2 && (~trans_key_ps2[4]) && count_c==3) ? I_wb : ((wen_key_ps2 && trans_key_ps2 == 5'h18) ? I_rn : I_ch);
            //            key typed   &&  is hex             && not 4th char      wb   :   key typed   && is "r"                    run  : next ch
            inst_write_n=(wen_key_ps2 && (~trans_key_ps2[4]) && count_c<4) ? {inst_write[11:0],trans_key_ps2[3:0]} : inst_write;
            count_n=(wen_key_ps2 && (~trans_key_ps2[4]) && count_c<4) ? count_c+1:count_c;
            inst_addr_n = inst_addr;
            ap_start_n = 'b0;
            ALU_mode_n = 'b0;
            result_ready_n = 'b0;
            alu_a_n = 'b0;
            alu_b_n = 'b0;
            mat_a_n = 'b0;
            mat_b_n = 'b0;
            mode_flag_n = 'b0;
            prev_key_n = key_ps2;
        end
        I_wb: begin
            next_state=(wen_key_ps2 && trans_key_ps2==5'h11) ? I_ch : I_wb;
            inst_addr_n=(wen_key_ps2 && trans_key_ps2==5'h11) ? inst_addr+1:inst_addr;
            count_n='b0;
            inst_write_n=(wen_key_ps2 && trans_key_ps2==5'h11) ? 'b0 : inst_write;
            ap_start_n = 'b0;
            ALU_mode_n = 'b0;
            result_ready_n = 'b0;
            alu_a_n = 'b0;
            alu_b_n = 'b0;
            mat_a_n = 'b0;
            mat_b_n = 'b0;
            mode_flag_n = 'b0;
            prev_key_n = key_ps2;
        end
        I_rn: begin
            next_state = IDLE;
            inst_addr_n = 12'd31;
            count_n = 'b0;
            inst_write_n = 'b0;
            ap_start_n = 1'b1;
            ALU_mode_n = 'b0;
            result_ready_n = 'b0;
            alu_a_n = 'b0;
            alu_b_n = 'b0;
            mat_a_n = 'b0;
            mat_b_n = 'b0;
            mode_flag_n = 'b0;
            prev_key_n = key_ps2;
        end
        L_ch: begin // loads the typed keys into 
            next_state=(wen_key_uart && (~trans_key_uart[4]) && count_c==3) ? L_wb : ((wen_key_uart && trans_key_uart == 5'h18) ? L_rn : L_ch);
            inst_write_n=(wen_key_uart && (~trans_key_uart[4]) && count_c<4) ? {inst_write[11:0],trans_key_uart[3:0]} : inst_write;
            count_n=(wen_key_uart && (~trans_key_uart[4]) && count_c<4) ? count_c+1:count_c;
            inst_addr_n = inst_addr;
            ap_start_n = 'b0;
            ALU_mode_n = 'b0;
            result_ready_n = 'b0;
            alu_a_n = 'b0;
            alu_b_n = 'b0;
            mat_a_n = 'b0;
            mat_b_n = 'b0;
            mode_flag_n = 'b0;
            prev_key_n = key_ps2;
        end
        L_wb: begin
            next_state=(wen_key_uart && trans_key_uart==5'h11) ? L_ch : L_wb;
            inst_addr_n=(wen_key_uart && trans_key_uart==5'h11) ? inst_addr+1:inst_addr;
            count_n='b0;
            inst_write_n=(wen_key_uart && trans_key_uart==5'h11) ? 'b0 : inst_write;
            ap_start_n = 'b0;
            ALU_mode_n = 'b0;
            result_ready_n = 'b0;
            alu_a_n = 'b0;
            alu_b_n = 'b0;
            mat_a_n = 'b0;
            mat_b_n = 'b0;
            mode_flag_n = 'b0;
            prev_key_n = key_ps2;
        end
        L_rn: begin
            next_state = IDLE;
            inst_addr_n = 12'd31;
            count_n = 'b0;
            inst_write_n = 'b0;
            ap_start_n = 1'b1;
            ALU_mode_n = 'b0;
            result_ready_n = 'b0;
            alu_a_n = 'b0;
            alu_b_n = 'b0;
            mat_a_n = 'b0;
            mat_b_n = 'b0;
            mode_flag_n = 'b0;
            prev_key_n = key_ps2;
        end
        A_aa: begin
            next_state = (wen_key_ps2 && ~trans_key_ps2[4]) ? A_sh : A_aa;
            alu_a_n = (wen_key_ps2 && ~trans_key_ps2[4]) ? trans_key_ps2[3:0] : 'b0;
            alu_b_n = 'b0;
            ALU_mode_n = 'b0;

            //other
            inst_addr_n = 12'd31;
            count_n = 'b0;
            inst_write_n = 'b0;
            ap_start_n = 'b0;
            result_ready_n = 'b0;
            mat_a_n = 'b0;
            mat_b_n = 'b0;
            mode_flag_n = 'b0;
            prev_key_n = key_ps2;
        end
        A_sh: begin // UNFINISHED
            next_state = (wen_key_ps2 && (trans_key_ps2==5'h12 || trans_key_ps2==5'h13)) ? A_op : A_sh;
            alu_a_n = alu_a;
            alu_b_n = 'b0;
            ALU_mode_n = 'b0;
            result_ready_n = 'b0;

            //other
            inst_addr_n = 12'd31;
            count_n = 'b0;
            inst_write_n = 'b0;
            ap_start_n = 'b0;
            mat_a_n = 'b0;
            mat_b_n = 'b0;
            mode_flag_n = 'b0;
            prev_key_n = key_ps2;
        end
        A_op: begin
//            next_state = (wen_key_ps2 && (trans_key_ps2==5'h14 || trans_key_ps2==5'h15 || trans_key_ps2==5'h16 || trans_key_ps2==5'h17)) ? A_bb : A_op;
            next_state = (wen_key_ps2 && (trans_key_ps2==5'h06 || trans_key_ps2==5'h15 || trans_key_ps2==5'h16 || trans_key_ps2==5'h08)) ? A_bb : A_op;
            alu_a_n = alu_a;
            alu_b_n = 'b0;
            case(trans_key_ps2)
//                5'h14 : ALU_mode_n = (wen_key_ps2) ? 2'd0 : ALU_mode_c;
                5'h06 : ALU_mode_n = (wen_key_ps2) ? 2'd0 : ALU_mode_c;
                5'h15 : ALU_mode_n = (wen_key_ps2) ? 2'd1 : ALU_mode_c;
                5'h16 : ALU_mode_n = (wen_key_ps2) ? 2'd2 : ALU_mode_c;
//                5'h17 : ALU_mode_n = (wen_key_ps2) ? 2'd3 : ALU_mode_c;
                5'h08 : ALU_mode_n = (wen_key_ps2) ? 2'd3 : ALU_mode_c;
                default: ALU_mode_n = 'b0;
            endcase
            result_ready_n = 'b0;

            //other
            inst_addr_n = 12'd31;
            count_n = 'b0;
            inst_write_n = 'b0;
            ap_start_n = 'b0;
            mat_a_n = 'b0;
            mat_b_n = 'b0;
            mode_flag_n = 'b0;
            prev_key_n = key_ps2;
        end
        A_bb: begin
            next_state = (wen_key_ps2 && ~trans_key_ps2[4]) ? A_wb : A_bb;
            alu_a_n = alu_a;
            alu_b_n = (wen_key_ps2 && ~trans_key_ps2[4]) ? trans_key_ps2[3:0] : 'b0;
            ALU_mode_n = ALU_mode_c;
            result_ready_n = 'b0;

            //other
            inst_addr_n = 12'd31;
            count_n = 'b0;
            inst_write_n = 'b0;
            ap_start_n = 'b0;
            mat_a_n = 'b0;
            mat_b_n = 'b0;
            mode_flag_n = 'b0;
            prev_key_n = key_ps2;
        end
        A_wb: begin
            next_state = IDLE;
            alu_a_n = alu_a;
            alu_b_n = alu_b;
            ALU_mode_n = ALU_mode_c;
            result_ready_n = 1'b1;

            //other
            inst_addr_n = 12'd31;
            count_n = 'b0;
            inst_write_n = 'b0;
            ap_start_n = 'b0;
            mat_a_n = 'b0;
            mat_b_n = 'b0;
            mode_flag_n = 'b0;
            prev_key_n = key_ps2;
        end
        B_ma: begin
            next_state = (wen_key_ps2 && (~trans_key_ps2[4]) && count_c==8) ? B_mb : B_ma;
            count_n = (count_c<=8) ? ((wen_key_ps2 && (~trans_key_ps2[4])) ? count_c+1 : count_c) : 'b0;
            mat_a_n = (wen_key_ps2 && (~trans_key_ps2[4]) && count_c<9) ? {mat_a[31:0],trans_key_ps2[3:0]} : mat_a;
            mat_b_n = 'b0;
            result_ready_n = 'b0;

            //other
            inst_write_n = 'b0;
            inst_addr_n = 12'd31;
            ap_start_n = 'b0;
            ALU_mode_n = 'b0;
            alu_a_n = 'b0;
            alu_b_n = 'b0;
            mode_flag_n = 'b0;
            prev_key_n = key_ps2;
        end
        B_mb: begin
            next_state = (wen_key_ps2 && (~trans_key_ps2[4]) && count_c==8) ? B_wb : B_mb;
            count_n = (count_c<=8) ? ((wen_key_ps2 && (~trans_key_ps2[4])) ? count_c+1 : count_c) : 'b0;
            mat_a_n = mat_a;
            mat_b_n = (wen_key_ps2 && (~trans_key_ps2[4]) && count_c<9) ? {mat_b[31:0],trans_key_ps2[3:0]} : mat_b;
            result_ready_n = 'b0;

            //other
            inst_write_n = 'b0;
            inst_addr_n = 12'd31;
            ap_start_n = 'b0;
            ALU_mode_n = 'b0;
            alu_a_n = 'b0;
            alu_b_n = 'b0;
            mode_flag_n = 'b0;
            prev_key_n = key_ps2;
        end
        B_wb: begin
            next_state = IDLE;
            mat_a_n = mat_a;
            mat_b_n = mat_b;
            result_ready_n = 1'b1;

            //other
            inst_addr_n = 12'd31;
            count_n = 'b0;
            inst_write_n = 'b0;
            ap_start_n = 'b0;
            ALU_mode_n = 'b0;
            alu_a_n = 'b0;
            alu_b_n = 'b0;
            mode_flag_n = 'b0;
            prev_key_n = key_ps2;
        end
    endcase
end

// Mini ALU instantiation
mini_ALU ma(
    .a(alu_a),
    .b(alu_b),
    .alu_op(ALU_mode_c),
    .dout(alu_out)
);

// Matrix multiplier instantiation
mat3mult mm(
    .mat_in_a(mat_a),
    .mat_in_b(mat_b),
    .mat_out(bench_out)
);

endmodule