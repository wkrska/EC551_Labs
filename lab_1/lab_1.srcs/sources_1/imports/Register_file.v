`timescale 1ns / 1ps

module Register_file(RS1, RS2, WS, WD, WE, RD1, RD2, PC_IN, PC_EN, PC_OUT, clk, rst);

    parameter BITSIZE = 16;
    parameter REGSIZE = 7; // 6 registers and 1 PC
    input [$clog2(REGSIZE)-1:0] RS1, RS2, WS;
    input [BITSIZE-1:0] WD, PC_IN;
    input WE, PC_EN;
    output reg [BITSIZE-1:0] RD1, RD2, PC_OUT;
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
    
    // Asynchronous read of PC
    always @(PC_IN, reg_file[6])
        begin
            PC_OUT = reg_file[6];
        end
        
    // Write back to register file on clk edge.
    always @(posedge clk)
    begin
        if (rst)
            for (i=0; i<REGSIZE; i=i+1) reg_file[i] <= 'b0; // rst all registers
        else
        begin
            if (WE && WS != 6)
                reg_file[WS] <= WD; //If writeback is enabled and not 0 register.
            if (PC_EN)
                reg_file[6] <= PC_IN;
        end
    end

endmodule
