`timescale 1ns / 1ps

`include "my_header.vh"


// takes the input from UART and generates a sustained key value and pulsed wen on the PS/2 clk
module uart_arbiter(
    input clk_100,
    input clk_ps2,
    input rst,
    input [7:0] uart_dat,
    input uart_dv,
    output uart_dat_sus,
    output uart_wen
);