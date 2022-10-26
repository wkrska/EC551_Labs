`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2022 12:11:02 PM
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

reg CLK100MHZ, rst, resume_btn;
reg [5:0] switch_RS;
wire [3:0] VGA_R, VGA_G, VGA_B;
wire VGA_HS, VGA_VS;


top   t1(
    .CLK100MHZ(CLK100MHZ),
    .rst(rst),
    .switch_RS(switch_RS),
    .resume_btn(resume_btn),
    .VGA_R(VGA_R),
    .VGA_G(VGA_G),
    .VGA_B(VGA_B),
    .VGA_HS(VGA_HS),
    .VGA_VS(VGA_VS)
);

initial begin
    CLK100MHZ = 0;
    rst = 0;
    switch_RS = 6'b0;
    resume_btn = 0;
    
    #1 rst = 1;
    #10 rst = 0;
    #110 resume_btn = 1; #10; resume_btn = 0;
    #50 resume_btn = 1; #10; resume_btn = 0;
    #50 resume_btn = 1; #10; resume_btn = 0;
    #250 resume_btn = 1; #10; resume_btn = 0;
//    resume = 1; #2; resume = 0; #2;
//    resume = 1; #2; resume = 0; #2;
//    resume = 1; #2; resume = 0; #2;
//    resume = 1; #2; resume = 0; #2;
//    resume = 1; #1000; resume = 0; // must change clk div to something like 50 in my_header
    
    #200;
    $finish;
    end
    
always 
    #1 CLK100MHZ = ~CLK100MHZ;
    
//initial
//    begin
//    #10 switch_RS = 6'b1;
//    #10000000 switch_RS = 6'b10;
//    #10000000 switch_RS = 6'b11;
//    #10000000 switch_RS = 6'b100;
//    #10000000 switch_RS = 6'b101;
//end

endmodule
