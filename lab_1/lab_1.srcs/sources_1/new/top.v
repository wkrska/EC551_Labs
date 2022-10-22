`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2022 11:03:55 AM
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(
    input wire CLK100MHZ, rst, resume_btn,
    input wire [5:0] switch_RS,
    output wire [3:0] VGA_R,
    output wire [3:0] VGA_G,
    output wire [3:0] VGA_B,
    output wire VGA_HS,
    output wire VGA_VS
);

wire [15:0] register_data;
wire ap_start_ROM;
wire [11:0] user_inst_addr_ROM;
wire [15:0] user_inst_write_ROM;
wire resume;

btn_edge btn(
    .reset(rst),
    .btnIn(resume_btn),
    .CLK(CLK100MHZ),
    .btnOut(resume)
    );

datapath dp1(
    .clk(CLK100MHZ),
    .rst(rst),
    .resume(resume),
    .user_inst_write(user_inst_write_ROM),
    .user_inst_addr(user_inst_addr_ROM),
    .disp_RS(switch_RS),
    .ap_start(ap_start_ROM),
    .disp_RD(register_data)
    );
    
inst_ROM  ROM1(
    .clk(CLK100MHZ),
    .rst(rst),
    .ap_start(ap_start_ROM),
    .user_inst_addr(user_inst_addr_ROM),
    .user_inst_write(user_inst_write_ROM)
    );
    
top_VGA  VGA1(
    .reg_value(register_data),
    .CLK100MHZ(CLK100MHZ),
    .rst(rst),
    .VGA_R(VGA_R),
    .VGA_G(VGA_G),
    .VGA_B(VGA_B),
    .VGA_HS(VGA_HS),
    .VGA_VS(VGA_VS)
    );


endmodule
