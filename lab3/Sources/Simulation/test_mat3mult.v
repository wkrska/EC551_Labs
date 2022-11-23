`timescale 1ns / 1ps

`include "my_header.vh"

module test_mat3mult();

    reg [8*3*3-1:0] mat_in_a = {
        8'h00,8'h01,8'h02,       
        8'h03,8'h04,8'h05,       
        8'h06,8'h07,8'h08        
    };
    reg [8*3*3-1:0] mat_in_b = {
        8'h01,8'h06,8'h07,       
        8'h02,8'h05,8'h08,       
        8'h03,8'h04,8'h09        
    };
    wire [8*3*3-1:0] mat_out;

    mat3mult mm(mat_in_a,mat_in_b,mat_out);
    initial begin
        #10;
        $finish;
    end
endmodule