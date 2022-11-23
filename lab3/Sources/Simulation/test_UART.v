`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2022 07:04:28 PM
// Design Name: 
// Module Name: test_UART
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


module test_UART(

    );
    
    reg          CLK          ;
    reg          RST          ;
    reg [7:0]    UART_TX_DAT  ;
    reg          UART_TX_SEND ;
    wire         UART_XD     ;
    wire         UART_TX_READY;
    wire [7:0]   UART_RX_DAT  ;
    wire         UART_RX_VALID;
    
    UART_controller UC(
        .CLK          (CLK          ),
        .RST          (RST          ),
        .UART_TX_DAT  (UART_TX_DAT  ),
        .UART_TX_SEND (UART_TX_SEND ),
        .UART_RXD     (UART_XD      ),
        .UART_TXD     (UART_XD      ),
        .UART_TX_READY(UART_TX_READY),
        .UART_RX_DAT  (UART_RX_DAT  ),
        .UART_RX_VALID(UART_RX_VALID)
    );
    
    always
        #1 CLK<=~CLK;
        
    initial begin
        CLK         <='b0;
        RST         <='b1;  
        UART_TX_DAT <='b0;  
        UART_TX_SEND<='b0;  
        
        #10;
        RST         <='b0;
        
        #10;
        UART_TX_DAT <=8'b10101010;
        UART_TX_SEND<='b1;
        
        #(10416*20);
    end
endmodule
