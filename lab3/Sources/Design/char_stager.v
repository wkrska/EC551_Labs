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
        input wire [`dwidth_dat_user*2-1:0] alu_in,
        input wire [`dwidth_mat*3*3-1:0] bench_in,
        input wire result_ready,
        input wire [7:0] PS2_char,
        input wire [7:0] UART_char,
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
    
    localparam [3:0]    IDLE       = 'h0,
                        ALU_WAIT   = 'h1,
                        ALU_WRITE  = 'h2,
                        BNCH_WAIT  = 'h3
                        BCNH_WRITE = 'h4,
                        PS2_WAIT   = 'h5,
                        PS2_WRITE  = 'h6,
                        UART_WAIT  = 'h7,
                        UART_WRITE = 'h8,
                        NWLN       = 'hE,
                        CRTN       = 'hF;
    
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
            cs         <= cs_n        ;
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
                cs_n         =
                mode_hold_n  =
                alu_hold_n   =
                bench_hold_n =
                fifo_char_n  =
                push_n       =
                count_n      =
            end
            ALU_WAIT   : begin 
                cs_n         =
                mode_hold_n  =
                alu_hold_n   =
                bench_hold_n =
                fifo_char_n  =
                push_n       =
                count_n      =
            end
            ALU_WRITE  : begin 
                cs_n         =
                mode_hold_n  =
                alu_hold_n   =
                bench_hold_n =
                fifo_char_n  =
                push_n       =
                count_n      =
            end
            BNCH_WAIT  : begin 
                cs_n         =
                mode_hold_n  =
                alu_hold_n   =
                bench_hold_n =
                fifo_char_n  =
                push_n       =
                count_n      =
            end
            BCNH_WRITE : begin 
                cs_n         =
                mode_hold_n  =
                alu_hold_n   =
                bench_hold_n =
                fifo_char_n  =
                push_n       =
                count_n      =
            end
            PS2_WAIT   : begin 
                cs_n         =
                mode_hold_n  =
                alu_hold_n   =
                bench_hold_n =
                fifo_char_n  =
                push_n       =
                count_n      =
            end
            PS2_WRITE  : begin 
                cs_n         =
                mode_hold_n  =
                alu_hold_n   =
                bench_hold_n =
                fifo_char_n  =
                push_n       =
                count_n      =
            end
            UART_WAIT  : begin 
                cs_n         =
                mode_hold_n  =
                alu_hold_n   =
                bench_hold_n =
                fifo_char_n  =
                push_n       =
                count_n      =
            end
            UART_WRITE : begin 
                cs_n         =
                mode_hold_n  =
                alu_hold_n   =
                bench_hold_n =
                fifo_char_n  =
                push_n       =
                count_n      =
            end
            NWLN       : begin 
                cs_n         =
                mode_hold_n  =
                alu_hold_n   =
                bench_hold_n =
                fifo_char_n  =
                push_n       =
                count_n      =
            end
            CRTN       : begin 
                cs_n         =
                mode_hold_n  =
                alu_hold_n   =
                bench_hold_n =
                fifo_char_n  =
                push_n       =
                count_n      =
            end
        endcase
    end

    wire empty;
    assign char_wen = ~empty;
    ascii_char_fifo your_instance_name (
       .clk(clk),      // input wire clk
       .srst(rst),    // input wire srst
       .din(din),      // input wire [7 : 0] din
       .wr_en(push),  // input wire wr_en
       .rd_en(pop),  // input wire rd_en
       .dout(char_out),    // output wire [7 : 0] dout
//       .full(full),    // output wire full
       .empty(empty)  // output wire empty
    );
   
endmodule
