`timescale 1ns / 1ps

`include "my_header.vh"

module test_data_loader();

reg clk_100;
reg rst;
reg [7:0] key_ps2, key_uart;
reg [4:0] trans_key_ps2,trans_key_uart;
reg wen_key_ps2, wen_key_uart;
wire [2:0] mode; // 0=I, 1=L, 2=A, 3=B
wire mode_flag;
wire [11:0] inst_addr;
wire [15:0] inst_write;
wire inst_wen;
wire [`dwidth_dat_user*2-1:0] alu_out;
wire [`dwidth_mat*3*3-1:0] bench_out;
wire result_ready;
wire ap_start;

data_loader dl(
    .clk_100     (clk_100     ),
    .rst         (rst         ),
    .key_ps2     (key_ps2     ),
    .wen_key_ps2 (wen_key_ps2 ),
    .key_uart    (key_uart    ),
    .wen_key_uart(wen_key_uart),
    .mode        (mode        ),
    .mode_flag   (mode_flag   ),
    .inst_addr   (inst_addr   ),
    .inst_write  (inst_write  ),
    .inst_wen    (inst_wen    ),
    .alu_out     (alu_out     ),
    .bench_out   (bench_out   ),
    .result_ready(result_ready),
    .ap_start    (ap_start    )
);

always
    #1 clk_100<=~clk_100;

initial begin
    clk_100 <= 'b0;
    rst <= 'b0;
    trans_key_ps2 <= 'b0;
    wen_key_ps2 <= 'b0;
    key_uart <= 'b0;
    wen_key_uart <= 'b0;
    

    // reset
    #10; rst<=1; #10; rst<=0;
    
    // Test entering wrong mode
    #10; trans_key_ps2<=5'h01; #10; wen_key_ps2<=1; #2; wen_key_ps2<=0;
    #10; trans_key_ps2<=5'h11; #10; wen_key_ps2<=1; #2; wen_key_ps2<=0;
    
    // Test entering right mode (I mode)
    #10; trans_key_ps2<=5'h1A; #10; wen_key_ps2<=1; #2; wen_key_ps2<=0;
    #10; trans_key_ps2<=5'h11; #10; wen_key_ps2<=1; #2; wen_key_ps2<=0;
    
    // Simulate button presses for inst in
    #10; trans_key_ps2<=5'h01;#10; wen_key_ps2<=1; #2; wen_key_ps2<=0; //1234
    #10; trans_key_ps2<=5'h02;#10; wen_key_ps2<=1; #2; wen_key_ps2<=0;
    #10; trans_key_ps2<=5'h03;#10; wen_key_ps2<=1; #2; wen_key_ps2<=0;
    #10; trans_key_ps2<=5'h04;#10; wen_key_ps2<=1; #2; wen_key_ps2<=0;
    #10; trans_key_ps2<=5'h11;#10; wen_key_ps2<=1; #2; wen_key_ps2<=0; // enter
    #10; trans_key_ps2<=5'h05;#10; wen_key_ps2<=1; #2; wen_key_ps2<=0; // 5678
    #10; trans_key_ps2<=5'h06;#10; wen_key_ps2<=1; #2; wen_key_ps2<=0;
    #10; trans_key_ps2<=5'h07;#10; wen_key_ps2<=1; #2; wen_key_ps2<=0;
    #10; trans_key_ps2<=5'h08;#10; wen_key_ps2<=1; #2; wen_key_ps2<=0;
    #10; trans_key_ps2<=5'h11;#10; wen_key_ps2<=1; #2; wen_key_ps2<=0; // enter
    #10; trans_key_ps2<=5'h09;#10; wen_key_ps2<=1; #2; wen_key_ps2<=0; // 9abc
    #10; trans_key_ps2<=5'h0a;#10; wen_key_ps2<=1; #2; wen_key_ps2<=0;
    #10; trans_key_ps2<=5'h0b;#10; wen_key_ps2<=1; #2; wen_key_ps2<=0;
    #10; trans_key_ps2<=5'h0c;#10; wen_key_ps2<=1; #2; wen_key_ps2<=0;
    #10; trans_key_ps2<=5'h11;#10; wen_key_ps2<=1; #2; wen_key_ps2<=0; // enter
    #10; trans_key_ps2<=5'h18;#10; wen_key_ps2<=1; #2; wen_key_ps2<=0; // R
    #10;

    #100;

    // Test entering mode (L mode)
    #10; trans_key_ps2<=5'h1B; #10; wen_key_ps2<=1; #2; wen_key_ps2<=0;
    #10; trans_key_ps2<=5'h11; #10; wen_key_ps2<=1; #2; wen_key_ps2<=0;
    
    // Simulate button presses for inst in
    #10; trans_key_uart<=5'h01;#10; wen_key_uart<=1; #2; wen_key_uart<=0; //1234
    #10; trans_key_uart<=5'h02;#10; wen_key_uart<=1; #2; wen_key_uart<=0;
    #10; trans_key_uart<=5'h03;#10; wen_key_uart<=1; #2; wen_key_uart<=0;
    #10; trans_key_uart<=5'h04;#10; wen_key_uart<=1; #2; wen_key_uart<=0;
    #10; trans_key_uart<=5'h11;#10; wen_key_uart<=1; #2; wen_key_uart<=0; // enter
    #10; trans_key_uart<=5'h05;#10; wen_key_uart<=1; #2; wen_key_uart<=0; // 5678
    #10; trans_key_uart<=5'h06;#10; wen_key_uart<=1; #2; wen_key_uart<=0;
    #10; trans_key_uart<=5'h07;#10; wen_key_uart<=1; #2; wen_key_uart<=0;
    #10; trans_key_uart<=5'h08;#10; wen_key_uart<=1; #2; wen_key_uart<=0;
    #10; trans_key_uart<=5'h11;#10; wen_key_uart<=1; #2; wen_key_uart<=0; // enter
    #10; trans_key_uart<=5'h09;#10; wen_key_uart<=1; #2; wen_key_uart<=0; // 9abc
    #10; trans_key_uart<=5'h0a;#10; wen_key_uart<=1; #2; wen_key_uart<=0;
    #10; trans_key_uart<=5'h0b;#10; wen_key_uart<=1; #2; wen_key_uart<=0;
    #10; trans_key_uart<=5'h0c;#10; wen_key_uart<=1; #2; wen_key_uart<=0;
    #10; trans_key_uart<=5'h11;#10; wen_key_uart<=1; #2; wen_key_uart<=0; // enter
    #10; trans_key_uart<=5'h18;#10; wen_key_uart<=1; #2; wen_key_uart<=0; // R
    #10;

    #100;
    
    // // mat write
    // #10; mode<=2;
    // #10; wen_mode<=1; #4; wen_mode<=0;
    
    // // Simulate button presses for mat_a in
    // #5; trans_key_ps2<=5'h03;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;
    // #5; trans_key_ps2<=5'h12;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;//shift
    // #5; trans_key_ps2<=5'h14;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;
    // #5; trans_key_ps2<=5'h0a;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;
    
    // #10; mode<=2;#10; wen_mode<=1; #4; wen_mode<=0;
    // #5; trans_key_ps2<=5'h03;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;
    // #5; trans_key_ps2<=5'h13;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;//shift
    // #5; trans_key_ps2<=5'h15;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;
    // #5; trans_key_ps2<=5'h0a;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;
    
    // #10; mode<=2;#10; wen_mode<=1; #4; wen_mode<=0;
    // #5; trans_key_ps2<=5'h03;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;
    // #5; trans_key_ps2<=5'h12;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;//shift
    // #5; trans_key_ps2<=5'h16;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;
    // #5; trans_key_ps2<=5'h0a;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;
    
    // #10; mode<=2;#10; wen_mode<=1; #4; wen_mode<=0;
    // #5; trans_key_ps2<=5'h03;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;
    // #5; trans_key_ps2<=5'h12;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;//shift
    // #5; trans_key_ps2<=5'h17;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;
    // #5; trans_key_ps2<=5'h0a;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;
    
    
    // // mat write
    // #10; mode<=3;
    // #10; wen_mode<=1; #4; wen_mode<=0;
    
    // // Simulate button presses for mat_a in
    // #5; trans_key_ps2<=5'h01;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;#5; trans_key_ps2<=5'h10;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;
    // #5; trans_key_ps2<=5'h02;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;#5; trans_key_ps2<=5'h10;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;
    // #5; trans_key_ps2<=5'h03;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;#5; trans_key_ps2<=5'h11;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;
    // #5; trans_key_ps2<=5'h04;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;#5; trans_key_ps2<=5'h10;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;
    // #5; trans_key_ps2<=5'h05;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;#5; trans_key_ps2<=5'h10;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;
    // #5; trans_key_ps2<=5'h06;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;#5; trans_key_ps2<=5'h11;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;
    // #5; trans_key_ps2<=5'h07;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;#5; trans_key_ps2<=5'h10;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;
    // #5; trans_key_ps2<=5'h08;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;#5; trans_key_ps2<=5'h10;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;
    // #5; trans_key_ps2<=5'h09;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;#5; trans_key_ps2<=5'h11;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;
    
    // #5; trans_key_ps2<=5'h01;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;#5; trans_key_ps2<=5'h10;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;
    // #5; trans_key_ps2<=5'h00;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;#5; trans_key_ps2<=5'h10;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;
    // #5; trans_key_ps2<=5'h00;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;#5; trans_key_ps2<=5'h11;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;
    // #5; trans_key_ps2<=5'h00;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;#5; trans_key_ps2<=5'h10;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;
    // #5; trans_key_ps2<=5'h01;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;#5; trans_key_ps2<=5'h10;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;
    // #5; trans_key_ps2<=5'h00;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;#5; trans_key_ps2<=5'h11;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;
    // #5; trans_key_ps2<=5'h00;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;#5; trans_key_ps2<=5'h10;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;
    // #5; trans_key_ps2<=5'h00;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;#5; trans_key_ps2<=5'h10;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;
    // #5; trans_key_ps2<=5'h01;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;#5; trans_key_ps2<=5'h11;#5; wen_key_ps2<=1; #2; wen_key_ps2<=0;
    
    // #10;
    
    $finish;
end


always @(trans_key_ps2) begin
    case(trans_key_ps2) 
        5'h00 : key_ps2 = 8'h45;
        5'h01 : key_ps2 = 8'h16;
        5'h02 : key_ps2 = 8'h1e;
        5'h03 : key_ps2 = 8'h26;
        5'h04 : key_ps2 = 8'h25;
        5'h05 : key_ps2 = 8'h2e;
        5'h06 : key_ps2 = 8'h36;
        5'h07 : key_ps2 = 8'h3d;
        5'h08 : key_ps2 = 8'h3e;
        5'h09 : key_ps2 = 8'h46;
        5'h0a : key_ps2 = 8'h1c;
        5'h0b : key_ps2 = 8'h32;
        5'h0c : key_ps2 = 8'h21;
        5'h0d : key_ps2 = 8'h23;
        5'h0e : key_ps2 = 8'h24;
        5'h0f : key_ps2 = 8'h2b;
        5'h10 : key_ps2 = 8'h29; //space
        5'h11 : key_ps2 = 8'h5a; //enter
        5'h12 : key_ps2 = 8'h12; // [L shift]
        5'h13 : key_ps2 = 8'h59; // [R shift]
        5'h14 : key_ps2 = 8'h36; //^/6
        5'h15 : key_ps2 = 8'h55; //+
        5'h16 : key_ps2 = 8'h4e; //-
        5'h17 : key_ps2 = 8'h3e; //*/8
        5'h18 : key_ps2 = 8'h2d; //r
        5'h1a : key_ps2 = 8'h43; //I
        5'h1b : key_ps2 = 8'h4B; //L
    endcase
end

always @(trans_key_uart) begin
    case(trans_key_uart) 
        5'h00 : key_uart = 8'h30;
        5'h01 : key_uart = 8'h31;
        5'h02 : key_uart = 8'h32;
        5'h03 : key_uart = 8'h33;
        5'h04 : key_uart = 8'h34;
        5'h05 : key_uart = 8'h35;
        5'h06 : key_uart = 8'h36;
        5'h07 : key_uart = 8'h37;
        5'h08 : key_uart = 8'h38;
        5'h09 : key_uart = 8'h39;
        5'h0a : key_uart = 8'h41;
        5'h0b : key_uart = 8'h42;
        5'h0c : key_uart = 8'h43;
        5'h0d : key_uart = 8'h44;
        5'h0e : key_uart = 8'h45;
        5'h0f : key_uart = 8'h46;
        5'h11 : key_uart = 8'h0a; //enter
        5'h18 : key_uart = 8'h52; //r
    endcase
end

endmodule