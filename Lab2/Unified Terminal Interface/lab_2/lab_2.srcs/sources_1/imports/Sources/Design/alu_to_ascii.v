`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2022 12:59:10 PM
// Design Name: 
// Module Name: alu_to_ascii
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


module alu_to_ascii(
    input wire [7:0] alu_in,
    output wire [31:0] alu_out
    );
    
    hex_to_ascii(alu_in[3:0], alu_out[7:0]);
    hex_to_ascii(alu_in[7:4], alu_out[15:8]);
    assign alu_out[23:16] = 8'h0A; // /n
    assign alu_out[31:24] = 8'h0D; // /r
    
endmodule
