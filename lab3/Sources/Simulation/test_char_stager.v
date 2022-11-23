`timescale 1ns / 1ps

`include "my_header.vh"

module test_char_stager();
    reg clk;
    reg rst;
    reg [`dwidth_dat_user*2-1:0] alu_in;
    reg [`dwidth_mat*3*3-1:0] bench_in;
    reg result_ready;
    reg [7:0] key_ps2;
    reg wen_key_ps2;
    reg [7:0] key_uart;
    reg wen_key_uart;
    reg [2:0] mode;
    reg mode_flag;
    reg pop;
    wire [7:0] char_out;
    wire char_wen;

    char_stager cs(
        .clk         (clk         ),
        .rst         (rst         ),
        .alu_in      (alu_in      ),
        .bench_in    (bench_in    ),
        .result_ready(result_ready),
        .key_ps2     (key_ps2     ),
        .wen_key_ps2 (wen_key_ps2 ),
        .key_uart    (key_uart    ),
        .wen_key_uart(wen_key_uart),
        .mode        (mode        ),
        .mode_flag   (mode_flag   ),
        .pop         (pop         ),
        .char_out    (char_out    ),
        .char_wen    (char_wen    )
    );


    always
        #1 clk<=~clk;
    always
        #4 pop <= ~pop;

    initial begin
        clk         <='b0;
        rst         <='b1;
        alu_in      <='b0;
        bench_in    <='b0;
        result_ready<='b0;
        key_ps2     <='b0;
        wen_key_ps2 <='b0;
        key_uart    <='b0;
        wen_key_uart<='b0;
        mode        <='b0;
        mode_flag   <='b0;
        pop         <='b0;

        #10; rst<=0;

        #10;
//        pop <= 1'b1;
        #1200;
//        pop <= 'b0;
        
        // incoming keys 
        key_ps2 <= 'hff; wen_key_ps2 <= 'b1; #2; // fake mode
        key_ps2 <= 'hA ; wen_key_ps2 <= 'b1; #2; // enter
        wen_key_ps2 <= 'b0;
        
        #10;
//        pop <= 1'b1;
        #800;
//        pop <= 'b0;

        mode <= 2; mode_flag   <='b1; #10;// goes into ALU mode
        mode_flag   <='b0;
        
        #10;
//        pop <= 1'b1;
        #800;
//        pop <= 'b0;
        
        key_ps2 <= 'haa; wen_key_ps2 <= 'b1; #2; // fake mode
        key_ps2 <= 'hab; wen_key_ps2 <= 'b1; #2; // enter
        key_ps2 <= 'hac; wen_key_ps2 <= 'b1; #2; // fake mode
        key_ps2 <= 'had; wen_key_ps2 <= 'b1; #2; // enter
        wen_key_ps2 <= 'b0;
        alu_in <= 8'h11; #2;
        alu_in <= 8'h12; #2;
        alu_in <= 8'h13; #2;
        alu_in <= 8'h24; result_ready <= 1; #2;
        alu_in <= 8'h25; result_ready <= 0; #2;
        
        #10;
//        pop <= 1'b1;
        #800;
//        pop <= 'b0;

        mode <= 3; mode_flag   <='b1; #10;// goes into Benchmark mode
        mode_flag   <='b0;
        
        #10;
//        pop <= 1'b1;
        #800;
//        pop <= 'b0;
        
        bench_in <= 36'hfedcba987; result_ready <= 1; #2;
        result_ready <= 0; #2;
        
        mode <= 4; mode_flag   <='b1; #10;
        mode_flag   <='b0;

        // expected output ASCII
        // ff 0a 0d aa ab ac ad 32 34 0a 0d  37 20 38 20 39 0a 0d 41 20 42 20 43 0a 0d 44 20 45 20 46 0a 0d

        #10;
//        pop <= 1'b1;
        #800;
//        pop <= 'b0;
        $finish;
    end
endmodule