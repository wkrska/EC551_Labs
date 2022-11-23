`timescale 1ns / 1ps

// `ifndef MY_HEADER
//     `define MY_HEADER
    `include "my_header.vh"
// `endif

module Decoder(
    input  [`dwidth_dat-1:0] Instr_in,
    output [`awidth_reg-1:0] Rm, Rn,
    output [`awidth_reg-1:0] op,
    output jump_flag,
    output [`awidth_mem-1:0] imm
    );
    
    localparam [3:0] op_jmp  = 4'b0010; 
    localparam [3:0] op_jne  = 4'b0011; 
    localparam [3:0] op_je   = 4'b0100;    

    assign op = Instr_in[15:12];
    assign Rn = Instr_in[11:06];
    assign Rm = Instr_in[05:00];
    assign imm = Instr_in[11:0];
    assign jump_flag = (op==op_jmp||op==op_je||op==op_jne) ? 1'b1 : 1'b0;
endmodule
