`timescale 1ns / 1ps

`include "my_header.vh"

module data_loader(
    input wire clk,
    input wire rst,
    input wire [2:0] mode, // 0=I, 1=L, 2=A, 3=B
    input wire wen_mode,
    input wire [7:0] key,
    input wire wen_key,
    input wire run, // pulsed when 'r' is hit in mode 1,2
    output reg [11:0] inst_addr,
    output reg [15:0] inst_write,
    output wire [`dwidth_dat_user*2-1:0] alu_out,
    output wire [`dwidth_mat*3*3-1:0] bench_out,
    output reg result_ready
)

wire [3:0] trans_key;
// abridged LUT from key to hex
always @(key) begin
    case(key) // 0X is number, 1X is char
        8'h45 : assign trans_key = 5'h00;
        8'h16 : assign trans_key = 5'h01;
        8'h1e : assign trans_key = 5'h02;
        8'h26 : assign trans_key = 5'h03;
        8'h25 : assign trans_key = 5'h04;
        8'h2e : assign trans_key = 5'h05;
        8'h36 : assign trans_key = 5'h06;
        8'h3d : assign trans_key = 5'h07;
        8'h3e : assign trans_key = 5'h08;
        8'h46 : assign trans_key = 5'h09;
        8'h1c : assign trans_key = 5'h0a;
        8'h32 : assign trans_key = 5'h0b;
        8'h21 : assign trans_key = 5'h0c;
        8'h23 : assign trans_key = 5'h0d;
        8'h24 : assign trans_key = 5'h0e;
        8'h2b : assign trans_key = 5'h0f;
        8'h29 : assign trans_key = 5'h10; // [space]
        8'h5a : assign trans_key = 5'h11; // [newline]
        8'h12 : assign trans_key = 5'h12; // [L shift]
        8'h59 : assign trans_key = 5'h13; // [R shift]
        // 8'h36 : assign trans_key = 5'h14; // ^ (6)
        8'h55 : assign trans_key = 5'h15; // +
        8'h4e : assign trans_key = 5'h16; // -
        // 8'h3e : assign trans_key = 5'h17; // * (8) custom function
        8'h2d : assign trans_key = 5'h18; // r
        default: assign trans_key = 5'h1F; // D/C
    endcase
end

//----------- control FSM ----------//
reg [2:0] curr_state, next_state;

reg [3:0] count_c,count_n;
// Inst write
reg [`dwidth_dat-1:0] inst_write_n;
reg [`awidth_mem-1:0] inst_addr_n;
reg ap_start_c,ap_start_n;
// ALU
reg [1:0] ALU_mode_c,ALU_mode_n;
reg [`dwidth_dat_user-1:0] alu_a,alu_b,alu_a_n,alu_b_n;
reg result_ready_n;
// Benchmark
reg [`dwidth_mat*3*3-1:0] mat_a, mat_b, mat_a_n, mat_b_n;
//states
localparam [7:0]    IDLE=8'h00,
                    I_ch=8'h10, // first char entered, or run
                    I_wb=8'h11, // write inst on enter
                    I_rn=8'h12, // Start datapath
                    A_aa=8'h30, // First operand
                    A_sh=8'h31, // shift?
                    A_op=8'h32, // Operator
                    A_bb=8'h33, // Seond operand
                    A_wb=8'h34, // wb result
                    B_ma=8'h40, // loop until count, writing to first mat
                    B_mb=8'h41, // loop until connt, writing to second mat
                    B_wb=8'h42; // wb result
                    
// Clocked portion of FSM
always @(posedge clk) begin
    if (rst) begin
        curr_state <= 0;
        count_c <= 0;
        ap_start_c <= 0;
        ALU_mode_c <= 0;
        result_ready <= 0;
        inst_write <= 0;
        inst_addr <= 0;
        alu_a <= 0;
        alu_b <= 0;
        mat_a <= 0;
        mat_b <= 0;
    end else begin
        curr_state <= next_state;
        count_c <= count_n;
        ap_start_c <= ap_start_n;
        ALU_mode_c <= ALU_mode_n;
        result_ready <= result_ready_n;
        inst_write <= inst_write_n;
        inst_addr <= inst_addr_n;
        alu_a <= alu_a_n;
        alu_b <= alu_b_n;
        mat_a <= mat_a_n;
        mat_b <= mat_b_n;
    end
end

// Combinational FSM component
always @(*) begin
    case(curr_state)
        IDLE: begin
            case(mode)
                3'd0 : next_state = (wen_mode) ? I_ch : IDLE;
                // 3'd1 : next_state = (wen_mode) ? I_c0 : IDLE;
                3'd2 : next_state = (wen_mode) ? A_aa : IDLE;
                3'd3 : next_state = (wen_mode) ? B_ma : IDLE;
                3'd4 : next_state = (wen_mode) ? IDLE : IDLE;
                default: next_state = IDLE;
            endcase
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
            next_state=(wen_key && (~trans_key[4]) && count_c==3) ? I_wb : ((run) ? I_rn : I_ch);
            inst_write_n=(wen_key && (~trans_key[4]) && count_c<4) ? {inst_write[11:0],trans_key[3:0]} : inst_write;
            count_n=(wen_key && (~trans_key[4]) && count_c<4) ? count_c+1:count_c;
            inst_addr_n = inst_addr;
            ap_start_n = 'b0;
            ALU_mode_n = 'b0;
            result_ready_n = 'b0;
            alu_a_n = 'b0;
            alu_b_n = 'b0;
            mat_a_n = 'b0;
            mat_b_n = 'b0;
        end
        I_wb: begin
            next_state=(trans_key==5'h11) ? I_ch : I_wb;
            inst_addr_n=(trans_key==5'h11) ? inst_addr+1:inst_addr;
            count_n='b0;
            inst_write_n='b0;
            ap_start_n = 'b0;
            ALU_mode_n = 'b0;
            result_ready_n = 'b0;
            alu_a_n = 'b0;
            alu_b_n = 'b0;
            mat_a_n = 'b0;
            mat_b_n = 'b0;
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
        end
        A_aa: begin
            next_state = (wen_key && ~trans_key[4]) ? A_sh : A_aa;
            alu_a_n = (wen_key && ~trans_key[4]) ? trans_key[3:0] : 'b0;
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
        end
        A_sh: begin // UNFINISHED
            next_state = (wen_key && ~trans_key[4]) ? A_op : A_sh;
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
        end
        A_op: begin
            next_state = (wen_key && (trans_key==5'h14 || trans_key==5'h15 || trans_key==5'h16 || trans_key==5'h17)) ? A_bb : A_op;
            alu_a_n = alu_a;
            alu_b_n = 'b0;
            case(trans_key)
                5'h14 : ALU_mode_n = (wen_key) ? 2'd0 : ALU_mode_c;
                5'h15 : ALU_mode_n = (wen_key) ? 2'd1 : ALU_mode_c;
                5'h16 : ALU_mode_n = (wen_key) ? 2'd2 : ALU_mode_c;
                5'h17 : ALU_mode_n = (wen_key) ? 2'd3 : ALU_mode_c;
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
        end
        A_bb: begin
            next_state = (wen_key && ~trans_key[4]) ? A_wb : A_bb;
            alu_a_n = alu_a;
            alu_b_n = (wen_key && ~trans_key[4]) ? trans_key[3:0] : 'b0;
            ALU_mode_n = ALU_mode_c;
            result_ready_n = 'b0;

            //other
            inst_addr_n = 12'd31;
            count_n = 'b0;
            inst_write_n = 'b0;
            ap_start_n = 'b0;
            mat_a_n = 'b0;
            mat_b_n = 'b0;
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
        end
        B_ma: begin
            next_state = (wen_key && (~trans_key[4]) && count_c==8) ? B_mb : B_ma;
            count_n = (count_c<9) ? ((wen_key && (~trans_key[4])) ? count_c+1 : count_c) : 'b0;
            mat_a_n = (wen_key && (~trans_key[4]) && count_c<9) ? {mat_a[11:0],trans_key[3:0]} : mat_a;
            mat_b_n = 'b0;
            result_ready_n = 'b0;

            //other
            inst_write_n = 'b0;
            inst_addr_n = 12'd31;
            ap_start_n = 'b0;
            ALU_mode_n = 'b0;
            alu_a_n = 'b0;
            alu_b_n = 'b0;
        end
        B_mb: begin
            next_state = (wen_key && (~trans_key[4]) && count_c==8) ? B_wb : B_mb;
            count_n = (count_c<9) ? ((wen_key && (~trans_key[4])) ? count_c+1 : count_c) : 'b0;
            mat_a_n = mat_a;
            mat_b_n = (wen_key && (~trans_key[4]) && count_c<9) ? {mat_b[11:0],trans_key[3:0]} : mat_b;
            result_ready_n = 'b0;

            //other
            inst_write_n = 'b0;
            inst_addr_n = 12'd31;
            ap_start_n = 'b0;
            ALU_mode_n = 'b0;
            alu_a_n = 'b0;
            alu_b_n = 'b0;
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
            ap_start_n = 1'b1;
            ALU_mode_n = 'b0;
            alu_a_n = 'b0;
            alu_b_n = 'b0;
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