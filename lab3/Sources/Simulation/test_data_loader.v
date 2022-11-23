`timescale 1ns / 1ps

`include "my_header.vh"

module test_data_loader();

reg clk;
reg rst;
reg [2:0] mode; // 0=I, 1=L, 2=A, 3=B
reg wen_mode;
reg [7:0] key;
reg [4:0] trans_key;
reg wen_key;
reg run; // pulsed when 'r' is hit in mode 1,2
wire [11:0] inst_addr;
wire [15:0] inst_write;
wire [`dwidth_dat_user*2-1:0] alu_out;
wire [`dwidth_mat*3*3-1:0] bench_out;
wire result_ready;
wire ap_start;

data_loader dl(clk,rst,mode,wen_mode,key,wen_key,run,inst_addr,inst_write,alu_out,bench_out,result_ready,ap_start);

always
    #1 clk<=~clk;

initial begin
    clk <= 'b0;
    rst <= 'b0;
    mode <= 'b0;
    wen_mode <= 'b0;
    trans_key <= 'b0;
    wen_key <= 'b0;
    run <= 'b0;

    #10; rst<=1; #10; rst<=0;
    
    // Inst write
    #10; mode<=0;
    #10; wen_mode<=1; #2; wen_mode<=0;
    
    // Simulate button presses for inst in
    #10; trans_key<=5'h01;#10; wen_key<=1; #2; wen_key<=0;
    #10; trans_key<=5'h02;#10; wen_key<=1; #2; wen_key<=0;
    #10; trans_key<=5'h03;#10; wen_key<=1; #2; wen_key<=0;
    #10; trans_key<=5'h04;#10; wen_key<=1; #2; wen_key<=0;
    #10; trans_key<=5'h11;#10; wen_key<=1; #2; wen_key<=0;
    #10; trans_key<=5'h05;#10; wen_key<=1; #2; wen_key<=0;
    #10; trans_key<=5'h06;#10; wen_key<=1; #2; wen_key<=0;
    #10; trans_key<=5'h07;#10; wen_key<=1; #2; wen_key<=0;
    #10; trans_key<=5'h08;#10; wen_key<=1; #2; wen_key<=0;
    #10; trans_key<=5'h11;#10; wen_key<=1; #2; wen_key<=0;
    #10; trans_key<=5'h09;#10; wen_key<=1; #2; wen_key<=0;
    #10; trans_key<=5'h0a;#10; wen_key<=1; #2; wen_key<=0;
    #10; trans_key<=5'h0b;#10; wen_key<=1; #2; wen_key<=0;
    #10; trans_key<=5'h0c;#10; wen_key<=1; #2; wen_key<=0;
    #10; trans_key<=5'h11;#10; wen_key<=1; #2; wen_key<=0;
    #10; run<=1; #2; run<=0;
    #10;
    
    // mat write
    #10; mode<=2;
    #10; wen_mode<=1; #4; wen_mode<=0;
    
    // Simulate button presses for mat_a in
    #5; trans_key<=5'h03;#5; wen_key<=1; #2; wen_key<=0;
    #5; trans_key<=5'h12;#5; wen_key<=1; #2; wen_key<=0;//shift
    #5; trans_key<=5'h14;#5; wen_key<=1; #2; wen_key<=0;
    #5; trans_key<=5'h0a;#5; wen_key<=1; #2; wen_key<=0;
    
    #10; mode<=2;#10; wen_mode<=1; #4; wen_mode<=0;
    #5; trans_key<=5'h03;#5; wen_key<=1; #2; wen_key<=0;
    #5; trans_key<=5'h13;#5; wen_key<=1; #2; wen_key<=0;//shift
    #5; trans_key<=5'h15;#5; wen_key<=1; #2; wen_key<=0;
    #5; trans_key<=5'h0a;#5; wen_key<=1; #2; wen_key<=0;
    
    #10; mode<=2;#10; wen_mode<=1; #4; wen_mode<=0;
    #5; trans_key<=5'h03;#5; wen_key<=1; #2; wen_key<=0;
    #5; trans_key<=5'h12;#5; wen_key<=1; #2; wen_key<=0;//shift
    #5; trans_key<=5'h16;#5; wen_key<=1; #2; wen_key<=0;
    #5; trans_key<=5'h0a;#5; wen_key<=1; #2; wen_key<=0;
    
    #10; mode<=2;#10; wen_mode<=1; #4; wen_mode<=0;
    #5; trans_key<=5'h03;#5; wen_key<=1; #2; wen_key<=0;
    #5; trans_key<=5'h12;#5; wen_key<=1; #2; wen_key<=0;//shift
    #5; trans_key<=5'h17;#5; wen_key<=1; #2; wen_key<=0;
    #5; trans_key<=5'h0a;#5; wen_key<=1; #2; wen_key<=0;
    
    
    // mat write
    #10; mode<=3;
    #10; wen_mode<=1; #4; wen_mode<=0;
    
    // Simulate button presses for mat_a in
    #5; trans_key<=5'h01;#5; wen_key<=1; #2; wen_key<=0;#5; trans_key<=5'h10;#5; wen_key<=1; #2; wen_key<=0;
    #5; trans_key<=5'h02;#5; wen_key<=1; #2; wen_key<=0;#5; trans_key<=5'h10;#5; wen_key<=1; #2; wen_key<=0;
    #5; trans_key<=5'h03;#5; wen_key<=1; #2; wen_key<=0;#5; trans_key<=5'h11;#5; wen_key<=1; #2; wen_key<=0;
    #5; trans_key<=5'h04;#5; wen_key<=1; #2; wen_key<=0;#5; trans_key<=5'h10;#5; wen_key<=1; #2; wen_key<=0;
    #5; trans_key<=5'h05;#5; wen_key<=1; #2; wen_key<=0;#5; trans_key<=5'h10;#5; wen_key<=1; #2; wen_key<=0;
    #5; trans_key<=5'h06;#5; wen_key<=1; #2; wen_key<=0;#5; trans_key<=5'h11;#5; wen_key<=1; #2; wen_key<=0;
    #5; trans_key<=5'h07;#5; wen_key<=1; #2; wen_key<=0;#5; trans_key<=5'h10;#5; wen_key<=1; #2; wen_key<=0;
    #5; trans_key<=5'h08;#5; wen_key<=1; #2; wen_key<=0;#5; trans_key<=5'h10;#5; wen_key<=1; #2; wen_key<=0;
    #5; trans_key<=5'h09;#5; wen_key<=1; #2; wen_key<=0;#5; trans_key<=5'h11;#5; wen_key<=1; #2; wen_key<=0;
    
    #5; trans_key<=5'h01;#5; wen_key<=1; #2; wen_key<=0;#5; trans_key<=5'h10;#5; wen_key<=1; #2; wen_key<=0;
    #5; trans_key<=5'h00;#5; wen_key<=1; #2; wen_key<=0;#5; trans_key<=5'h10;#5; wen_key<=1; #2; wen_key<=0;
    #5; trans_key<=5'h00;#5; wen_key<=1; #2; wen_key<=0;#5; trans_key<=5'h11;#5; wen_key<=1; #2; wen_key<=0;
    #5; trans_key<=5'h00;#5; wen_key<=1; #2; wen_key<=0;#5; trans_key<=5'h10;#5; wen_key<=1; #2; wen_key<=0;
    #5; trans_key<=5'h01;#5; wen_key<=1; #2; wen_key<=0;#5; trans_key<=5'h10;#5; wen_key<=1; #2; wen_key<=0;
    #5; trans_key<=5'h00;#5; wen_key<=1; #2; wen_key<=0;#5; trans_key<=5'h11;#5; wen_key<=1; #2; wen_key<=0;
    #5; trans_key<=5'h00;#5; wen_key<=1; #2; wen_key<=0;#5; trans_key<=5'h10;#5; wen_key<=1; #2; wen_key<=0;
    #5; trans_key<=5'h00;#5; wen_key<=1; #2; wen_key<=0;#5; trans_key<=5'h10;#5; wen_key<=1; #2; wen_key<=0;
    #5; trans_key<=5'h01;#5; wen_key<=1; #2; wen_key<=0;#5; trans_key<=5'h11;#5; wen_key<=1; #2; wen_key<=0;
    
    #10;
    
    $finish;
end


always @(trans_key) begin
    case(trans_key) 
        5'h00 : key = 8'h45;
        5'h01 : key = 8'h16;
        5'h02 : key = 8'h1e;
        5'h03 : key = 8'h26;
        5'h04 : key = 8'h25;
        5'h05 : key = 8'h2e;
        5'h06 : key = 8'h36;
        5'h07 : key = 8'h3d;
        5'h08 : key = 8'h3e;
        5'h09 : key = 8'h46;
        5'h0a : key = 8'h1c;
        5'h0b : key = 8'h32;
        5'h0c : key = 8'h21;
        5'h0d : key = 8'h23;
        5'h0e : key = 8'h24;
        5'h0f : key = 8'h2b;
        5'h10 : key = 8'h29; //space
        5'h11 : key = 8'h5a; //enter
        5'h12 : key = 8'h12; // [L shift]
        5'h13 : key = 8'h59; // [R shift]
        5'h14 : key = 8'h36; //^/6
        5'h15 : key = 8'h55; //+
        5'h16 : key = 8'h4e; //-
        5'h17 : key = 8'h3e; //*/8
        5'h18 : key = 8'h2d; //r
    endcase
end

endmodule