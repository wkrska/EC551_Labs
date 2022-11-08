`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2022 05:55:47 PM
// Design Name: 
// Module Name: t_term_interf_top
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


module t_term_interf_top();

    reg CLK100MHZ, rst;
    reg [15:0] SW;
    reg [4:0] BTN; 
    reg PS2_DATA;
    reg PS2_CLK;
    wire [15:0] LED;
    wire [7:0] SSEG_CA;
    wire [7:0] SSEG_AN;
    wire UART_TXD;

term_interf_top  t1(CLK100MHZ, rst,SW,BTN, PS2_DATA,PS2_CLK,LED,SSEG_CA, SSEG_AN,UART_TXD);

initial begin
    CLK100MHZ = 0;
    rst = 0;
    #1 rst = 1;
    #10 rst = 0;
    
    #200;
    #10 PS2_DATA = 1;
    #10 PS2_DATA = 0;
    
    $finish;
    end
    
always 
    #1 CLK100MHZ = ~CLK100MHZ;

endmodule
