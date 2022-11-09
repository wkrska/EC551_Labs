`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2022 05:22:38 PM
// Design Name: 
// Module Name: t_top
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


module t_top();
reg CLK100MHZ,
 PS2_CLK, 
PS2_DATA;
wire [6:0]SEG;
wire [7:0]AN;
wire DP,
 UART_TXD;


top t1(
     .CLK100MHZ(CLK100MHZ),
     .PS2_CLK(PS2_CLK),
     .PS2_DATA(PS2_DATA),
     .SEG(SEG),
     .AN(AN),
     .DP(DP),
     .UART_TXD(UART_TXD)
     );

always 
    #1 CLK100MHZ = ~CLK100MHZ;

initial begin
    CLK100MHZ = 0;
    #50 PS2_DATA = 


    #200;
    $finish;
    end



endmodule
