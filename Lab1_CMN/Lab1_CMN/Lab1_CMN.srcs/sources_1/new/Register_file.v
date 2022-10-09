`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2022 03:31:39 PM
// Design Name: 
// Module Name: Register_file
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Register_file(ReadSelect1, ReadSelect2, WriteSelect, WriteData, WriteEnable, ReadData1, ReadData2, clk, rst);

    parameter BITSIZE = 16;
    parameter REGSIZE = 6;
    input [$clog2(REGSIZE)-1:0] ReadSelect1, ReadSelect2, WriteSelect;
    input [BITSIZE-1:0] WriteData;
    input WriteEnable;
    output reg [BITSIZE-1:0] ReadData1, ReadData2;
    input clk, rst;

    reg [BITSIZE-1:0] reg_file [REGSIZE-1:0];   // Entire list of registers

    integer i;                                  // Used below to rst all registers

    // Asyncronous read of register file.
    always @(ReadSelect1, reg_file[ReadSelect1])
        begin
            ReadData1 = reg_file[ReadSelect1];
        end

    // Asyncronous read of register file.
    always @(ReadSelect2, reg_file[ReadSelect2])
        begin
            ReadData2 = reg_file[ReadSelect2];
        end

    // Write back to register file on clk edge.
    always @(posedge clk)
        begin
            if (rst)
                for (i=0; i<REGSIZE; i=i+1) reg_file[i] <= 'b0; // rst all registers
            else
            begin
                if (WriteEnable && WriteSelect != 31)
                    reg_file[WriteSelect] <= WriteData; //If writeback is enabled and not 0 register.
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
