`timescale 1ns / 1ps

module datapath(
    input clk,
    input rst
);
    reg [31:0] RM_IFID, RN_IFID;
    reg [3:0] RM_IDEX, RN_IDEX;
    reg [11:0] imm_IDEX;
    reg [31:0] RM_EXMEM, RN_EXMEM;
    reg [31:0] RM_MEMWB, RN_MEMRB;

    // IF stage
    wire [15:0] inst_IF;
    Fetch_unit fetch_0(
        .clk(.clk),
        .Address(),
        .Instruction(inst_IF),
    );
    // ID stage

    Decoder decoder_0(
        .Instr_in(inst_IF),
        .RM(RM_IDEX),
        .RN(RN_IDEX),
        .imm(imm_IDEX)
    );

    Register_file rf_0(

    );

    // EX stage
    ALU alu_0(

    );

    // Mem stage
    memory mem_0(

    );
    

endmodule