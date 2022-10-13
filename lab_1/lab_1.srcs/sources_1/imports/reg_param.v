`timescale 1ns / 1ps

module reg_param #(parameter SIZE = 4) (
    input wire clk,
    input wire [SIZE-1:0] din,
    output reg [SIZE-1:0] dout
);

always @(posedge clk) begin
    dout <= din;
end

endmodule