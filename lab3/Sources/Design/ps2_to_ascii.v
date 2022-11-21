`timescale 1ns / 1ps

`include "my_header.vh"

module ps2_to_ascii(
    input wire [7:0] ps2,
    output reg [7:0] ascii
);

always @(*) begin
    case(ps2) // 0X is number, 1X is char
        8'h45: ascii = 8'h30; // 0
        8'h70: ascii = 8'h30; // 0
        8'h16: ascii = 8'h31; // 1
        8'h69: ascii = 8'h31; // 1
        8'h1E: ascii = 8'h32; // 2
        8'h72: ascii = 8'h32; // 2
        8'h26: ascii = 8'h33; // 3
        8'h7A: ascii = 8'h33; // 3
        8'h25: ascii = 8'h34; // 4
        8'h6B: ascii = 8'h34; // 4
        8'h2E: ascii = 8'h35; // 5
        8'h73: ascii = 8'h35; // 5
        8'h36: ascii = 8'h36; // 6
        8'h74: ascii = 8'h36; // 6
        8'h3D: ascii = 8'h37; // 7
        8'h6C: ascii = 8'h37; // 7
        8'h3E: ascii = 8'h38; // 8
        8'h75: ascii = 8'h38; // 8
        8'h46: ascii = 8'h39; // 9
        8'h7D: ascii = 8'h39; // 9
        8'h4E: ascii = 8'h2D; // -
        8'h7B: ascii = 8'h2D; // -
        8'h7C: ascii = 8'h2A; // *
        8'hE0: ascii = 8'h2F; // /
        8'h79: ascii = 8'h2B; // +
        8'h55: ascii = 8'h3D; // =
        8'h5A: ascii = 8'hA; // Enter
        8'hE0: ascii = 8'hA; // Enter
        8'h12: ascii = 8'h0; // Shift (Left)
        8'h59: ascii = 8'h0; // Shift (Right)
        8'h29: ascii = 8'h20; // Spacebar
        8'h1C: ascii = 8'h41; // A
        8'h32: ascii = 8'h42; // B
        8'h21: ascii = 8'h43; // C
        8'h23: ascii = 8'h44; // D
        8'h24: ascii = 8'h45; // E
        8'h2B: ascii = 8'h46; // F
        8'h34: ascii = 8'h47; // G
        8'h33: ascii = 8'h48; // H
        8'h43: ascii = 8'h49; // I
        8'h3B: ascii = 8'h4A; // J
        8'h42: ascii = 8'h4B; // K
        8'h4B: ascii = 8'h4C; // L
        8'h3A: ascii = 8'h4D; // M
        8'h31: ascii = 8'h4E; // N
        8'h44: ascii = 8'h4F; // O
        8'h4D: ascii = 8'h50; // P
        8'h15: ascii = 8'h51; // Q
        8'h2D: ascii = 8'h52; // R
        8'h1B: ascii = 8'h53; // S
        8'h2C: ascii = 8'h54; // T
        8'h3C: ascii = 8'h55; // U
        8'h2A: ascii = 8'h56; // V
        8'h1D: ascii = 8'h57; // W
        8'h22: ascii = 8'h58; // X
        8'h35: ascii = 8'h59; // Y
        8'h1A: ascii = 8'h5A; // Z
        default: ascii = 8'h0; // D/C
    endcase
end

endmodule