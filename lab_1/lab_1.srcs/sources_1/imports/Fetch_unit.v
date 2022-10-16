`timescale 1ns / 1ps


module Fetch_unit(
    input wire clk, rst,
    input wire [15:0] PC_in, inst_in,
    input wire [11:0] imm_in,
    input wire ctrl_jump,
    output wire [15:0] inst_out, PC_out,
    output wire PC_en
    );
    
parameter BITSIZE = 32;
parameter REGSIZE = 16;

reg [BITSIZE-1:0] memory_file [0:REGSIZE-1];	// Entire list of memory

localparam [10:0] AND_Op   = 11'h450,
                  ADD_Op   = 11'h458,
                  ORR_Op   = 11'h550,
                  SUB_Op   = 11'h658,
                  STUR_Op  = 11'h7c0,
                  LDUR_Op  = 11'h7c2,
                  MOVK_Op  = 11'h794,
                  CBNZ_Op   = 11'h5a0,
                  BRA_Op   = 11'h0a0;

reg [4:0]  Rt_Sel, R1_Sel, R2_Sel;
localparam [5:0]  shamt = 6'b0;
reg [10:0] DT_Address;
reg [20:0] BRAN_Address;
reg [15:0] COND_Address, MOV_Immediate;

// Asyncronous read of memory. Was not specified.
always @(Address, memory_file[Address])
begin
	ReadData1 = memory_file[Address];
end


endmodule
