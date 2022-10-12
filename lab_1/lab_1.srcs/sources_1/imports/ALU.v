`timescale 1ns / 1ps

module ALU(
    input [1:0] op,
    input [31:0] din0, // rn
    input [31:0] din1, // rm
    output [31:0] dout
    );

    always @(*) begin
        // basic ALU ops
        case (op)
            2'b00: dout = din0+din1;
            2'b01: dout = din0-din1;
            2'b10: dout = din0+32'b1;
            2'b11: dout = din0^din1;
        endcase
    end

endmodule
