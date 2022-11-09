`timescale 1ns / 1ps

`include "my_header.vh"

module inst_loader(
    input wire [7:0] key_in,
    input wire wen_in,
    output reg [11:0] user_inst_addr,
    output reg [15:0] user_inst_write
)

wire [3:0] trans_key
// LUT from key to hex
