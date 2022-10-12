`timescale 1ns / 1ps

module memory(
	input wen,
    input [31:0] din,
    input [11:0] raddr_i, // read addr instruction
    input [11:0] raddr_d, // read addr data
    input [11:0] waddr,
    output [31:0] iout,
    output [31:0] dout
    );

    reg [31:0] mem [11:0];
    
    // init to 0;
    integer i;
    initial begin
        for (i = 0; i < 12'hFFF; i=i+1) begin
            mem[i] = '0;
        end
    end

    // Assign mem on valid input
    assign mem[waddr] = (wen) ? din : mem[waddr];

    // Assign output
    assign iout = mem[raddr_i];
    assign dout = mem[raddr_d];

endmodule
