`timescale 1ns / 1ps

// `ifndef MY_HEADER
//     `define MY_HEADER
    `include "my_header.vh"
// `endif

module Fetch_unit(
    input wire clk, rst,
    input wire [`dwidth_dat-1:0] PC_in, inst_in,
    input wire [`awidth_mem-1:0] imm_in,
    input wire ctrl_jump, ctrl_nop, ctrl_ap_start,
    output wire [`dwidth_dat-1:0] inst_out, PC_out,
    output wire PC_en
    );
    
    assign inst_out = (ctrl_nop) ? 16'b1111_000000_000000 : inst_in;
    assign PC_out = (rst) ? 12'd32 : ((ctrl_jump) ? {{4{1'b0}}, imm_in} : PC_in + 1);
    assign PC_en = (ctrl_ap_start || rst) ? 1'b1 : 1'b0;

endmodule
