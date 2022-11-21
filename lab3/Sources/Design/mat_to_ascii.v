`timescale 1ns / 1ps

`include "my_header.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2022 12:59:10 PM
// Design Name: 
// Module Name: mat_to_ascii
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


module mat_to_ascii(
    input [`dwidth_mat*3*3-1:0] bench_in,
    output [8*(3*4+1)-1:0] bench_out
    );
    
    hex_to_ascii(bench_in[3:0], bench_out[7:0]);
    hex_to_ascii(bench_in[7:4], bench_out[15:8]);
    hex_to_ascii(bench_in[11:8], bench_out[23:16]);
    assign bench_out[31:24] = 8'h0A; // /n
    hex_to_ascii(bench_in[15:12], bench_out[39:32]);
    hex_to_ascii(bench_in[19:16], bench_out[47:40]);
    hex_to_ascii(bench_in[23:20], bench_out[55:48]);
    assign bench_out[63:56] = 8'h0A; // /n
    hex_to_ascii(bench_in[27:24], bench_out[71:64]);
    hex_to_ascii(bench_in[31:28], bench_out[79:72]);
    hex_to_ascii(bench_in[35:32], bench_out[87:80]);
    assign bench_out[95:88] = 8'h0A; // /n
    assign bench_out[103:96] = 8'h0D; // /r
endmodule
