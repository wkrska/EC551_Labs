`timescale 1ns / 1ps

module datapath (
    input clk,
    input rst
);
    //----------- IF stage -----------//
    wire [15:0] INST_next, INST_curr, INST_read;
    wire [11:0] PC_next, PC_curr;
    wire PC_en;

    wire [3:0]  RN_ID, RM_ID, OP_ID;
    wire [3:0]  RN_EX, RM_EX, OP_EX;
    wire [3:0]  RN_WB, RM_WB, OP_WB;
    wire [15:0] RF_D1_ID, RF_D2_ID, MEM_D_ID;
    wire [15:0] RF_D1_EX, RF_D2_EX, MEM_D_EX;
    wire [15:0] RF_D1_WB // Would have target address for Move [Rn], [Rm]
    wire [11:0] imm_ID;

    wire [15:0] RES_EX, RES_WB;
    wire FLAG_EX, FLAG_WB;

    Fetch_unit fetch_0(
        .PC_in(PC_curr),
        .inst_in(INST_read),
        .imm_in(imm_ID),
        .ctrl_jump(FLAG_WB),
        .ctrl_nop(0),
        .inst_out(INST_next),
        .PC_out(PC_next),
        .PC_en(PC_en),
    );

    reg_param reg0 #(.SIZE(16)) (
        .clk(clk),
        .rst(rst),
        .din(INST_next),
        .dout(INST_curr)
    );

    //----------- ID stage -----------//
    

    Decoder decoder_0(
        .Instr_in(INST_curr),
        .Rm(RM_ID),
        .Rn(RN_ID),
        .op(OP_ID)
        .imm(imm_ID)
    );

    Register_file rf_0(
        .clk(clk),
        .rst(rst),
        .RS1(RM_ID),
        .RS2(RN_ID),
        .WS(RN_WB),
        .WD(RES_WB),
        .WE((OP_WB == 4'b000) ? 1 : 0),
        .PC_IN(PC_next),
        .PC_EN(PC_en)
        .RD1(RF_D1_ID),
        .RD2(RF_D2_ID), // corresponds to RM
        .PC_OUT(PC_curr),
    );

    memory mem_0(
        .rst(rst),
        .raddr_i(PC_curr),
        .raddr_d(RF_D2_ID),
        .waddr(RF_D1_WB),
        .din(RES_WB),
        .wen((OP_WB == 4'b0000) ? 1 : 0),
        .iout(INST_read),
        .dout(MEM_D_ID)
    );

    reg_param reg1 #(.SIZE(4+4+4+16+16+16)) (
        .clk(clk),
        .rst(rst),
        .din({RN_ID, RM_ID, OP_ID, RF_D1_ID, RF_D2_ID, MEM_D_ID}),
        .dout({RN_EX, RM_EX, OP_EX, RF_D1_EX, RF_D2_EX, MEM_D_EX})
    );

    //----------- EX stage -----------//
    ALU alu_0(
        .op(OP_EX),
        .din0(RF_D1_EX),
        .din1((OP_EXWB == 4'b0000) ? RF_D2_EX : MEM_D_EX),
        .dout(RES_EX)
    );

    reg_param reg2 #(.SIZE(4+4+4+16+16+1)) (
        .clk(clk),
        .rst(rst),
        .din({RN_EX, RM_EX, OP_EX, RF_D1_EX, RES_EX, FLAG_EX}),
        .dout({RN_WB, RM_WB, OP_WB, RF_D1_WB, RES_WB, FLAG_WB})
    );

endmodule