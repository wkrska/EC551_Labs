`timescale 1ns / 1ps

// `ifndef MY_HEADER
//     `define MY_HEADER
    `include "my_header.vh"
// `endif

module memory(
	input wen,
	input rst,
	input load_Mem,
    input [`dwidth_dat-1:0] din,
    input [`awidth_mem-1:0] raddr_i, // read addr instruction
    input [`awidth_mem-1:0] raddr_d, // read addr data
    input [`awidth_mem-1:0] waddr,
    output [`dwidth_dat-1:0] iout,
    output [`dwidth_dat-1:0] dout,
    output [`dwidth_dat*12-1:0] MEM_OUT
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
        end 
        else if (load_Mem) begin
            mem[12'h1E] <= 16'h1E; //30
            mem[12'h1F] <= 16'h1F; //31
            mem[12'h20] <= 16'h20; //32
            mem[12'h22] <= 16'h22; //34
            mem[12'h24] <= 16'h24; //36
            mem[12'h26] <= 16'h26; //38
        end else if (wen) begin
            mem[waddr] <= din;
        end
    end    

    // Assign output
    assign iout = mem[raddr_i];
    assign dout = (raddr_d == waddr && wen) ? din : mem[raddr_d];
    
    assign MEM_OUT = {mem[12'h29],mem[12'h28],mem[12'h27],mem[12'h26],mem[12'h25],mem[12'h24],mem[12'h23],mem[12'h22],mem[12'h21],mem[12'h20],mem[12'h1F],mem[12'h1E]};

endmodule
