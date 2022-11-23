`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2020 10:08:25 PM
// Design Name: 
// Module Name: btn_edge
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


module btn_edge(
    input reset,
    input btnIn,
    input CLK,
    output wire btnOut
    );
    
    wire db_BTN;
    debounce db(btnIn, CLK, reset, db_BTN);
    
    reg BTN_f;
    reg BTN_sync;
    
    always @(posedge CLK ) begin
        BTN_f    <= db_BTN;
        BTN_sync <= BTN_f;
    end
    
    reg  BTN_sync_f;
    
    always @(posedge CLK) begin
        if (reset) begin
            BTN_sync_f <= 1'b0;
        end else begin
            BTN_sync_f <= BTN_sync;
        end
    end
    
    assign btnOut = BTN_sync & ~BTN_sync_f; // Detects rising edge
endmodule
