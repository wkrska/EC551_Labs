`timescale 1ns / 1ps

module datapath (
    input clk,
    input rst,
    input [15:0] user_inst_write,
    input [11:0] user_inst_addr,
    input [3:0] disp_RS,
    input ap_start,
    output [15:0] disp_RD
);
    // Define ops
    localparam op_add  = 4'b0101; 
    localparam op_sub  = 4'b0110; 
    localparam op_inc  = 4'b0001; 
    localparam op_xor  = 4'b0111; 
    localparam op_cmp  = 4'b1000; 
    localparam op_mov0 = 4'b1001; // Rn, num
    localparam op_mov1 = 4'b1010; // Rn, Rm
    localparam op_mov2 = 4'b1011; // [Rn], Rm
    localparam op_mov3 = 4'b1100; // Rn, [Rm]
    localparam op_mov4 = 4'b1101; // [Rn], [Rm]
    localparam op_sadd = 4'b1110; 
    localparam op_jmp  = 4'b0010; 
    localparam op_jne  = 4'b0011; 
    localparam op_je   = 4'b0100;    
    localparam op_nop  = 4'b1111; 
    localparam op_halt = 4'b0000; 

    //--------- AP Start FSM ---------//
    wire halt_flag;
    reg ap_start_cs, ap_start_ns;
    always @(ap_start, rst, halt_flag) begin
        case (ap_start_cs)
            1'b0: ap_start_ns = (ap_start) ? 1'b1 : 1'b0;
            1'b1: ap_start_ns = (halt_flag || rst) ? 1'b0 : 1'b1;
        endcase
    end
    always @(posedge clk)
        ap_start_cs <= (rst) ? 1'b0 : ap_start_ns;
    
    //----------- IF stage -----------//
    wire [15:0] INST_next, INST_curr, INST_read;
    wire [11:0] PC_next, PC_curr;
    wire PC_en;

    wire [3:0]  RN_ID, RM_ID, OP_ID;
    wire [3:0]  RN_EX, RM_EX, OP_EX;
    wire [3:0]  RN_WB, RM_WB, OP_WB;

    wire [15:0] RF_D1_ID, RF_D2_ID, MEM_D_ID;
    wire [15:0] RF_D1_EX, RF_D2_EX, MEM_D_EX;
    wire [15:0] RF_D1_WB; // Would have target address for Move [Rn], [Rm]
    wire [11:0] imm_ID;

    wire [15:0] RES_EX, RES_WB;
    wire FLAG_EX, FLAG_WB;

    Fetch_unit fetch_0(
        .PC_in(PC_curr),
        .inst_in(INST_read),
        .imm_in(imm_ID),
        .ctrl_jump(FLAG_WB),
        .ctrl_nop((ap_start_cs == 1'b0) ? 1'b1 : 1'b0),
        .ctrl_ap_start(ap_start_cs),
        .inst_out(INST_next),
        .PC_out(PC_next),
        .PC_en(PC_en)
    );

    reg_param  #(.SIZE(16)) reg0 (
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
        .op(OP_ID),
        .imm(imm_ID)
    );

    wire RF_WE;
    assign RF_WE = (OP_WB != op_cmp) && (OP_WB != op_mov2) && (OP_WB != op_mov4) && (OP_WB != op_jmp) && (OP_WB != op_je) && (OP_WB != op_jne) && (OP_WB != op_nop) &&  (OP_WB != op_halt);
    Register_file rf_0(
        .clk(clk),
        .rst(rst),
        .RS1(RM_ID),
        .RS2(RN_ID),
        .disp_RS(disp_RS),
        .WS(RN_WB),
        .WD(RES_WB),
        .WE(RF_WE),
        .PC_IN(PC_next),
        .PC_EN(PC_en),
        .RD1(RF_D1_ID),
        .RD2(RF_D2_ID), // corresponds to RM
        .disp_RD(disp_RD),
        .PC_OUT(PC_curr)
    );

    wire MEM_WE;
    assign MEM_WE = (OP_WB == op_mov2) || (OP_WB == op_mov4);
    memory mem_0(
        .rst(rst),
        .raddr_i(PC_curr),
        .raddr_d(RF_D2_ID),
        .waddr((ap_start_cs == 1'b0) ? user_inst_addr : RF_D1_WB),
        .din((ap_start_cs == 1'b0) ? user_inst_write : RES_WB),
        .wen((ap_start_cs == 1'b0) ? 1'b1 : MEM_WE),
        .iout(INST_read),
        .dout(MEM_D_ID)
    );

    reg_param #(.SIZE(4+4+4+16+16+16)) reg1 (
        .clk(clk),
        .rst(rst),
        .din({RN_ID, RM_ID, OP_ID, RF_D1_ID, RF_D2_ID, MEM_D_ID}),
        .dout({RN_EX, RM_EX, OP_EX, RF_D1_EX, RF_D2_EX, MEM_D_EX})
    );

    //----------- EX stage -----------//
    ALU alu_0(
        .op(OP_EX),
        .din0(RF_D1_EX),
        .din1((OP_EX == 4'b0000) ? RF_D2_EX : MEM_D_EX),
        .Rm_in(),
        .mem_in(),
        .dout(RES_EX),
        .jump(FLAG_EX),
        .halt(halt_flag)
    );

    reg_param #(.SIZE(4+4+4+16+16+1)) reg2 (
        .clk(clk),
        .rst(rst),
        .din({RN_EX, RM_EX, OP_EX, RF_D1_EX, RES_EX, FLAG_EX}),
        .dout({RN_WB, RM_WB, OP_WB, RF_D1_WB, RES_WB, FLAG_WB})
    );

endmodule