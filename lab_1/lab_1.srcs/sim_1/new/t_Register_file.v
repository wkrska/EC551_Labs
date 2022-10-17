`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2022 01:50:25 PM
// Design Name: 
// Module Name: t_Register_file
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


module t_Register_file(

    );
    reg         clk    ;
    reg         rst    ;
    reg  [3:0]  RS1    ;
    reg  [3:0]  RS2    ;
    reg  [3:0]  WS     ;
    reg  [15:0] WD     ;
    reg         WE     ;
    reg  [15:0] PC_IN  ;
    reg         PC_EN  ;
    wire [15:0] RD1    ;
    wire [15:0] RD2    ;
    wire [15:0] PC_OUT ;
    
    Register_File rf0 (
        .clk   (clk   ),
        .rst   (rst   ),
        .RS1   (RS1   ),
        .RS2   (RS2   ),
        .WS    (WS    ),
        .WD    (WD    ),
        .WE    (WE    ),
        .PC_IN (PC_IN ),
        .PC_EN (PC_EN ),
        .RD1   (RD1   ),
        .RD2   (RD2   ),
        .PC_OUT(PC_OUT)
    );
    
    initial begin
        
    end
endmodule
