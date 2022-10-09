`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2022 04:36:30 PM
// Design Name: 
// Module Name: memory
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


module memory(
	input wen,
    input [31:0] din,
    input [11:0] raddr,
    input [11:0] waddr,
    output [31:0] dout
    );

    reg [31:0] mem [11:0];
    
    integer i;
    initial begin
        for (i = 0; i < 12'hFFF; i=i+1) begin
            mem[i] = '0;
        end
    end

    assign mem[waddr] = (wen) ? din : mem[waddr];
    assign dout = mem[raddr];
    
endmodule
