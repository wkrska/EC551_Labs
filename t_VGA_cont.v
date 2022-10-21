`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2022 05:31:46 PM
// Design Name: 
// Module Name: t_VGA_Controller
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


module t_VGA_Cont();

reg CLK100MHZ, rst;
reg [15:0] reg_value;
wire [3:0] VGA_R, VGA_G, VGA_B;
wire VGA_HS, VGA_VS;

top_VGA   t1(reg_value, CLK100MHZ, rst, VGA_R, VGA_G, VGA_B, VGA_HS, VGA_VS);

initial
begin
#0 CLK100MHZ = 0;
#0 rst = 0;
#0 reg_value = 16'h0;
#1 rst = 1;
#100 rst = 0;
end
always 
#1 CLK100MHZ = ~CLK100MHZ;
initial
begin
#10 reg_value = 16'h1;
#10000000 reg_value = 16'h0015;
#10000000 reg_value = 16'h03bc;
#10000000 reg_value = 16'h5e60;
#10000000 reg_value = 16'ha53f;
end


endmodule
