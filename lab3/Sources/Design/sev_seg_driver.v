`timescale 1ns / 1ps

module sev_seg_driver(
    input wire CLK100MHZ, 
    input wire rst, // rst
    input wire [31:0] din,
    output reg [7:0] SSEG_AN, // anode signals of the 7-segment LED display
    output reg [7:0] SSEG_CA // cathode patterns of the 7-segment LED display
    );
    reg [3:0] hex_val;
    reg [20:0] refresh_counter; // 20-bit for creating 10.5ms refresh period or 380Hz refresh rate
             // the first 2 MSB bits for creating 4 LED-activating signals with 2.6ms digit period
    wire [2:0] LED_activating_counter; 
                 // count     0    ->  1  ->  2  -> ... 7
              // activates    LED1    LED2   LED3   LED8
             // and repeat


    always @(posedge CLK100MHZ or posedge rst)
        refresh_counter <= (rst==1) ? 'b0 : refresh_counter + 1;

    assign LED_activating_counter = refresh_counter[20:18];
    
    always @(*)
    begin
        case(LED_activating_counter)
        3'b000: begin
            SSEG_AN = 8'b11111110; 
            hex_val = din[3 -: 4];
        end
        3'b001: begin
            SSEG_AN = 8'b11111101; 
            hex_val = din[7 -: 4];
        end
        3'b010: begin
            SSEG_AN = 8'b11111011; 
            hex_val = din[11 -: 4];
        end
        3'b011: begin
            SSEG_AN = 8'b11110111; 
            hex_val = din[15 -: 4];
        end
        3'b100: begin
            SSEG_AN = 8'b11101111; 
            hex_val = din[19 -: 4];
        end
        3'b101: begin
            SSEG_AN = 8'b11011111; 
            hex_val = din[23 -: 4];
        end
        3'b110: begin
            SSEG_AN = 8'b10111111; 
            hex_val = din[27 -: 4];
        end
        3'b111: begin
            SSEG_AN = 8'b01111111; 
            hex_val = din[31 -: 4];
        end
        endcase
    end
    // Cathode patterns of the 7-segment LED display 
    always @(*)
    begin
        case(hex_val)
        'h0:SSEG_CA = 8'b11000000;//			   a
        'h1:SSEG_CA = 8'b11111001;//			   __
        'h2:SSEG_CA = 8'b10100100;//			f/	  /b
        'h3:SSEG_CA = 8'b10110000;//		       g
        'h4:SSEG_CA = 8'b10011001;//	           __
        'h5:SSEG_CA = 8'b10010010;//         e/   /c
        'h6:SSEG_CA = 8'b10000010;//            __
        'h7:SSEG_CA = 8'b11111000;//            d
        'h8:SSEG_CA = 8'b10000000;
        'h9:SSEG_CA = 8'b10010000;
        'hA:SSEG_CA = 8'b10001000; 
        'hB:SSEG_CA = 8'b10000011; 
        'hC:SSEG_CA = 8'b11000110;
        'hD:SSEG_CA = 8'b10100001;
        'hE:SSEG_CA = 8'b10000110;
        'hF:SSEG_CA = 8'b10001110;
        default: SSEG_CA = 8'b11000000; // "0"
        endcase
    end
    
 endmodule