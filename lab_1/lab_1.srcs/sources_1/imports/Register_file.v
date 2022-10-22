`timescale 1ns / 1ps

// `ifndef MY_HEADER
//     `define MY_HEADER
    `include "my_header.vh"
// `endif

module Register_file(RS1, RS2, disp_RS, WS, WD, WE, RD1, RD2, disp_RD, PC_IN, PC_EN, PC_OUT, clk, rst);

    parameter REGSIZE = 7; // 6 registers and 1 PC
    input [`awidth_reg-1:0] RS1, RS2, WS, disp_RS;
    input [`dwidth_dat-1:0] WD, PC_IN;
    input WE, PC_EN;
    output reg [`dwidth_dat-1:0] RD1, RD2, PC_OUT, disp_RD;
    input clk, rst;

    reg [`dwidth_dat-1:0] reg_file [REGSIZE-1:0];   // Entire list of registers

    integer i;                                  // Used below to rst all registers
    
    // Asyncronous read of register file.
    always @(RS1, reg_file[RS1], WS)
        begin
            RD1 = (RS1 == WS) ? WD : reg_file[RS1]; // 2 ahead forwarding
        end

    // Asyncronous read of register file.
    always @(RS2, reg_file[RS2], WS)
        begin
            RD2 = (RS2 == WS) ? WD : reg_file[RS2]; // 2 ahead forwarding
        end
    
    // Asynchronous read of PC
    always @(reg_file[6])
        begin
            PC_OUT = reg_file[6];
        end

    // Asynchronous read of Register File
    always @(disp_RS, reg_file[disp_RS])
        begin
            disp_RD = reg_file[disp_RS];
        end
        
    // Write back to register file on clk edge.
    always @(posedge clk)
    begin
        if (rst) begin
            for (i=0; i<REGSIZE-1; i=i+1) 
                reg_file[i] <= 'b0; // rst all registers
            reg_file[6] <= `inst_start;
        end
        else
        begin
            if (WE && WS != 6)
                reg_file[WS] <= WD; //If writeback is enabled and not 0 register.
            if (PC_EN)
                reg_file[6] <= PC_IN;
        end
    end

endmodule
