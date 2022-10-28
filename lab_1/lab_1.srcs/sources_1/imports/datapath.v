`timescale 1ns / 1ps

//`ifndef MY_HEADER
//    `define MY_HEADER
    `include "my_header.vh"
//`endif

module datapath (
    input clk,
    input rst,
    input [`dwidth_dat-1:0] user_inst_write,
    input [`awidth_mem-1:0] user_inst_addr,
    input [`awidth_reg-1:0] disp_RS,
    input ap_start, resume,
    output [`dwidth_dat-1:0] disp_RD,
    output [`dwidth_dat-1:0] disp_inst
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
    // starts datapath 
    reg ap_start_cs, ap_start_ns;
    always @(ap_start, rst) begin
        case (ap_start_cs)
            1'b0: ap_start_ns = (ap_start) ? 1'b1 : 1'b0;
            1'b1: ap_start_ns = (rst) ? 1'b0 : 1'b1;
        endcase
    end
    always @(posedge clk)
        ap_start_cs <= (rst) ? 1'b0 : ap_start_ns;

    // ---------- Halt FSM -----------//
    // Stalls entire datapath when a halt is encounterd by disconnecting the clock
    wire clk_local, halt_flag;
    reg clk_sel;
    assign clk_local = (clk_sel) ? clk : 'b0;
    reg [2:0] halt_cs, halt_ns;
    always @(*) begin
        case(halt_cs)
            2'b00 : begin // normal operation
                halt_ns = (halt_flag && ap_start_cs) ? 2'b01 : 2'b00;
                clk_sel = 1; // normal clk
            end
            2'b01 : begin // halted
                halt_ns = (resume) ? 2'b10 : halt_cs;
                clk_sel = 0; // halted clk
            end
            2'b10 : begin // 1 clk delay to clear halt flag
                clk_sel = 1;
                halt_ns = 0;
            end
            2'b11 : begin // 1 clk delay to clear halt flag
                clk_sel = 1;
                halt_ns = 0;
            end
        endcase
    end
    always @(posedge clk)
        halt_cs <= (rst) ? 2'b00 : halt_ns;

    
    //----------- IF stage -----------//
    wire [`dwidth_dat-1:0] INST_next, INST_curr, INST_read;
    wire [`dwidth_dat-1:0] PC_next, PC_curr;
    wire PC_en;

    wire [`awidth_reg-1:0]  RN_ID, RM_ID;
    wire [`awidth_reg-1:0]  RN_EX, RM_EX;
    wire [`awidth_reg-1:0]  RN_WB, RM_WB;

    wire [3:0] OP_ID;
    wire [3:0] OP_EX;
    wire [3:0] OP_WB;

    wire [`dwidth_dat-1:0] RF_D1_ID, RF_D2_ID, MEM_D_ID;
    wire [`dwidth_dat-1:0] RF_D1_EX, RF_D2_EX, MEM_D_EX;
    wire [`dwidth_dat-1:0] RF_D1_WB; // Would have target address for Move [Rn], [Rm]
    wire [`awidth_mem-1:0] imm_ID, imm_EX;

    wire [`dwidth_dat-1:0] RES_EX, RES_WB;
    wire JUMP_EX, JUMP_WB, jump_flag;

    Fetch_unit fetch_0(
        .clk(clk_local),
        .rst(rst),
        .PC_in(PC_curr),
        .inst_in(INST_read),
        .imm_in(RES_WB),
        .jump_flag(jump_flag), // Stalls while jump is evaluated
        .ctrl_jump(JUMP_WB),
        .ctrl_ap_start(ap_start_cs),
        .inst_out(INST_next),
        .PC_out(PC_next),
        .PC_en(PC_en)
    );

    reg_param  #(.SIZE(`dwidth_dat)) reg0 (
        .clk(clk_local),
        .rst(rst),
        .din(INST_next),
        .dout(INST_curr)
    );

    //----------- ID stage -----------//
    
    assign disp_inst = INST_curr;
    
    Decoder decoder_0(
        .Instr_in(INST_curr),
        .Rm(RM_ID),
        .Rn(RN_ID),
        .op(OP_ID),
        .imm(imm_ID),
        .jump_flag(jump_flag)
    );

    wire RF_WE;
    assign RF_WE = (OP_WB != op_cmp) && (OP_WB != op_mov2) && (OP_WB != op_mov4) && (OP_WB != op_jmp) && (OP_WB != op_je) && (OP_WB != op_jne) && (OP_WB != op_nop);
    Register_file rf_0(
        .clk(clk_local),
        .rst(rst),
        .RS1(RN_ID),
        .RS2((OP_ID == op_mov0 || OP_ID == op_nop) ? 6'b0 : RM_ID), // avoid X
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

    reg_param #(.SIZE(2*`awidth_reg+4+3*`dwidth_dat+2*`awidth_mem)) reg1 (
        .clk(clk_local),
        .rst(rst),
        .din({RN_ID, RM_ID, OP_ID, RF_D1_ID, RF_D2_ID, MEM_D_ID, imm_ID}),
        .dout({RN_EX, RM_EX, OP_EX, RF_D1_EX, RF_D2_EX, MEM_D_EX, imm_EX})
    );

    //----------- EX stage -----------//
    ALU alu_0(
        .rst(rst),
        .op(OP_EX),
        .din0((RN_EX==RN_WB && RF_WE) ? RES_WB : RF_D1_EX), // forward data destined to RN_EX and make sure data was destined to RF
        .din1((RM_EX==RN_WB && RF_WE) ? RES_WB : RF_D2_EX), // fprward data destined to RM_EX and make sure data was destined to RF
        .Rm_in(RM_EX),
        .mem_in((RF_D2_EX == RF_D1_WB && MEM_WE) ? RES_WB : MEM_D_EX), // forward data destined for mem
        .imm_in(imm_EX),
        .dout(RES_EX),
        .jump(JUMP_EX),
        .halt(halt_flag)
    );

    reg_param #(.SIZE(2*`awidth_reg+4+2*`dwidth_dat+1)) reg2 (
        .clk(clk_local),
        .rst(rst),
        .din({RN_EX, RM_EX, OP_EX, RF_D1_EX, RES_EX, JUMP_EX}),
        .dout({RN_WB, RM_WB, OP_WB, RF_D1_WB, RES_WB, JUMP_WB})
    );

endmodule