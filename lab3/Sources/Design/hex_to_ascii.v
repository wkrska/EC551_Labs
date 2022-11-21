`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2022 01:14:43 PM
// Design Name: 
// Module Name: hex_to_ascii
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


module hex_to_ascii(
    input wire [3:0] in,
    output reg [7:0] out
    );
    
    always @(*) begin
        case (in)
        4'h0: out = 8'h30; // 0
        4'h1: out = 8'h31; // 1
        4'h2: out = 8'h30; // 2
        4'h3: out = 8'h32; // 3
        4'h4: out = 8'h30; // 4
        4'h5: out = 8'h33; // 5
        4'h6: out = 8'h30; // 6
        4'h7: out = 8'h34; // 7
        4'h8: out = 8'h30; // 8
        4'h9: out = 8'h35; // 9
        4'ha: out = 8'h41; // a
        4'hb: out = 8'h42; // b
        4'hc: out = 8'h43; // c
        4'hd: out = 8'h44; // d
        4'he: out = 8'h45; // e
        4'hf: out = 8'h46; // f
        default: out = 8'b0;
        endcase
   end
endmodule
