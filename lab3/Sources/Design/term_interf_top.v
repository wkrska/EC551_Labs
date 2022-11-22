`timescale 1ns / 1ps

`include "my_header.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2022 08:46:45 AM
// Design Name: 
// Module Name: term_interf_top
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


module term_interf_top(
    input wire CLK100MHZ, rst_n,
    input wire [15:0] SW,
    input wire [4:0] BTN, 
    
    // PS2
    input PS2_DATA,
    input PS2_CLK,
    output wire [15:0] LED,
    output wire [7:0] SSEG_CA,
    output wire [7:0] SSEG_AN,
    
    // UART
    output wire UART_TXD,
    input wire UART_RXD,
    
    // VGA
    output wire [3:0] VGA_R,
    output wire [3:0] VGA_G,
    output wire [3:0] VGA_B,
    output wire VGA_HS,
    output wire VGA_VS
    );
    // uart and ps2 lines
    wire [2:0] mode_select;
    wire [7:0] key_select_ps2, key_select_ascii;
    wire keyflag;
    wire modeflag;
    wire [103:0] disp_mat;
    wire [31:0] disp_alu;
    wire [7:0] uart_rx_dat, uart_tx_dat;
    wire uart_rx_dv, uart_tx_send, uart_tx_ready;
    
    // data lines
    wire wen_mode, wen_key_ps2, wen_key_uart, result_ready, ap_start;
    wire [7:0] key_ps2, key_uart, debug_state;
    wire [11:0] inst_addr;
    wire [15:0] inst_write;
    wire [`dwidth_dat_user*2-1:0] alu_out;
    wire [`dwidth_mat*3*3-1:0] bench_out;
    //============= UART and PS/2 =============//
    
    
//    UART_top UART_top(
//    .SW(SW),
//    .BTN(BTN),
//    .CLK(CLK100MHZ),
//    .RST(BTN[4]),
//    .keyflag(keyflag),
//    .modeflag(modeflag),
//    .alu_out(disp_alu),
//    .bench_out(disp_mat),
//    .SSEG_CA(SSEG_CA),
//    .SSEG_AN(SSEG_AN),
//    .mode_select(mode_select),
//    .key_select(key_select_ascii),
//    .UART_TXD(UART_TXD),
//    .UART_RXD(UART_RXD),
//    .uart_dat(uart_dat),
//    .uart_dv(uart_dv)
//    );
    UART_controller UART_con(
        .CLK           (CLK100MHZ    ),
        .RST           (BTN[4]       ),
        .UART_TX_DAT   (uart_tx_dat  ),
        .UART_TX_SEND  (uart_tx_send ),
        .UART_RXD      (UART_RXD     ),
        .UART_TXD      (UART_TXD     ),
        .UART_TX_READY (uart_tx_ready),
        .UART_RX_DAT   (uart_rx_dat  ),
        .UART_RX_VALID (uart_rx_dv   ) 
    );
    
    uart_arbiter(
        .clk_100(CLK100MHZ),
        .clk_ps2(PS2_CLK),
        .rst(BTN[4]),
        .uart_dat(uart_rx_dat),
        .uart_dv(uart_rx_dv),
        .key_uart(key_uart),
        .wen_uart(wen_key_uart)
    );
    
    char_stager cs(
        .clk         (CLK100MHZ    ),
        .rst         (BTN[4]       ),
        .alu_in      (alu_out      ),
        .bench_in    (bench_out    ),
        .result_ready(result_ready ),
        .key_ps2     (key_ps2      ),
        .wen_key_ps2 (wen_key_ps2  ),
        .key_uart    (key_uart     ),
        .wen_key_uart(wen_key_uart ),
        .mode        (mode_select  ),
        .mode_flag   (modeflag     ),
        .pop         (uart_tx_ready),
        .char_out    (uart_tx_dat  ),
        .char_wen    (uart_tx_send )
    );
    

    ps2_to_ascii p2a(
        .ps2(key_select_ps2),
        .ascii(key_select_ascii)
    );
    
    top_keyboard keyboard_interface(
    .CLK100MHZ(CLK100MHZ),
    .rst(BTN[4]),
    .PS2_CLK(PS2_CLK),
    .PS2_DATA(PS2_DATA),
    .keystroke(key_ps2),
    .keyflagtop(wen_key_ps2)
    );

    // seg7decimal sevseg(
    //     .x({24'b0,key_uart}),
    //     .clk(CLK100MHZ),
    //     .seg(SSEG_CA),
    //     .an(SSEG_AN)
    // );
    
    //============= Data Loader and Datapath =============//
    
    data_loader dl(
        .clk_100     (CLK100MHZ     ),
        .rst         (BTN[4]        ),
        .key_ps2     (key_ps2       ),
        .wen_key_ps2 (wen_key_ps2   ),
        .key_uart    (key_uart      ),
        .wen_key_uart(wen_key_uart  ),
        .mode        (mode_select   ),
        .mode_flag   (modeflag      ),
        .inst_addr   (inst_addr     ),
        .inst_write  (inst_write    ),
        .alu_out     (alu_out       ),
        .bench_out   (bench_out     ),
        .result_ready(result_ready  ),
        .ap_start    (ap_start      ),
        .debug_state (debug_state   )
    );
    assign LED = {8'b0,debug_state};
    
    
    
    mat_to_ascii m2a(
        bench_out,
        disp_mat
    );
    
    alu_to_ascii a2a(
        alu_out,
        disp_alu
    );
        
    wire [`dwidth_dat*6-1:0] register_data;
    wire ap_start_ROM;
    wire resume,halt;
    
    btn_edge btn(
        .reset(BTN[4]),
        .btnIn(BTN[4]),
        .CLK(CLK100MHZ),
        .btnOut(resume)
        );
    
    datapath dp1(
        .clk((mode_select==4'h1 || mode_select==4'h2) ? CLK100MHZ : 'b0), // Clock gating, turns off datapath when not in right mode;
        .rst(BTN[4]),
        .resume(resume),
        .user_inst_write(inst_write),
        .user_inst_addr(inst_addr),
        .ap_start(ap_start),
        .rf_out(register_data),
        .halt(halt)
        );
        
    top_VGA  VGA1(
        .reg_value(register_data),
        .CLK100MHZ(CLK100MHZ),
        .rst(BTN[4]),
        .VGA_R(VGA_R),
        .VGA_G(VGA_G),
        .VGA_B(VGA_B),
        .VGA_HS(VGA_HS),
        .VGA_VS(VGA_VS)
        );
    reg [7:0] cnt=0;
    
    always @(posedge keyflag)
        cnt = cnt+1;
    
    assign LED = {cnt,debug_state};
    
endmodule
