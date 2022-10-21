`timescale 1ns / 1ps

// `ifndef MY_HEADER
//     `define MY_HEADER
    `include "my_header.vh"
// `endif

module Decoder(
    input [`dwidth_dat-1:0] Instr_in,
    output [`awidth_reg-1:0] Rm, Rn,
    output [`awidth_reg-1:0] op,
//    output [1:0] jmp_op,
    output [`awidth_mem-1:0] imm
    );

    assign op = Instr_in[15:12];
    assign Rn = Instr_in[11:06];
    assign Rm = Instr_in[05:00];
    assign imm = Instr_in[11:0];
    
endmodule
