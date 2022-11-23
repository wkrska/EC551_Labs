`timescale 1ns / 1ps

`include "my_header.vh"

module char_stager(
        input wire clk,
        input wire rst,

        // generated data in
        input wire [`dwidth_dat_user*2-1:0] alu_in,
        input wire [`dwidth_mat*3*3-1:0] bench_in,
        input wire result_ready,

        // user data in
        input wire [7:0] key_ps2,
        input wire wen_key_ps2,
        input wire [7:0] key_uart,
        input wire wen_key_uart,

        // control
        input wire [2:0] mode,
        input wire mode_flag,
        input wire pop,
        output wire [7:0] char_out,
        output reg char_wen,
        output wire [3:0] debug_state,
        output wire [7:0] count_debug
    );
    
    // functionality spec
    //      This takes in a variety of inputs, then pushes all of their values to the FIFO in the order that they should be written to the display as ASCII
    //      For bench in, it will insert the appropriate spaces and new lines
    //      For ALU in, it just splits up the
    reg [2:0] mode_hold, mode_hold_n;
    reg [`dwidth_dat_user*2-1:0] alu_hold, alu_hold_n;
    reg [`dwidth_mat*3*3-1:0] bench_hold, bench_hold_n;
    reg [7:0] fifo_char, fifo_char_n;
    reg push, push_n;
    reg [7:0] count, count_n;
    assign count_debug = count;
    reg [3:0] cs,ns;
    
    // States
    localparam [3:0]    WLCM       = 'h0,
                        IDLE       = 'h1,
                        I_INST     = 'h2,
                        L_INST     = 'h3,
                        A_INST     = 'h4,
                        B_INST     = 'h5, 
                        X_INST     = 'h6,
                        ALU_WAIT   = 'h7,
                        ALU_WRITE  = 'h8,
                        BNCH_WAIT  = 'h9,
                        BNCH_WRITE = 'hA,
                        BNCH_SPACE = 'hB,
                        NWLN       = 'hE,
                        CRTN       = 'hF;
    
    // Modes
    localparam [2:0]    MODE_I     = 'h0,
                        MODE_L     = 'h1,
                        MODE_A     = 'h2,
                        MODE_B     = 'h3,
                        MODE_X     = 'h4;

    // Lengths
    localparam [7:0]    len_wlcm   = 'd58,
                        len_I      = 'd30,
                        len_L      = 'd39,
                        len_A      = 'd32,
                        len_B      = 'd29,
                        len_X      = 'd18;
                
//    reg [7:0] msg_wlcm [len_wlcm-1:0];
//    reg [7:0] msg_I    [len_I   -1:0];
//    reg [7:0] msg_L    [len_L   -1:0];
//    reg [7:0] msg_A    [len_A   -1:0];
//    reg [7:0] msg_B    [len_B   -1:0];
//    reg [7:0] msg_X    [len_X   -1:0];
    
        // Messages
    reg [58*8-1:0] msg_wlcm = {8'h0A,8'h0D,8'h48,8'h65,8'h6C,8'h6C,8'h6F,8'h20,8'h45,8'h43,8'h35,8'h35,8'h31,8'h2E,8'h20,8'h4D,8'h79,8'h20,8'h6E,8'h61,8'h6D,8'h65,8'h20,8'h69,8'h73,8'h20,8'h57,8'h69,8'h6C,8'h6C,8'h43,8'h6F,8'h6E,8'h2E,8'h0A,8'h0D,8'h50,8'h6C,8'h65,8'h61,8'h73,8'h65,8'h20,8'h65,8'h6E,8'h74,8'h65,8'h72,8'h20,8'h61,8'h20,8'h6D,8'h6F,8'h64,8'h65,8'h3A,8'h0A,8'h0D};						  
    reg [30*8-1:0] msg_I    = {8'h0A,8'h0D,8'h4D,8'h6F,8'h64,8'h65,8'h20,8'h49,8'h3A,8'h20,8'h45,8'h6E,8'h74,8'h65,8'h72,8'h20,8'h49,8'h6E,8'h73,8'h74,8'h72,8'h75,8'h63,8'h74,8'h69,8'h6F,8'h6E,8'h73,8'h0A,8'h0D};
    reg [39*8-1:0] msg_L    = {8'h0A,8'h0D,8'h4D,8'h6F,8'h64,8'h65,8'h20,8'h4C,8'h3A,8'h20,8'h4C,8'h6F,8'h61,8'h64,8'h20,8'h49,8'h6E,8'h73,8'h74,8'h72,8'h75,8'h63,8'h74,8'h69,8'h6F,8'h6E,8'h73,8'h20,8'h66,8'h72,8'h6F,8'h6D,8'h20,8'h55,8'h41,8'h52,8'h54,8'h0A,8'h0D};
    reg [32*8-1:0] msg_A    = {8'h0A,8'h0D,8'h4D,8'h6F,8'h64,8'h65,8'h20,8'h41,8'h3A,8'h20,8'h52,8'h75,8'h6E,8'h20,8'h61,8'h6E,8'h20,8'h41,8'h4C,8'h55,8'h20,8'h6F,8'h70,8'h65,8'h72,8'h61,8'h74,8'h69,8'h6F,8'h6E,8'h0A,8'h0D};
    reg [29*8-1:0] msg_B    = {8'h0A,8'h0D,8'h4D,8'h6F,8'h64,8'h65,8'h20,8'h42,8'h3A,8'h20,8'h42,8'h65,8'h6E,8'h63,8'h68,8'h6D,8'h61,8'h72,8'h6B,8'h20,8'h50,8'h72,8'h6F,8'h67,8'h72,8'h61,8'h6D,8'h0A,8'h0D};
    reg [18*8-1:0] msg_X    = {8'h0A,8'h0D,8'h49,8'h6E,8'h76,8'h61,8'h6C,8'h69,8'h64,8'h20,8'h45,8'h6E,8'h74,8'h72,8'h79,8'h21,8'h0A,8'h0D};
  
    wire [7:0] hex_char;
    hex_to_ascii h2a(
        .in((cs===ALU_WRITE) ? alu_hold[7:4] : ((cs===BNCH_WRITE) ? bench_hold[35:32] : 4'b0)),
        .out(hex_char)
    );
    assign debug_state = cs;
    always @(posedge clk) begin
        if (rst) begin
            cs <= 'b0;
            mode_hold <= 'b0;
            alu_hold <= 'b0;
            bench_hold <= 'b0;
            fifo_char <= 'b0;
            push <= 'b0;
            count <= 'b0;
        end else begin
            cs         <= ns          ;
            mode_hold  <= mode_hold_n ;
            alu_hold   <= alu_hold_n  ;
            bench_hold <= bench_hold_n;
            fifo_char  <= fifo_char_n ;
            push       <= push_n      ;
            count      <= count_n     ;
        end
    end


    always @(*) begin
        case (cs)
            WLCM     : begin 
                ns          = (count<len_wlcm-1) ? WLCM : IDLE;
                mode_hold_n = MODE_I;
                alu_hold_n  = 'b0;
                bench_hold_n= 'b0;
                fifo_char_n = msg_wlcm[8*(len_wlcm-count)-1 -: 8];
                push_n      = 'b1;
                count_n     = count+1;
            end
            IDLE       : begin 
                if (mode_flag) begin
                    case (mode) 
                        MODE_I : ns = I_INST;
                        MODE_L : ns = L_INST;
                        MODE_A : ns = A_INST;
                        MODE_B : ns = B_INST;
                        default : ns = X_INST;
                    endcase
                end else begin
                    ns = IDLE;
                end
                mode_hold_n  = MODE_X;
                alu_hold_n   = 'b0;
                bench_hold_n = 'b0;
                fifo_char_n  = 'b0;
                push_n       = 'b0;
                count_n      = 'b0;
            end
            I_INST     : begin 
                ns          = (count<len_I-1) ? I_INST : IDLE;
                mode_hold_n = MODE_I;
                alu_hold_n  = 'b0;
                bench_hold_n= 'b0;
                fifo_char_n = msg_I[8*(len_I-count)-1 -: 8];
                push_n      = 'b1;
                count_n     = count+1;
            end
            L_INST     : begin 
                ns          = (count<len_L-1) ? L_INST : IDLE;
                mode_hold_n = MODE_L;
                alu_hold_n  = 'b0;
                bench_hold_n= 'b0;
                fifo_char_n = msg_L[8*(len_L-count)-1 -: 8];
                push_n      = 'b1;
                count_n     = count+1;
            end
            A_INST     : begin 
                ns          = (count<len_A-1) ? A_INST : ALU_WAIT;
                mode_hold_n = MODE_A;
                alu_hold_n  = 'b0;
                bench_hold_n= 'b0;
                fifo_char_n = msg_A[8*(len_A-count)-1 -: 8];
                push_n      = 'b1;
                count_n     = count+1;
            end
            B_INST     : begin 
                ns          = (count<len_B-1) ? B_INST : BNCH_WAIT;
                mode_hold_n = MODE_B;
                alu_hold_n  = 'b0;
                bench_hold_n= 'b0;
                fifo_char_n = msg_B[8*(len_B-count)-1 -: 8];
                push_n      = 'b1;
                count_n     = count+1;
            end
            X_INST     : begin 
                ns          = (count<len_X-1) ? X_INST : IDLE;
                mode_hold_n = MODE_X;
                alu_hold_n  = 'b0;
                bench_hold_n= 'b0;
                fifo_char_n = msg_X[8*(len_X-count)-1 -: 8];
                push_n      = 'b1;
                count_n     = count+1;
            end
            ALU_WAIT   : begin 
                ns           = (result_ready) ? NWLN : ALU_WAIT;
                mode_hold_n  = MODE_A;
                alu_hold_n   = (result_ready) ? alu_in : 'b0;
                bench_hold_n = 'b0;
                fifo_char_n  = 'b0;
                push_n       = 'b0;
                count_n      = 'b0;
            end
            ALU_WRITE  : begin 
                ns           = (count == 'b1) ? NWLN : ALU_WRITE;
                mode_hold_n  = MODE_A;
                alu_hold_n   = alu_hold << 4;
                bench_hold_n = 'b0;
                fifo_char_n  = hex_char;
                push_n       = 'b1;
                count_n      = count+1;
            end
            BNCH_WAIT  : begin 
                ns           = (result_ready) ? NWLN : BNCH_WAIT;
                mode_hold_n  = MODE_B;
                alu_hold_n   = 'b0;
                bench_hold_n = (result_ready) ? bench_in : 'b0;
                fifo_char_n  = 'b0;
                push_n       = 'b0;
                count_n      = 'b0;
            end
            BNCH_WRITE : begin 
                ns           = (count%3<2) ? BNCH_SPACE : NWLN;
                mode_hold_n  = MODE_B;
                alu_hold_n   = 'b0;
                bench_hold_n = bench_hold << 4;
                fifo_char_n  = hex_char;
                push_n       = 'b1;
                count_n      = count+1;
            end
            BNCH_SPACE : begin
                ns           = BNCH_WRITE;
                mode_hold_n  = MODE_B;
                alu_hold_n   = alu_hold;
                bench_hold_n = bench_hold;
                fifo_char_n  = 8'h20;
                push_n       = 'b1;
                count_n      = count;
            end
            NWLN       : begin 
                ns           = CRTN;
                mode_hold_n  = mode_hold;
                alu_hold_n   = alu_hold;
                bench_hold_n = bench_hold;
                fifo_char_n  = 8'hA;
                push_n       = 'b1;
                count_n      = count;
            end
            CRTN       : begin 
                case (mode_hold)
                    MODE_A : ns = (count==0) ? ALU_WRITE : WLCM;
                    MODE_B : ns = (count==5'd9) ? WLCM : BNCH_WRITE;
                    default: ns = WLCM;
                endcase
                mode_hold_n  = mode_hold;
                alu_hold_n   = alu_hold;
                bench_hold_n = bench_hold;
                fifo_char_n  = 8'hD;
                push_n       = 'b1;
                count_n      = count;
            end
        endcase
    end

    // newline FSM(s)
    reg cr_c, cr_n;
    always @(posedge clk)
        cr_c <= (rst) ? 0 : cr_n;

    always @(*) begin
        case (cr_c)
            1'b0 : cr_n = (wen_key_ps2 && key_ps2==8'hA) ? 1'b1 : 1'b0; // if write_en and char is an enter;
            1'b1 : cr_n = 1'b0;
        endcase
    end

    reg nl_c, nl_n;
    always @(posedge clk)
        nl_c <= (rst) ? 0 : nl_n;

    always @(*) begin
        case (nl_c)
            1'b0 : nl_n = (wen_key_uart && key_uart==8'hD) ? 1'b1 : 1'b0; // if write_en and char is a carriage return;
            1'b1 : nl_n = 1'b0;
        endcase
    end

    
    // read FSM
    reg [1:0] rd_c, rd_n;
    always @(posedge clk)
        rd_c <= (rst) ? 'b0 : rd_n;

    always @(*) begin
        case (rd_c)
            'h0: rd_n = (pop) ? 'h1 : 'h0;
            'h1: rd_n = 'h2;
            'h2: rd_n = (~pop) ? 'h0 : 'h2;
        endcase
    end

    wire empty;
    wire wr_en;
    wire [7:0] din;
    assign din = (nl_c) ? 8'hA : ((cr_c) ? 8'hD : ((push) ? fifo_char : ((wen_key_ps2) ? key_ps2 : ((wen_key_uart) ? key_uart : 'b0))));
    assign wr_en = nl_c | cr_c | push | wen_key_ps2 | wen_key_uart;
    always @(*)
        char_wen = (rd_c==2'h2) && ~empty;
    fifo_8bit fifo (
       .clk(clk),      // input wire clk
       .rst(rst),    // input wire srst
       .din(din),      // input wire [7 : 0] din, if push is high, that measnt the FSM "wants" to write something, otherwise let the PS2 write something
       .push(wr_en),  // input wire wr_en
       .pop(pop && (rd_c=='h0)),  // input wire rd_en
       .dout(char_out),    // output wire [7 : 0] dout
//       .full(full),    // output wire full
       .empty(empty)  // output wire empty
    );
    
    
    
  

   
endmodule
