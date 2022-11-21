`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2022 03:21:11 PM
// Design Name: 
// Module Name: char_stager
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


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
    reg fifo_char, fifo_char_n;
    reg push, push_n;
    reg [4:0] count, count_n;
    
    case [3:0] cs,ns;
    
    localparam [3:0]    IDLE       = 'h0, // also just passthrough mode
                        ALU_WAIT   = 'h1,
                        ALU_WRITE  = 'h2,
                        BNCH_WAIT  = 'h3,
                        BCNH_WRITE = 'h4,
                        BCNH_SPACE = 'h5,
                        NWLN       = 'hE,
                        CRTN       = 'hF,
                        MODE_I     = 'h0,
                        MODE_L     = 'h1,
                        MODE_A     = 'h2,
                        MODE_B     = 'h3;
    
    wire [7:0] hex_char;
    hex_to_ascii h2a(
        .in((cs==ALU_WRITE) ? alu_hold[3:0] : (cs==BENCH_WRITE) ? bench_hold[3:0] : 4'b0),
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
                    MODE_B : ns = BENCH_WAIT;
                    default : ns = IDLE;
                endcase
                mode_hold_n  = 'b0;
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
                alu_hold_n   = alu_hold >> 4;
                bench_hold_n = 'b0;
                fifo_char_n  = hex_char
                push_n       = 'b1;
                count_n      = count+1;
            end
            BNCH_WAIT  : begin 
                ns           = (result_ready) ? BCNH_WRITE : BNCH_WAIT;
                mode_hold_n  = MODE_B;
                alu_hold_n   = 'b0;
                bench_hold_n = (result_ready) ? bench_in : 'b0;
                fifo_char_n  = 'b0;
                push_n       = 'b0;
                count_n      = 'b0;
            end
            BCNH_WRITE : begin 
                ns           = (count%3<2) ? BNCH_SPACE : NWLN;
                mode_hold_n  = MODE_B;
                alu_hold_n   = 'b0;
                bench_hold_n = bench_hold >> 4;
                fifo_char_n  = hex_char
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
                ns           = CRTN
                mode_hold_n  = mode_hold;
                alu_hold_n   = alu_hold;
                bench_hold_n = bench_hold;
                fifo_char_n  = 8'hA;
                push_n       = 'b1;
                count_n      = count;
            end
            CRTN       : begin 
                case (mode_hold)
                    MODE_B : ns = (count==8) ? IDLE : BNCH_WRITE;
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

    wire empty;
    assign char_wen = ~empty;
    ascii_char_fifo your_instance_name (
       .clk(clk),      // input wire clk
       .srst(rst),    // input wire srst
       .din((push) ? fifo_char : ((wen_key_ps2) ? key_ps2 : ((wen_key_uart) ? key_uart : 'b0))),      // input wire [7 : 0] din, if push is high, that measnt the FSM "wants" to write something, otherwise let the PS2 write something
       .wr_en(push | wen_key_ps2 | wen_key_uart),  // input wire wr_en
       .rd_en(pop),  // input wire rd_en
       .dout(char_out),    // output wire [7 : 0] dout
//       .full(full),    // output wire full
       .empty(empty)  // output wire empty
    );
   
endmodule
