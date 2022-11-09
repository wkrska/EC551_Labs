`timescale 1ns / 1ps

`include "my_header.vh"

module mini_ALU(
    input wire [`dwidth_dat_user-1:0]a,b,
    input wire [1:0] alu_op,
    output wire [`dwidth_dat_user*2-1:0] dout
);

always @(*) begin
    case (alu_op)
        2'b00: assign dout=a^b;// xor
        2'b01: assign dout=a+b;// add
        2'b10: assign dout=a-b;// sub
        2'b11: assign dout=a*b;// mult
        default: assign dout='b0;
    endcase
end
endmodule