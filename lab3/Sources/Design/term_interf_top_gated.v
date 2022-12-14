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
    wire keyflag;
    wire modeflag;
    wire [7:0] uart_rx_dat, uart_tx_dat;
    wire uart_rx_dv, uart_tx_send, uart_tx_ready;
    
    // data lines
    wire wen_mode, wen_key_ps2, wen_key_uart, result_ready, ap_start, ap_stop,ap_start_debug;
    wire [7:0] key_ps2, key_uart, key_ps2_ascii, debug_state_data, count_debug_char;
    wire [3:0] debug_state_char, count_debug_data;
    wire [11:0] inst_addr;
    wire [15:0] inst_write;
    wire inst_wen;
    wire [`dwidth_dat_user*2-1:0] alu_out;
    wire [`dwidth_mat*3*3-1:0] bench_out;
    wire [`dwidth_dat*6-1:0] register_data;
    wire [`dwidth_dat*12-1:0] memory_data;
    wire [`dwidth_dat*6-1:0] VGA_display_data;
    wire [`dwidth_dat-1:0] PC_out;
    wire resume,halt;
    //============= UART and PS/2 =============//
    
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
        .clk_100       (CLK100MHZ   ),
        .rst           (BTN[4]      ),
        .uart_dat      (uart_rx_dat ),
        .uart_dv       (uart_rx_dv  ),
        .key_uart      (key_uart    ),
        .wen_uart      (wen_key_uart)
    );
    
    char_stager cs(
        .clk         (CLK100MHZ    ),
        .rst         (BTN[4]       ),
        .alu_in      (alu_out      ),
        .bench_in    (bench_out    ),
        .result_ready(result_ready ),
        .key_ps2     (key_ps2_ascii),
        .wen_key_ps2 (wen_key_ps2  ),
        .key_uart    (key_uart     ),
        .wen_key_uart(wen_key_uart ),
        .mode        (mode_select  ),
        .mode_flag   (modeflag     ),
        .pop         (uart_tx_ready),
        .char_out    (uart_tx_dat  ),
        .char_wen    (uart_tx_send ),
        .debug_state (debug_state_char),
        .count_debug (count_debug_char)
    );
    

    ps2_to_ascii p2a(
        .ps2     (key_ps2      ),
        .ascii   (key_ps2_ascii)
    );
    
    top_keyboard keyboard_interface(
        .CLK100MHZ   (CLK100MHZ   ),
        .rst         (BTN[4]      ),
        .PS2_CLK     (PS2_CLK     ),
        .PS2_DATA    (PS2_DATA    ),
        .keystroke   (key_ps2     ),
        .keyflagtop  (wen_key_ps2 )
    );

    // Debugging counters and displays
    reg [31:0] ps2_hold,uart_hold;
    reg [16:0] ps2_cnt=0,uart_rx_cnt=0,uart_txs_cnt=0,uart_txr_cnt=0;
    always @(posedge wen_key_ps2)
        ps2_hold <= {ps2_hold[23:0],key_ps2_ascii};
    always @(posedge wen_key_uart)
        uart_hold <= {uart_hold[23:0],key_uart};
    always @(posedge wen_key_ps2)
        ps2_cnt <= ps2_cnt+1;
    always @(posedge uart_rx_dv)
        uart_rx_cnt <= uart_rx_cnt+1;
    always @(posedge uart_tx_send)
        uart_txs_cnt <= uart_txs_cnt+1;
    always @(posedge uart_tx_ready)
        uart_txr_cnt <= uart_txr_cnt+1;
    
    reg[15:0] LED_t;
    assign LED = LED_t;
    always @(*) begin
        case(SW[14:12])
        //               1   1         1           1           4                4+4
        'h0: LED_t = {halt,ap_start_debug,ap_stop,modeflag,debug_state_char,debug_state_data};
        'h1: LED_t = ps2_cnt;
        'h2: LED_t = uart_rx_cnt;
        'h3: LED_t = uart_txs_cnt;
        'h4: LED_t = uart_txr_cnt;
        'h5: LED_t = {8'b0, count_debug_char};
        'h6: LED_t = {12'b0, count_debug_data};
        default: LED_t = 'b0;
        endcase
    end      

    // 7 seg disp memory  
    reg [8*4-1:0] sev_seg_mem;
    always @(*)
        sev_seg_mem = memory_data[(SW[2:0]+1)*(8*4)-1 -: 8*4];

    sev_seg_driver sevseg(
        .CLK100MHZ(CLK100MHZ),
        .rst(BTN[4]),
        .din((SW[4]) ? {PC_out[7:0],inst_addr[7:0],inst_write} : ((SW[3]) ? sev_seg_mem : ((SW[15]) ? ps2_hold : uart_hold))),
        .SSEG_CA(SSEG_CA),
        .SSEG_AN(SSEG_AN)
    );
    
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
        .inst_wen    (inst_wen      ),
        .alu_out     (alu_out       ),
        .bench_out   (bench_out     ),
        .result_ready(result_ready  ),
        .ap_start    (ap_start      ),
        .ap_stop     (ap_stop       ),
        .debug_state (debug_state_data),
        .count_debug (count_debug_data)
    );


    btn_edge btn(
        .reset(BTN[4]),
        .btnIn(BTN[3]),
        .CLK(CLK100MHZ),
        .btnOut(resume)
        );
    
    // datapath clk_enable FSM
    reg dp_cs, dp_ns;
    always @(posedge CLK100MHZ)
        dp_cs <= (BTN[4]) ? 0 : dp_ns;
        
    always @(*) begin
        case (dp_cs)
            0: dp_ns = (modeflag && (mode_select == 3'h0 || mode_select == 3'h1)) ? 1 : 0;
            1: dp_ns = (modeflag && (mode_select == 3'h2 || mode_select == 3'h3)) ? 0 : 1; // if not datapath mode, disable
        endcase
    end
    datapath dp1(
        .clk((dp_cs) ? CLK100MHZ : 'b0), // Clock gating, turns off datapath when not in right mode;
        .rst(BTN[4] || ap_stop),
        .load_Mem(BTN[2]),
        .resume(resume),
        .user_inst_write(inst_write),
        .user_inst_addr(inst_addr),
        .user_inst_wen(inst_wen),
        .ap_start(ap_start),
        .rf_out(register_data),
        .mem_out(memory_data),
        .ap_start_debug(ap_start_debug),
        .halt(halt),
        .PC_out(PC_out)
    );
    
 
  assign VGA_display_data =SW[1]? memory_data[191:96]: (SW[0]? memory_data[95:0]: register_data);
        
    top_VGA  VGA1(
        .display_values(VGA_display_data),
        .CLK100MHZ((dp_cs) ? CLK100MHZ : 'b0),
        .rst(BTN[4]),
        .VGA_R(VGA_R),
        .VGA_G(VGA_G),
        .VGA_B(VGA_B),
        .VGA_HS(VGA_HS),
        .VGA_VS(VGA_VS)
        );
//    assign VGA_R  = 'b0;
//    assign VGA_G  = 'b0;
//    assign VGA_B  = 'b0;
//    assign VGA_HS = 'b0;
//    assign VGA_VS = 'b0;
    
endmodule
