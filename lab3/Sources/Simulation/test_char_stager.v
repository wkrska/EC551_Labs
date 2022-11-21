`timescale 1ns / 1ps

`include "my_header.vh"

module test_char_stager();
    reg clk;
    reg rst;
    reg [`dwidth_dat_user*2-1:0] alu_in;
    reg [`dwidth_mat*3*3-1:0] bench_in;
    reg result_ready;
    reg [7:0] key_ps2;
    reg wen_key_ps2;
    reg [7:0] key_uart;
    reg wen_key_uart;
    reg [2:0] mode;
    reg pop;
    wire [7:0] char_out;
    wire char_wen;

    

endmodule