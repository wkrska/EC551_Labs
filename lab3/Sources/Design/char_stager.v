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
        input wire pop,
        output wire [7:0] char_out,
        output wire char_wen
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
    reg [4:0] count, count_n;
    
    reg [3:0] cs,ns;
    
    localparam [3:0]    IDLE       = 'h0, // also just passthrough mode
                        ALU_WAIT   = 'h1,
                        ALU_WRITE  = 'h2,
                        BNCH_WAIT  = 'h3,
                        BNCH_WRITE = 'h4,
                        BNCH_SPACE = 'h5,
                        NWLN       = 'hE,
                        CRTN       = 'hF;
                        
    localparam [2:0]    MODE_I     = 'h0,
                        MODE_L     = 'h1,
                        MODE_A     = 'h2,
                        MODE_B     = 'h3,
                        MODE_X     = 'h4;
    
    wire [7:0] hex_char;
    hex_to_ascii h2a(
        .in((cs===ALU_WRITE) ? alu_hold[7:4] : ((cs===BNCH_WRITE) ? bench_hold[3:0] : 4'b0)),
        .out(hex_char)
    );
    
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
            cs         <= ns        ;
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
            IDLE       : begin 
                case (mode) 
                    MODE_A : ns = ALU_WAIT;
                    MODE_B : ns = BNCH_WAIT;
                    default : ns = IDLE;
                endcase
                mode_hold_n  = MODE_X;
                alu_hold_n   = 'b0;
                bench_hold_n = 'b0;
                fifo_char_n  = 'b0;
                push_n       = 'b0;
                count_n      = 'b0;
            end
            ALU_WAIT   : begin 
                ns           = (result_ready) ? ALU_WRITE : ALU_WAIT;
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
                ns           = (result_ready) ? BNCH_WRITE : BNCH_WAIT;
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
                bench_hold_n = bench_hold >> 4;
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
                    MODE_B : ns = (count==5'd9) ? IDLE : BNCH_WRITE;
                    default: ns = IDLE;
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

    // newline FSM
    reg nl_c, nl_n;
    always @(posedge clk)
        nl_c <= (rst) ? 0 : nl_n;

    always @(*) begin
        case (nl_c)
            1'b0 : nl_n = ((wen_key_ps2 && key_ps2==8'hA) || (wen_key_uart && key_uart==8'hA)) ? 1'b1 : 1'b0; // if write_en and char is an enter;
            1'b1 : nl_n = 1'b0;
        endcase
    end

    wire empty;
    wire wr_en;
    wire [7:0] din;
    assign din = (nl_c) ? 8'hD : ((push) ? fifo_char : ((wen_key_ps2) ? key_ps2 : ((wen_key_uart) ? key_uart : 'b0)));
    assign wr_en = nl_c | push | wen_key_ps2 | wen_key_uart;
    assign char_wen = ~empty;
    fifo_8bit fifo (
       .clk(clk),      // input wire clk
       .rst(rst),    // input wire srst
       .din(din),      // input wire [7 : 0] din, if push is high, that measnt the FSM "wants" to write something, otherwise let the PS2 write something
       .push(wr_en),  // input wire wr_en
       .pop(pop),  // input wire rd_en
       .dout(char_out),    // output wire [7 : 0] dout
//       .full(full),    // output wire full
       .empty(empty)  // output wire empty
    );
   
endmodule
