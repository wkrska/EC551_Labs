`timescale 1ns / 1ps

// `ifndef MY_HEADER
//     `define MY_HEADER
    `include "my_header.vh"
// `endif

module Fetch_unit(
    input wire clk, rst,
    input wire [`dwidth_dat-1:0] PC_in, inst_in,
    input wire [`awidth_mem-1:0] imm_in,
    input wire jump_flag, ctrl_jump, ctrl_ap_start,
    output wire [`dwidth_dat-1:0] inst_out, PC_out,
    output wire PC_en
    );
    //---------- Stall FSM -----------//
    // Stalls the fetch unit
    reg [2:0] stall_cs, stall_ns;
    always @(*) begin
        case (stall_cs)
            2'b00: stall_ns = (jump_flag) ? 2'b01 : 2'b00;
            2'b01: stall_ns = 2'b10; // stall one clock
            2'b10: stall_ns = 2'b00; // stall one clock
//            2'b11: stall_ns = 2'b00; // stall one last clock
            
//            2'b00: stall_ns = (jump_flag) ? 2'b01 : 2'b00;
//            2'b01: stall_ns = 2'b00; // stall one clock
        endcase
    end
    always @(posedge clk)
        stall_cs <= (rst) ? 2'b00 : stall_ns;

    // Determine if NOP
    wire ctrl_nop;
    assign ctrl_nop = (!ctrl_ap_start || (|stall_ns) || (|stall_cs));

    // Assign outputs
    assign inst_out = (ctrl_nop) ? 16'b1111_110000_110000 : inst_in;
    assign PC_out = (rst) ? `inst_start : ((|stall_ns) ? PC_in : ((ctrl_jump) ? {{4{1'b0}}, imm_in} : ((|stall_cs) ? PC_in : PC_in + 1)));
    assign PC_en = (ctrl_ap_start || rst) ? 1'b1 : 1'b0;
    

endmodule
