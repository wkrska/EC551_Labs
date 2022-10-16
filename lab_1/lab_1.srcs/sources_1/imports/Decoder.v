`timescale 1ns / 1ps


module Decoder(
    input [15:0] Instr_in,
    output [5:0] Rm, Rn,
    output [5:0] op,
//    output [1:0] jmp_op,
    output [11:0] imm
    );

    assign op = Instr_in[15:12];
    assign Rn = Instr_in[09:06];
    assign Rm = Instr_in[03:00];
    assign imm = Instr_in[11:0];
    
endmodule
