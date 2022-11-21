`timescale 1ns / 1ps

// `ifndef MY_HEADER
//     `define MY_HEADER
    `include "my_header.vh"
// `endif

module memory(
	input wen,
	input rst,
    input [`dwidth_dat-1:0] din,
    input [`awidth_mem-1:0] raddr_i, // read addr instruction
    input [`awidth_mem-1:0] raddr_d, // read addr data
    input [`awidth_mem-1:0] waddr,
    output [`dwidth_dat-1:0] iout,
    output [`dwidth_dat-1:0] dout
    );

//    reg [`dwidth_dat-1:0] mem [(2**`awidth_mem):0];
    reg [`dwidth_dat-1:0] mem [(2**7):0]; //for debugging
    
    // init to 0;
    integer i;
    always @(*) begin
        if (rst) begin
            for (i = 0; i < 12'hFFF; i=i+1) begin
                mem[i] <= 0;
            end
        end else begin
            // Assign mem on valid input
            mem[waddr] = (wen) ? din : mem[waddr];
        end
    end    

    // Assign output
    assign iout = mem[raddr_i];
    assign dout = (raddr_d == waddr && wen) ? din : mem[raddr_d];

endmodule
