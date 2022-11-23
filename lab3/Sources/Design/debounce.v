`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2020 01:48:46 PM
// Design Name: 
// Module Name: debounce
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
`include "my_header.vh"

module debounce(
    input pb_1, clk, rst,
    output pb_out
    );
    
    wire slow_clk;
    wire Q1,Q2,Q2_bar,Q0;
    
    clock_div u1(clk,rst,slow_clk);
    my_dff d0(slow_clk,rst, pb_1, Q0 );
    
    my_dff d1(slow_clk,rst, Q0, Q1 );
    my_dff d2(slow_clk,rst, Q1,Q2 );
    assign Q2_bar = ~Q2;
    assign pb_out = Q1 & Q2_bar;
endmodule

// Slow clock for debouncing 
module clock_div(input Clk_100M, rst, output reg slow_clk);
    reg [26:0] counter=0;
    always @(posedge Clk_100M)
    begin
        counter <= (counter>=(`clk_div*2-1) || rst) ? 0 : counter+1;
        slow_clk <= (counter < `clk_div || rst) ? 1'b0 : 1'b1;
    end
endmodule

// D-flip-flop for debouncing module 
module my_dff(input DFF_CLOCK, rst, D, output reg Q);
    always @ (posedge DFF_CLOCK) begin
        Q <= (rst) ? 1'b0 : D;
    end
endmodule
