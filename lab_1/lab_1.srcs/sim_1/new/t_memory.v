`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2022 01:50:25 PM
// Design Name: 
// Module Name: t_memory
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


module t_memory(

    );
    reg         wen;
	reg         rst;
    reg [31:0]  din;
    reg [11:0]  raddr_i; // read addr instruction
    reg [11:0]  raddr_d; // read addr data
    reg [11:0]  waddr;
    wire [31:0] iout;
    wire [31:0] dout;

    memory mem0 (
        .wen    (wen    ),
        .rst    (rst    ),
        .din    (din    ),
        .raddr_i(raddr_i),
        .raddr_d(raddr_d),
        .waddr  (waddr  ),
        .iout   (iout   ),
        .dout   (dout   )
    );

    initial begin
        wen     = 'b0;
        rst     = 'b0;
        din     = 'b0;
        raddr_i = 'b0;
        raddr_d = 'b0;
        waddr   = 'b0;
        iout    = 'b0;
        dout    = 'b0;

        #10; rst <= 1'b1; #10; rst <= 1'b0;

        // write to mem
        wen <= 1'b1;
        for (i=0; i<12'hFFF; i=i+1) begin
            waddr = i;
            din = i*10;
            #10;
        end

        // read from reg
        for (i=0; i<12'h7FF; i=i+1) begin
            raddr_i = i+12'h7FF;
            raddr_d = i;
            #10;
        end

        $finish;
    end

endmodule
