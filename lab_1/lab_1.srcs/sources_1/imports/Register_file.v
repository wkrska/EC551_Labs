`timescale 1ns / 1ps

module Register_file(RS1, RS2, WS, WD, WE, RD1, RD2, clk, rst);

    parameter BITSIZE = 16;
    parameter REGSIZE = 7; // 6 registers and 1 PC
    input [$clog2(REGSIZE)-1:0] RS1, RS2, WS;
    input [BITSIZE-1:0] WD;
    input WE;
    output reg [BITSIZE-1:0] RD1, RD2;
    input clk, rst;

    reg [BITSIZE-1:0] reg_file [REGSIZE-1:0];   // Entire list of registers

    integer i;                                  // Used below to rst all registers

    // Asyncronous read of register file.
    always @(RS1, reg_file[RS1])
        begin
            RD1 = reg_file[RS1];
        end

    // Asyncronous read of register file.
    always @(RS2, reg_file[RS2])
        begin
            RD2 = reg_file[RS2];
        end

    // Write back to register file on clk edge.
    always @(posedge clk)
        begin
            if (rst)
                for (i=0; i<REGSIZE; i=i+1) reg_file[i] <= 'b0; // rst all registers
            else
            begin
                if (WE && WS != 31)
                    reg_file[WS] <= WD; //If writeback is enabled and not 0 register.
            end
        end
        
        initial
		begin
			i = 0;
			reg_file[i] = 16'b0; //Reg x0 Data
			i = i+1;
			reg_file[i] = 16'b0; //Reg x1 Data
			i = i+1;
			reg_file[i] = 16'b0; //Reg x2 Data
			i = i+1;
			reg_file[i] = 16'b0; //Reg x3 Data
            i = i+1;
            reg_file[i] = 16'b0; //Reg x4 Data
            i = i+1;
            reg_file[i] = 16'h0; //Reg x5 Data
            i = i+1;
            reg_file[i] = 16'b0; //Reg x6 Data
            i = i+1;
		end
        
        
        

endmodule
