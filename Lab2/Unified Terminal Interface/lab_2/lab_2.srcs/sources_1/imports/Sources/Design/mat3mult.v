`timescale 1ns / 1ps

`include "my_header.vh"

module mat3mult(
    input wire [`dwidth_mat*3*3-1:0] mat_in_a,
    input wire [`dwidth_mat*3*3-1:0] mat_in_b,
    output wire [`dwidth_mat*3*3-1:0] mat_out
);
    genvar i,j;
    generate 
    for (i=0;i<3;i=i+1) begin
    for (j=0;j<3;j=j+1) begin
        vect3mac vm0(
            mat_in_a[`dwidth_mat*3*(i+1)-1:`dwidth_mat*3*i],
            {
                mat_in_b[`dwidth_mat*3*2+`dwidth_mat*(j+1)-1:`dwidth_mat*3*2+`dwidth_mat*j],
                mat_in_b[`dwidth_mat*3*1+`dwidth_mat*(j+1)-1:`dwidth_mat*3*1+`dwidth_mat*j],
                mat_in_b[`dwidth_mat*3*0+`dwidth_mat*(j+1)-1:`dwidth_mat*3*0+`dwidth_mat*j]
            },
            mat_out[`dwidth_mat*3*i+`dwidth_mat*(j+1)-1:`dwidth_mat*3*i+`dwidth_mat*j]
        );
    end
    end
    endgenerate
endmodule
