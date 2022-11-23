`timescale 1ns / 1ps

module reg_param #(parameter SIZE = 4) (
    input wire clk,
    input wire rst,
    input wire [SIZE-1:0] din,
    output reg [SIZE-1:0] dout
);

always @(posedge clk) begin
    if (rst)
        dout <= 'b0;
    else
        dout <= din;
end

endmodule