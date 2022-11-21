`timescale 1ns / 1ps

`include "my_header.vh"

module vect3mac(
    input wire [`dwidth_mat*3-1:0] v_in_a, //vector a in
    input wire [`dwidth_mat*3-1:0] v_in_b, //vector b in
    output wire [7:0] s_out // scalar out
);

assign s_out = (v_in_a[`dwidth_mat-1:0]*v_in_b[`dwidth_mat-1:0])+ (v_in_a[`dwidth_mat*2-1:`dwidth_mat]*v_in_b[`dwidth_mat*2-1:`dwidth_mat])+ (v_in_a[`dwidth_mat*3-1:`dwidth_mat*2]*v_in_b[`dwidth_mat*3-1:`dwidth_mat*2]);

endmodule