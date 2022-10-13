`timescale 1ns / 1ps

module datapath (
    input clk,
    input rst
);
    //----------- IF stage -----------//
    wire [15:0] INSTR_IFID, INSTR_IDEX;
    wire [11:0] PC_IFID, PC_IDEX;
    wire PCEN_IFID, PCEN_IDEX;

    Fetch_unit fetch_0(
        .clk(.clk),
        .Address(),
        .Instruction(INSTR_IDEX),
    );

    reg_param reg0 #(.SIZE(16+12+1)) (
        .clk(clk),
        .din({INSTR_IFID, PC_IFID, PCEN_IFID}),
        .dout({INSTR_IDEX, PC_IDEX, PCEN_IDEX})
    );

    //----------- ID stage -----------//
    wire [3:0] RM_IDEX, RN_IDEX;
    wire [15:0] RD1_IDEX, RD2_IDEX;
    wire [11:0] PC_IDEX;
    wire [3:0] OP_IDEX;
    wire [11:0] imm_IDEX;
    // wire [31:0] RM_EXMEM, RN_EXMEM;
    // wire [31:0] RM_MEMWB, RN_MEMRB;
    Decoder decoder_0(
        .Instr_in(INSTR_IDEX),
        .RM(RM_IDEX),
        .RN(RN_IDEX),
        .imm(imm_IDEX)
    );

    Register_file rf_0(
        .clk(clk),
        .rst(rst),
        .RS1(RM_IDEX),
        .RS2(RN_IDEX),
        .WS(),
        .WE(),
        .PC_IN(PC_IDEX),
        .PC_EN(PCEN_IDEX)
        .RD1(RD1_IDEX),
        .RD2(RD2_IDEX),
        .PC_OUT(PC_IDEX),
    );

    // EX stage
    ALU alu_0(

    );

    // Mem stage
    memory mem_0(

    );
    

endmodule