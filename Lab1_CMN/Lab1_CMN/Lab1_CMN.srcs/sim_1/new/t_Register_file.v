`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2022 03:42:29 PM
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

    reg [5:0] ReadSelect1, ReadSelect2, WriteSelect;
    reg [15:0] WriteData;
    reg WriteEnable;
    wire [15:0] ReadData1, ReadData2;
    reg clk, rst;
    
    Register_file uut(.ReadSelect1(ReadSelect1), .ReadSelect2(ReadSelect2), .WriteSelect(WriteSelect), .WriteData(WriteData), .WriteEnable(WriteEnable), .ReadData1(ReadData1), .ReadData2(ReadData2), .clk(clk), .rst(rst));
    
    
    initial
    begin
        #0 rst = 1;
        #1 rst = 0;
        #0 ReadSelect1 = 6'b0;
        #0 ReadSelect2 = 6'b0;
        #0 WriteSelect = 6'b0;
        #0 WriteData = 16'b0;
        #0 WriteEnable = 0;
        clk = 0;
        end
        always 
        #10 clk = ~clk;
        initial 
        begin
         #30 WriteData = 16'b1;
         #5 WriteSelect = 6'b1;
         #5 WriteEnable = 1;
         #20 ReadSelect1 = 6'b1;
         #10 ReadSelect2 = 6'b10;
         #5 WriteEnable = 0;
         #5 WriteData = 16'b11;
         #5 WriteSelect = 6'b10;
         #5 WriteEnable = 1;
         #5 WriteEnable = 0;
         #10 ReadSelect1 = 6'b11;
         #10 WriteSelect = 6'b11;
         #5 WriteEnable = 1;
        #100 $finish;
        end
    
endmodule
