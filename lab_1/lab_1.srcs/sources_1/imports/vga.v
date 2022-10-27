`timescale 1ns / 1ps

// Generate HS, VS signals from pixel clock.
// hcounter & vcounter are the index of the current pixel 
// origin (0, 0) at top-left corner of the screen
// valid display range for hcounter: [0, 640)
// valid display range for vcounter: [0, 480)
module vga_controller_640_60(rst, pixel_clk,HS,VS,hcounter,vcounter,blank);

	input pixel_clk, rst;
	output reg HS, VS, blank;
	output reg [10:0] hcounter, vcounter;

	parameter HMAX = 800; // maximum value for the horizontal pixel counter, orig: 800
	parameter VMAX = 525; // maximum value for the vertical pixel counter, orig: 525
	parameter HLINES = 640; // total number of visible columns, orig: 640
	parameter HFP = 648; // value for the horizontal counter where front porch ends, orig: 648
	parameter HSP = 744; // value for the horizontal counter where the synch pulse ends, orig: 744
	parameter VLINES = 480; // total number of visible lines, orig: 480
	parameter VFP = 482; // value for the vertical counter where the front porch ends, orig: 482
	parameter VSP = 484; // value for the vertical counter where the synch pulse ends, orig: 484
	parameter SPP = 0;

	wire video_enable;


	always@(posedge pixel_clk)begin
		blank <= ~video_enable; 
	end

	always@(posedge pixel_clk)begin
	   if(rst==1) begin
        hcounter<=11'b0;
        end
		else if (hcounter == HMAX) hcounter <= 0;
		else hcounter <= hcounter + 1;
	end

	always@(posedge pixel_clk)begin
	    if(rst==1) begin
        vcounter<=11'b0;
        end
		else if(hcounter == HMAX) begin
			if(vcounter == VMAX) vcounter <= 0;
			else vcounter <= vcounter + 1; 
		end
	end

	always@(posedge pixel_clk)begin
		if(hcounter >= HFP && hcounter < HSP) HS <= SPP;
		else HS <= ~SPP; 
	end

	always@(posedge pixel_clk)begin
		if(vcounter >= VFP && vcounter < VSP) VS <= SPP;
		else VS <= ~SPP; 
	end

	assign video_enable = (hcounter < HLINES && vcounter < VLINES) ? 1'b1 : 1'b0;

endmodule

    
//font ROM which identifies bit representation of hex values for VGA
module reduced_font_rom(addr,data);

    input wire [7:0] addr;
    output reg [7:0] data;
   
   // signal declaration
   reg [7:0] addr_reg; 

  // body
   always @(*) 
     addr_reg <= addr;
      
   always @(*)
      case (addr_reg)
         8'h00: data = 8'b00000000; // 
         8'h01: data = 8'b00000000; // 
         8'h02: data = 8'b01111100; //  *****
         8'h03: data = 8'b11000110; // **   **
         8'h04: data = 8'b11000110; // **   **
         8'h05: data = 8'b11001110; // **  ***
         8'h06: data = 8'b11011110; // ** ****
         8'h07: data = 8'b11110110; // **** **
         8'h08: data = 8'b11100110; // ***  **
         8'h09: data = 8'b11000110; // **   **
         8'h0a: data = 8'b11000110; // **   **
         8'h0b: data = 8'b01111100; //  *****
         8'h0c: data = 8'b00000000; // 
         8'h0d: data = 8'b00000000; // 
         8'h0e: data = 8'b00000000; // 
         8'h0f: data = 8'b00000000; // 

         8'h10: data = 8'b00000000; // 
         8'h11: data = 8'b00000000; // 
         8'h12: data = 8'b00011000; // 
         8'h13: data = 8'b00111000; // 
         8'h14: data = 8'b01111000; //    **
         8'h15: data = 8'b00011000; //   ***
         8'h16: data = 8'b00011000; //  ****
         8'h17: data = 8'b00011000; //    **
         8'h18: data = 8'b00011000; //    **
         8'h19: data = 8'b00011000; //    **
         8'h1a: data = 8'b00011000; //    **
         8'h1b: data = 8'b01111110; //    **
         8'h1c: data = 8'b00000000; //    **
         8'h1d: data = 8'b00000000; //  ******
         8'h1e: data = 8'b00000000; // 
         8'h1f: data = 8'b00000000; // 

         8'h20: data = 8'b00000000; // 
         8'h21: data = 8'b00000000; // 
         8'h22: data = 8'b01111100; //  *****
         8'h23: data = 8'b11000110; // **   **
         8'h24: data = 8'b00000110; //      **
         8'h25: data = 8'b00001100; //     **
         8'h26: data = 8'b00011000; //    **
         8'h27: data = 8'b00110000; //   **
         8'h28: data = 8'b01100000; //  **
         8'h29: data = 8'b11000000; // **
         8'h2a: data = 8'b11000110; // **   **
         8'h2b: data = 8'b11111110; // *******
         8'h2c: data = 8'b00000000; // 
         8'h2d: data = 8'b00000000; // 
         8'h2e: data = 8'b00000000; // 
         8'h2f: data = 8'b00000000; // 

         8'h30: data = 8'b00000000; // 
         8'h31: data = 8'b00000000; // 
         8'h32: data = 8'b01111100; //  *****
         8'h33: data = 8'b11000110; // **   **
         8'h34: data = 8'b00000110; //      **
         8'h35: data = 8'b00000110; //      **
         8'h36: data = 8'b00111100; //   ****
         8'h37: data = 8'b00000110; //      **
         8'h38: data = 8'b00000110; //      **
         8'h39: data = 8'b00000110; //      **
         8'h3a: data = 8'b11000110; // **   **
         8'h3b: data = 8'b01111100; //  *****
         8'h3c: data = 8'b00000000; // 
         8'h3d: data = 8'b00000000; // 
         8'h3e: data = 8'b00000000; // 
         8'h3f: data = 8'b00000000; // 

         8'h40: data = 8'b00000000; // 
         8'h41: data = 8'b00000000; // 
         8'h42: data = 8'b00001100; //     **
         8'h43: data = 8'b00011100; //    ***
         8'h44: data = 8'b00111100; //   ****
         8'h45: data = 8'b01101100; //  ** **
         8'h46: data = 8'b11001100; // **  **
         8'h47: data = 8'b11111110; // *******
         8'h48: data = 8'b00001100; //     **
         8'h49: data = 8'b00001100; //     **
         8'h4a: data = 8'b00001100; //     **
         8'h4b: data = 8'b00011110; //    ****
         8'h4c: data = 8'b00000000; // 
         8'h4d: data = 8'b00000000; // 
         8'h4e: data = 8'b00000000; // 
         8'h4f: data = 8'b00000000; // 

         8'h50: data = 8'b00000000; // 
         8'h51: data = 8'b00000000; // 
         8'h52: data = 8'b11111110; // *******
         8'h53: data = 8'b11000000; // **
         8'h54: data = 8'b11000000; // **
         8'h55: data = 8'b11000000; // **
         8'h56: data = 8'b11111100; // ******
         8'h57: data = 8'b00000110; //      **
         8'h58: data = 8'b00000110; //      **
         8'h59: data = 8'b00000110; //      **
         8'h5a: data = 8'b11000110; // **   **
         8'h5b: data = 8'b01111100; //  *****
         8'h5c: data = 8'b00000000; // 
         8'h5d: data = 8'b00000000; // 
         8'h5e: data = 8'b00000000; // 
         8'h5f: data = 8'b00000000; // 

         8'h60: data = 8'b00000000; // 
         8'h61: data = 8'b00000000; // 
         8'h62: data = 8'b00111000; //   ***
         8'h63: data = 8'b01100000; //  **
         8'h64: data = 8'b11000000; // **
         8'h65: data = 8'b11000000; // **
         8'h66: data = 8'b11111100; // ******
         8'h67: data = 8'b11000110; // **   **
         8'h68: data = 8'b11000110; // **   **
         8'h69: data = 8'b11000110; // **   **
         8'h6a: data = 8'b11000110; // **   **
         8'h6b: data = 8'b01111100; //  *****
         8'h6c: data = 8'b00000000; // 
         8'h6d: data = 8'b00000000; // 
         8'h6e: data = 8'b00000000; // 
         8'h6f: data = 8'b00000000; // 

         8'h70: data = 8'b00000000; // 
         8'h71: data = 8'b00000000; // 
         8'h72: data = 8'b11111110; // *******
         8'h73: data = 8'b11000110; // **   **
         8'h74: data = 8'b00000110; //      **
         8'h75: data = 8'b00000110; //      **
         8'h76: data = 8'b00001100; //     **
         8'h77: data = 8'b00011000; //    **
         8'h78: data = 8'b00110000; //   **
         8'h79: data = 8'b00110000; //   **
         8'h7a: data = 8'b00110000; //   **
         8'h7b: data = 8'b00110000; //   **
         8'h7c: data = 8'b00000000; // 
         8'h7d: data = 8'b00000000; // 
         8'h7e: data = 8'b00000000; // 
         8'h7f: data = 8'b00000000; // 

         8'h80: data = 8'b00000000; // 
         8'h81: data = 8'b00000000; // 
         8'h82: data = 8'b01111100; //  *****
         8'h83: data = 8'b11000110; // **   **
         8'h84: data = 8'b11000110; // **   **
         8'h85: data = 8'b11000110; // **   **
         8'h86: data = 8'b01111100; //  *****
         8'h87: data = 8'b11000110; // **   **
         8'h88: data = 8'b11000110; // **   **
         8'h89: data = 8'b11000110; // **   **
         8'h8a: data = 8'b11000110; // **   **
         8'h8b: data = 8'b01111100; //  *****
         8'h8c: data = 8'b00000000; // 
         8'h8d: data = 8'b00000000; // 
         8'h8e: data = 8'b00000000; // 
         8'h8f: data = 8'b00000000; // 

         8'h90: data = 8'b00000000; // 
         8'h91: data = 8'b00000000; // 
         8'h92: data = 8'b01111100; //  *****
         8'h93: data = 8'b11000110; // **   **
         8'h94: data = 8'b11000110; // **   **
         8'h95: data = 8'b11000110; // **   **
         8'h96: data = 8'b01111110; //  ******
         8'h97: data = 8'b00000110; //      **
         8'h98: data = 8'b00000110; //      **
         8'h99: data = 8'b00000110; //      **
         8'h9a: data = 8'b00001100; //     **
         8'h9b: data = 8'b01111000; //  ****
         8'h9c: data = 8'b00000000; // 
         8'h9d: data = 8'b00000000; // 
         8'h9e: data = 8'b00000000; // 
         8'h9f: data = 8'b00000000; // 

         8'ha0: data = 8'b00000000; // 
         8'ha1: data = 8'b00000000; // 
         8'ha2: data = 8'b00010000; //    *
         8'ha3: data = 8'b00111000; //   ***
         8'ha4: data = 8'b01101100; //  ** **
         8'ha5: data = 8'b11000110; // **   **
         8'ha6: data = 8'b11000110; // **   **
         8'ha7: data = 8'b11111110; // *******
         8'ha8: data = 8'b11000110; // **   **
         8'ha9: data = 8'b11000110; // **   **
         8'haa: data = 8'b11000110; // **   **
         8'hab: data = 8'b11000110; // **   **
         8'hac: data = 8'b00000000; // 
         8'had: data = 8'b00000000; // 
         8'hae: data = 8'b00000000; // 
         8'haf: data = 8'b00000000; // 

         8'hb0: data = 8'b00000000; // 
         8'hb1: data = 8'b00000000; // 
         8'hb2: data = 8'b11111100; // ******
         8'hb3: data = 8'b01100110; //  **  **
         8'hb4: data = 8'b01100110; //  **  **
         8'hb5: data = 8'b01100110; //  **  **
         8'hb6: data = 8'b01111100; //  *****
         8'hb7: data = 8'b01100110; //  **  **
         8'hb8: data = 8'b01100110; //  **  **
         8'hb9: data = 8'b01100110; //  **  **
         8'hba: data = 8'b01100110; //  **  **
         8'hbb: data = 8'b11111100; // ******
         8'hbc: data = 8'b00000000; // 
         8'hbd: data = 8'b00000000; // 
         8'hbe: data = 8'b00000000; // 
         8'hbf: data = 8'b00000000; // 

         8'hc0: data = 8'b00000000; // 
         8'hc1: data = 8'b00000000; // 
         8'hc2: data = 8'b00111100; //   ****
         8'hc3: data = 8'b01100110; //  **  **
         8'hc4: data = 8'b11000010; // **    *
         8'hc5: data = 8'b11000000; // **
         8'hc6: data = 8'b11000000; // **
         8'hc7: data = 8'b11000000; // **
         8'hc8: data = 8'b11000000; // **
         8'hc9: data = 8'b11000010; // **    *
         8'hca: data = 8'b01100110; //  **  **
         8'hcb: data = 8'b00111100; //   ****
         8'hcc: data = 8'b00000000; // 
         8'hcd: data = 8'b00000000; // 
         8'hce: data = 8'b00000000; // 
         8'hcf: data = 8'b00000000; // 

         8'hd0: data = 8'b00000000; // 
         8'hd1: data = 8'b00000000; // 
         8'hd2: data = 8'b11111000; // *****
         8'hd3: data = 8'b01101100; //  ** **
         8'hd4: data = 8'b01100110; //  **  **
         8'hd5: data = 8'b01100110; //  **  **
         8'hd6: data = 8'b01100110; //  **  **
         8'hd7: data = 8'b01100110; //  **  **
         8'hd8: data = 8'b01100110; //  **  **
         8'hd9: data = 8'b01100110; //  **  **
         8'hda: data = 8'b01101100; //  ** **
         8'hdb: data = 8'b11111000; // *****
         8'hdc: data = 8'b00000000; // 
         8'hdd: data = 8'b00000000; // 
         8'hde: data = 8'b00000000; // 
         8'hdf: data = 8'b00000000; // 

         8'he0: data = 8'b00000000; // 
         8'he1: data = 8'b00000000; // 
         8'he2: data = 8'b11111110; // *******
         8'he3: data = 8'b01100110; //  **  **
         8'he4: data = 8'b01100010; //  **   *
         8'he5: data = 8'b01101000; //  ** *
         8'he6: data = 8'b01111000; //  ****
         8'he7: data = 8'b01101000; //  ** *
         8'he8: data = 8'b01100000; //  **
         8'he9: data = 8'b01100010; //  **   *
         8'hea: data = 8'b01100110; //  **  **
         8'heb: data = 8'b11111110; // *******
         8'hec: data = 8'b00000000; // 
         8'hed: data = 8'b00000000; // 
         8'hee: data = 8'b00000000; // 
         8'hef: data = 8'b00000000; // 

         8'hf0: data = 8'b00000000; // 
         8'hf1: data = 8'b00000000; // 
         8'hf2: data = 8'b11111110; // *******
         8'hf3: data = 8'b01100110; //  **  **
         8'hf4: data = 8'b01100010; //  **   *
         8'hf5: data = 8'b01101000; //  ** *
         8'hf6: data = 8'b01111000; //  ****
         8'hf7: data = 8'b01101000; //  ** *
         8'hf8: data = 8'b01100000; //  **
         8'hf9: data = 8'b01100000; //  **
         8'hfa: data = 8'b01100000; //  **
         8'hfb: data = 8'b11110000; // ****
         8'hfc: data = 8'b00000000; // 
         8'hfd: data = 8'b00000000; // 
         8'hfe: data = 8'b00000000; // 
         8'hff: data = 8'b00000000; // 
endcase

endmodule


// top module that instantiate the VGA controller and generate images
module top_VGA(
    input wire [15:0] reg_value,
    input wire CLK100MHZ,
    input wire rst,
    output reg [3:0] VGA_R,
    output reg [3:0] VGA_G,
    output reg [3:0] VGA_B,
    output wire VGA_HS,
    output wire VGA_VS
    );

reg pclk_div_cnt=1'b0;
reg pixel_clk=1'b0;
reg rst_VGA=1'b0;
reg [7:0] address;
reg [31:0] address_init;
wire [10:0] vga_hcnt, vga_vcnt;
wire [7:0] data_char;
wire vga_blank;
reg [7:0] address_init_part;
reg [10:0] vga_hcnt_mod;

always @(rst) begin
    rst_VGA <= rst;
end

// Clock divider. Generate 25MHz pixel_clk from 100MHz clock.
always @(posedge CLK100MHZ) begin
    pclk_div_cnt <= !pclk_div_cnt;
    if (pclk_div_cnt == 1'b1) pixel_clk <= !pixel_clk;
end

// Instantiate VGA controller
vga_controller_640_60 vga_controller(
   .rst(rst_VGA), .pixel_clk(pixel_clk), .HS(VGA_HS), .VS(VGA_VS), .hcounter(vga_hcnt), .vcounter(vga_vcnt), .blank(vga_blank) );

// Instantiate font ROM
reduced_font_rom rom_data(.addr(address), .data(data_char));

//determine addresses of text to display based on register file value
genvar i;
generate 
    for(i=0;i<4;i=i+1) begin
    always @(*) begin
            case(reg_value[(i+1)*4-1:i*4])
                4'h0: address_init[(i+1)*8-1:i*8] = 8'h00;
                4'h1: address_init[(i+1)*8-1:i*8] = 8'h10;
                4'h2: address_init[(i+1)*8-1:i*8] = 8'h20;
                4'h3: address_init[(i+1)*8-1:i*8] = 8'h30;
                4'h4: address_init[(i+1)*8-1:i*8] = 8'h40;
                4'h5: address_init[(i+1)*8-1:i*8] = 8'h50;
                4'h6: address_init[(i+1)*8-1:i*8] = 8'h60;
                4'h7: address_init[(i+1)*8-1:i*8] = 8'h70;
                4'h8: address_init[(i+1)*8-1:i*8] = 8'h80;
                4'h9: address_init[(i+1)*8-1:i*8] = 8'h90;
                4'ha: address_init[(i+1)*8-1:i*8] = 8'ha0;
                4'hb: address_init[(i+1)*8-1:i*8] = 8'hb0;
                4'hc: address_init[(i+1)*8-1:i*8] = 8'hc0;
                4'hd: address_init[(i+1)*8-1:i*8] = 8'hd0;
                4'he: address_init[(i+1)*8-1:i*8] = 8'he0;
                4'hf: address_init[(i+1)*8-1:i*8] = 8'hf0;
            endcase
        end
    end
endgenerate
    

// Generate figure to be displayed
// Decide the color for the current pixel at index (hcnt, vcnt).
// This example displays an white square at the center of the screen with a colored checkerboard background.
always @(*) begin
    // Set pixels to black during Sync. Failure to do so will result in dimmed colors or black screens.
    if (vga_blank) begin 
        VGA_R = 0;
        VGA_G = 0;
        VGA_B = 0;
    end
    else begin

            //Identify which hex value we are displaying based on vga_hcnt
            if (vga_hcnt >= 0 && vga_hcnt <= 160) begin          //Reg Hex Value0
                    address_init_part = address_init[31:24]; end
            else if (vga_hcnt >= 161 && vga_hcnt <= 320) begin   //Reg Hex Value1
                    address_init_part = address_init[23:16]; end
            else if (vga_hcnt >= 321 && vga_hcnt <= 480) begin   //Reg Hex Value2
                    address_init_part = address_init[15:8]; end
            else if (vga_hcnt >= 481 && vga_hcnt <= 640) begin   //Reg Hex Value3
                    address_init_part = address_init[7:0]; end
                    

            //Identify which line of the hex value we are displaying based on vga_vcnt
            if (vga_vcnt >=0 && vga_vcnt <=30)begin
                address = address_init_part; end
            else if (vga_vcnt >=31 && vga_vcnt <=60)begin
                address = address_init_part+1; end
            else if (vga_vcnt >=61 && vga_vcnt <=90)begin
                address = address_init_part+2; end
            else if (vga_vcnt >=91 && vga_vcnt <=120)begin
                address = address_init_part+3; end
            else if (vga_vcnt >=121 && vga_vcnt <=150)begin
                address = address_init_part+4; end
            else if (vga_vcnt >=151 && vga_vcnt <=180)begin
                address = address_init_part+5; end
            else if (vga_vcnt >=181 && vga_vcnt <=210)begin
                address = address_init_part+6; end
            else if (vga_vcnt >=211 && vga_vcnt <=240)begin
                address = address_init_part+7; end
            else if (vga_vcnt >=241 && vga_vcnt <=270)begin
                address = address_init_part+8; end
            else if (vga_vcnt >=271 && vga_vcnt <=300)begin
                address = address_init_part+9; end
            else if (vga_vcnt >=301 && vga_vcnt <=330)begin
                address = address_init_part+10; end
            else if (vga_vcnt >=331 && vga_vcnt <=360)begin
                address = address_init_part+11; end
            else if (vga_vcnt >=361 && vga_vcnt <=390)begin
                address = address_init_part+12; end
            else if (vga_vcnt >=391 && vga_vcnt <=420)begin
                address = address_init_part+13; end
            else if (vga_vcnt >=421 && vga_vcnt <=450)begin
                address = address_init_part+14; end
            else if (vga_vcnt >=451 && vga_vcnt <=480)begin
                address = address_init_part+15; end
                
            vga_hcnt_mod = vga_hcnt % 160;

            //Set VGA R, G, and B values based on output from font ROM
            if (vga_hcnt_mod >= 1 && vga_hcnt_mod <= 20) begin   //character 0
                    VGA_R = {4{data_char[7]}}; VGA_G = {4{data_char[7]}}; VGA_B = {4{data_char[7]}}; end
            else if (vga_hcnt_mod >= 21 && vga_hcnt_mod <= 40) begin   //character 1
                    VGA_R = {4{data_char[6]}}; VGA_G = {4{data_char[6]}}; VGA_B = {4{data_char[6]}}; end
            else if (vga_hcnt_mod >= 41 && vga_hcnt_mod <= 60) begin   //character 2
                    VGA_R = {4{data_char[5]}}; VGA_G = {4{data_char[5]}}; VGA_B = {4{data_char[5]}}; end
            else if (vga_hcnt_mod >= 61 && vga_hcnt_mod <= 80) begin   //character 3
                    VGA_R = {4{data_char[4]}}; VGA_G = {4{data_char[4]}}; VGA_B = {4{data_char[4]}}; end
           else if (vga_hcnt_mod >= 81 && vga_hcnt_mod <= 100)  begin   //character 4
                    VGA_R = {4{data_char[3]}}; VGA_G = {4{data_char[3]}}; VGA_B = {4{data_char[3]}}; end
           else if (vga_hcnt_mod >= 101 && vga_hcnt_mod <= 120)  begin   //character 5
                    VGA_R = {4{data_char[2]}}; VGA_G = {4{data_char[2]}}; VGA_B = {4{data_char[2]}}; end
           else if (vga_hcnt_mod >= 121 && vga_hcnt_mod <= 140) begin   //character 6
                    VGA_R = {4{data_char[1]}}; VGA_G = {4{data_char[1]}}; VGA_B = {4{data_char[1]}}; end
           else if (vga_hcnt_mod >= 141 && vga_hcnt_mod <= 159)  begin   //character 7
                    VGA_R = {4{data_char[0]}}; VGA_G = {4{data_char[0]}}; VGA_B = {4{data_char[0]}}; end
		  end
		
end

endmodule
