`timescale 1ns / 1ps


module Fetch_unit(
    input wire clk, rst,
    input wire [15:0] PC_in, inst_in,
    input wire [11:0] imm_in,
    input wire ctrl_jump, ctrl_nop, ctrl_ap_start,
    output wire [15:0] inst_out, PC_out,
    output wire PC_en
    );
    
    assign inst_out = (ctrl_nop) ? 16'b1111_000000_000000 : inst_in;
    assign PC_out = (ctrl_jump) ? {{4{1'b0}}, imm_in} : PC_in;
    assign PC_en = (ctrl_ap_start) ? 1'b0 : 1'b0;

endmodule
