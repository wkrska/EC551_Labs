
o
Command: %s
53*	vivadotcl2>
*write_bitstream -force term_interf_top.bit2default:defaultZ4-113h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7a100t2default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7a100t2default:defaultZ17-349h px? 
x
,Running DRC as a precondition to command %s
1349*	planAhead2#
write_bitstream2default:defaultZ12-1349h px? 
>
IP Catalog is up to date.1232*coregenZ19-1839h px? 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
?
?Missing CFGBVS and CONFIG_VOLTAGE Design Properties: Neither the CFGBVS nor CONFIG_VOLTAGE voltage property is set in the current_design.  Configuration bank voltage select (CFGBVS) must be set to VCCO or GND, and CONFIG_VOLTAGE must be set to the correct configuration voltage, in order to determine the I/O voltage support for the pins in bank 0.  It is suggested to specify these either using the 'Edit Device Properties' function in the GUI or directly in the XDC file using the following syntax:

 set_property CFGBVS value1 [current_design]
 #where value1 is either VCCO or GND

 set_property CONFIG_VOLTAGE value2 [current_design]
 #where value2 is the voltage provided to configuration bank 0

Refer to the device configuration user guide for more information.%s*DRC2(
 DRC|Pin Planning2default:default8ZCFGBVS-1h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2[
 "E
VGA1/vga_controller/E[0]VGA1/vga_controller/E2default:default2default:default2?
 "|
2VGA1/vga_controller/address_init_part_reg[7]_i_2/O2VGA1/vga_controller/address_init_part_reg[7]_i_2/O2default:default2default:default2?
 "x
0VGA1/vga_controller/address_init_part_reg[7]_i_2	0VGA1/vga_controller/address_init_part_reg[7]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2l
 "V
VGA1/vga_controller/blank_reg_0VGA1/vga_controller/blank_reg_02default:default2default:default2?
 "j
)VGA1/vga_controller/vsection_reg[0]_i_2/O)VGA1/vga_controller/vsection_reg[0]_i_2/O2default:default2default:default2|
 "f
'VGA1/vga_controller/vsection_reg[0]_i_2	'VGA1/vga_controller/vsection_reg[0]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2o
 "Y
"VGA1/vga_controller/blank_reg_1[0]VGA1/vga_controller/blank_reg_12default:default2default:default2?
 "j
)VGA1/vga_controller/hsection_reg[1]_i_2/O)VGA1/vga_controller/hsection_reg[1]_i_2/O2default:default2default:default2|
 "f
'VGA1/vga_controller/hsection_reg[1]_i_2	'VGA1/vga_controller/hsection_reg[1]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2o
 "Y
"VGA1/vga_controller/blank_reg_2[0]VGA1/vga_controller/blank_reg_22default:default2default:default2~
 "h
(VGA1/vga_controller/address_reg[7]_i_2/O(VGA1/vga_controller/address_reg[7]_i_2/O2default:default2default:default2z
 "d
&VGA1/vga_controller/address_reg[7]_i_2	&VGA1/vga_controller/address_reg[7]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2o
 "Y
"VGA1/vga_controller/blank_reg_3[0]VGA1/vga_controller/blank_reg_32default:default2default:default2?
 "~
3VGA1/vga_controller/address_init_curr_reg[31]_i_2/O3VGA1/vga_controller/address_init_curr_reg[31]_i_2/O2default:default2default:default2?
 "z
1VGA1/vga_controller/address_init_curr_reg[31]_i_2	1VGA1/vga_controller/address_init_curr_reg[31]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2V
 "@
cs/fifo/uart_tx_sendcs/fifo/uart_tx_send2default:default2default:default2`
 "J
cs/fifo/buf_mem_reg_i_2/Ocs/fifo/buf_mem_reg_i_2/O2default:default2default:default2\
 "F
cs/fifo/buf_mem_reg_i_2	cs/fifo/buf_mem_reg_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2Z
 "D
cs/rd_n_reg[1]_i_2_n_2cs/rd_n_reg[1]_i_2_n_22default:default2default:default2V
 "@
cs/rd_n_reg[1]_i_2/Ocs/rd_n_reg[1]_i_2/O2default:default2default:default2R
 "<
cs/rd_n_reg[1]_i_2	cs/rd_n_reg[1]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2t
 "^
#dp1/fetch_0/stall_ns_reg[1]_i_1_n_2#dp1/fetch_0/stall_ns_reg[1]_i_1_n_22default:default2default:default2p
 "Z
!dp1/fetch_0/stall_ns_reg[1]_i_1/O!dp1/fetch_0/stall_ns_reg[1]_i_1/O2default:default2default:default2l
 "V
dp1/fetch_0/stall_ns_reg[1]_i_1	dp1/fetch_0/stall_ns_reg[1]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2D
 ".
dp1/halt_nsdp1/halt_ns2default:default2default:default2X
 "B
dp1/clk_sel_reg_i_2/Odp1/clk_sel_reg_i_2/O2default:default2default:default2T
 ">
dp1/clk_sel_reg_i_2	dp1/clk_sel_reg_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2d
 "N
dp1/mem_0/mem_reg[30][1]/G0dp1/mem_0/mem_reg[30][1]/G02default:default2default:default2l
 "V
dp1/mem_0/mem_reg[30][1]/L3_2/Odp1/mem_0/mem_reg[30][1]/L3_2/O2default:default2default:default2h
 "R
dp1/mem_0/mem_reg[30][1]/L3_2	dp1/mem_0/mem_reg[30][1]/L3_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2d
 "N
dp1/mem_0/mem_reg[30][2]/G0dp1/mem_0/mem_reg[30][2]/G02default:default2default:default2l
 "V
dp1/mem_0/mem_reg[30][2]/L3_2/Odp1/mem_0/mem_reg[30][2]/L3_2/O2default:default2default:default2h
 "R
dp1/mem_0/mem_reg[30][2]/L3_2	dp1/mem_0/mem_reg[30][2]/L3_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2d
 "N
dp1/mem_0/mem_reg[30][3]/G0dp1/mem_0/mem_reg[30][3]/G02default:default2default:default2l
 "V
dp1/mem_0/mem_reg[30][3]/L3_2/Odp1/mem_0/mem_reg[30][3]/L3_2/O2default:default2default:default2h
 "R
dp1/mem_0/mem_reg[30][3]/L3_2	dp1/mem_0/mem_reg[30][3]/L3_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2d
 "N
dp1/mem_0/mem_reg[30][4]/G0dp1/mem_0/mem_reg[30][4]/G02default:default2default:default2l
 "V
dp1/mem_0/mem_reg[30][4]/L3_2/Odp1/mem_0/mem_reg[30][4]/L3_2/O2default:default2default:default2h
 "R
dp1/mem_0/mem_reg[30][4]/L3_2	dp1/mem_0/mem_reg[30][4]/L3_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2d
 "N
dp1/mem_0/mem_reg[31][0]/G0dp1/mem_0/mem_reg[31][0]/G02default:default2default:default2l
 "V
dp1/mem_0/mem_reg[31][0]/L3_2/Odp1/mem_0/mem_reg[31][0]/L3_2/O2default:default2default:default2h
 "R
dp1/mem_0/mem_reg[31][0]/L3_2	dp1/mem_0/mem_reg[31][0]/L3_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2d
 "N
dp1/mem_0/mem_reg[31][1]/G0dp1/mem_0/mem_reg[31][1]/G02default:default2default:default2l
 "V
dp1/mem_0/mem_reg[31][1]/L3_2/Odp1/mem_0/mem_reg[31][1]/L3_2/O2default:default2default:default2h
 "R
dp1/mem_0/mem_reg[31][1]/L3_2	dp1/mem_0/mem_reg[31][1]/L3_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2d
 "N
dp1/mem_0/mem_reg[31][2]/G0dp1/mem_0/mem_reg[31][2]/G02default:default2default:default2l
 "V
dp1/mem_0/mem_reg[31][2]/L3_2/Odp1/mem_0/mem_reg[31][2]/L3_2/O2default:default2default:default2h
 "R
dp1/mem_0/mem_reg[31][2]/L3_2	dp1/mem_0/mem_reg[31][2]/L3_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2d
 "N
dp1/mem_0/mem_reg[31][3]/G0dp1/mem_0/mem_reg[31][3]/G02default:default2default:default2l
 "V
dp1/mem_0/mem_reg[31][3]/L3_2/Odp1/mem_0/mem_reg[31][3]/L3_2/O2default:default2default:default2h
 "R
dp1/mem_0/mem_reg[31][3]/L3_2	dp1/mem_0/mem_reg[31][3]/L3_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2d
 "N
dp1/mem_0/mem_reg[31][4]/G0dp1/mem_0/mem_reg[31][4]/G02default:default2default:default2l
 "V
dp1/mem_0/mem_reg[31][4]/L3_2/Odp1/mem_0/mem_reg[31][4]/L3_2/O2default:default2default:default2h
 "R
dp1/mem_0/mem_reg[31][4]/L3_2	dp1/mem_0/mem_reg[31][4]/L3_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2d
 "N
dp1/mem_0/mem_reg[32][5]/G0dp1/mem_0/mem_reg[32][5]/G02default:default2default:default2l
 "V
dp1/mem_0/mem_reg[32][5]/L3_2/Odp1/mem_0/mem_reg[32][5]/L3_2/O2default:default2default:default2h
 "R
dp1/mem_0/mem_reg[32][5]/L3_2	dp1/mem_0/mem_reg[32][5]/L3_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2d
 "N
dp1/mem_0/mem_reg[34][1]/G0dp1/mem_0/mem_reg[34][1]/G02default:default2default:default2l
 "V
dp1/mem_0/mem_reg[34][1]/L3_2/Odp1/mem_0/mem_reg[34][1]/L3_2/O2default:default2default:default2h
 "R
dp1/mem_0/mem_reg[34][1]/L3_2	dp1/mem_0/mem_reg[34][1]/L3_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2d
 "N
dp1/mem_0/mem_reg[34][5]/G0dp1/mem_0/mem_reg[34][5]/G02default:default2default:default2l
 "V
dp1/mem_0/mem_reg[34][5]/L3_2/Odp1/mem_0/mem_reg[34][5]/L3_2/O2default:default2default:default2h
 "R
dp1/mem_0/mem_reg[34][5]/L3_2	dp1/mem_0/mem_reg[34][5]/L3_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2d
 "N
dp1/mem_0/mem_reg[36][2]/G0dp1/mem_0/mem_reg[36][2]/G02default:default2default:default2l
 "V
dp1/mem_0/mem_reg[36][2]/L3_2/Odp1/mem_0/mem_reg[36][2]/L3_2/O2default:default2default:default2h
 "R
dp1/mem_0/mem_reg[36][2]/L3_2	dp1/mem_0/mem_reg[36][2]/L3_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2d
 "N
dp1/mem_0/mem_reg[36][5]/G0dp1/mem_0/mem_reg[36][5]/G02default:default2default:default2l
 "V
dp1/mem_0/mem_reg[36][5]/L3_2/Odp1/mem_0/mem_reg[36][5]/L3_2/O2default:default2default:default2h
 "R
dp1/mem_0/mem_reg[36][5]/L3_2	dp1/mem_0/mem_reg[36][5]/L3_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2d
 "N
dp1/mem_0/mem_reg[38][1]/G0dp1/mem_0/mem_reg[38][1]/G02default:default2default:default2l
 "V
dp1/mem_0/mem_reg[38][1]/L3_2/Odp1/mem_0/mem_reg[38][1]/L3_2/O2default:default2default:default2h
 "R
dp1/mem_0/mem_reg[38][1]/L3_2	dp1/mem_0/mem_reg[38][1]/L3_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2d
 "N
dp1/mem_0/mem_reg[38][2]/G0dp1/mem_0/mem_reg[38][2]/G02default:default2default:default2l
 "V
dp1/mem_0/mem_reg[38][2]/L3_2/Odp1/mem_0/mem_reg[38][2]/L3_2/O2default:default2default:default2h
 "R
dp1/mem_0/mem_reg[38][2]/L3_2	dp1/mem_0/mem_reg[38][2]/L3_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2d
 "N
dp1/mem_0/mem_reg[38][5]/G0dp1/mem_0/mem_reg[38][5]/G02default:default2default:default2l
 "V
dp1/mem_0/mem_reg[38][5]/L3_2/Odp1/mem_0/mem_reg[38][5]/L3_2/O2default:default2default:default2h
 "R
dp1/mem_0/mem_reg[38][5]/L3_2	dp1/mem_0/mem_reg[38][5]/L3_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2\
 "F
dp1/reg1/dout_reg[60]_4dp1/reg1/dout_reg[60]_42default:default2default:default2d
 "N
dp1/reg1/cmp_flag_reg_i_1/Odp1/reg1/cmp_flag_reg_i_1/O2default:default2default:default2`
 "J
dp1/reg1/cmp_flag_reg_i_1	dp1/reg1/cmp_flag_reg_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2a
 "K
dp1/reg2/ap_start_cs_reg[0]dp1/reg2/ap_start_cs_reg2default:default2default:default2j
 "T
dp1/reg2/mem_reg[30][15]_i_1/Odp1/reg2/mem_reg[30][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[30][15]_i_1	dp1/reg2/mem_reg[30][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2e
 "O
dp1/reg2/ap_start_cs_reg_0[0]dp1/reg2/ap_start_cs_reg_02default:default2default:default2j
 "T
dp1/reg2/mem_reg[32][15]_i_1/Odp1/reg2/mem_reg[32][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[32][15]_i_1	dp1/reg2/mem_reg[32][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2e
 "O
dp1/reg2/ap_start_cs_reg_1[0]dp1/reg2/ap_start_cs_reg_12default:default2default:default2j
 "T
dp1/reg2/mem_reg[34][15]_i_1/Odp1/reg2/mem_reg[34][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[34][15]_i_1	dp1/reg2/mem_reg[34][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2e
 "O
dp1/reg2/ap_start_cs_reg_2[0]dp1/reg2/ap_start_cs_reg_22default:default2default:default2j
 "T
dp1/reg2/mem_reg[36][15]_i_1/Odp1/reg2/mem_reg[36][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[36][15]_i_1	dp1/reg2/mem_reg[36][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2e
 "O
dp1/reg2/ap_start_cs_reg_3[0]dp1/reg2/ap_start_cs_reg_32default:default2default:default2j
 "T
dp1/reg2/mem_reg[38][15]_i_1/Odp1/reg2/mem_reg[38][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[38][15]_i_1	dp1/reg2/mem_reg[38][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2e
 "O
dp1/reg2/ap_start_cs_reg_4[0]dp1/reg2/ap_start_cs_reg_42default:default2default:default2j
 "T
dp1/reg2/mem_reg[31][15]_i_1/Odp1/reg2/mem_reg[31][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[31][15]_i_1	dp1/reg2/mem_reg[31][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2_
 "I
dp1/reg2/dout_reg[25]_0[0]dp1/reg2/dout_reg[25]_02default:default2default:default2h
 "R
dp1/reg2/mem_reg[2][15]_i_1/Odp1/reg2/mem_reg[2][15]_i_1/O2default:default2default:default2d
 "N
dp1/reg2/mem_reg[2][15]_i_1	dp1/reg2/mem_reg[2][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2_
 "I
dp1/reg2/dout_reg[25]_1[0]dp1/reg2/dout_reg[25]_12default:default2default:default2h
 "R
dp1/reg2/mem_reg[4][15]_i_1/Odp1/reg2/mem_reg[4][15]_i_1/O2default:default2default:default2d
 "N
dp1/reg2/mem_reg[4][15]_i_1	dp1/reg2/mem_reg[4][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2_
 "I
dp1/reg2/dout_reg[25]_2[0]dp1/reg2/dout_reg[25]_22default:default2default:default2h
 "R
dp1/reg2/mem_reg[8][15]_i_1/Odp1/reg2/mem_reg[8][15]_i_1/O2default:default2default:default2d
 "N
dp1/reg2/mem_reg[8][15]_i_1	dp1/reg2/mem_reg[8][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2_
 "I
dp1/reg2/dout_reg[25]_3[0]dp1/reg2/dout_reg[25]_32default:default2default:default2j
 "T
dp1/reg2/mem_reg[16][15]_i_1/Odp1/reg2/mem_reg[16][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[16][15]_i_1	dp1/reg2/mem_reg[16][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2_
 "I
dp1/reg2/dout_reg[25]_4[0]dp1/reg2/dout_reg[25]_42default:default2default:default2j
 "T
dp1/reg2/mem_reg[64][15]_i_1/Odp1/reg2/mem_reg[64][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[64][15]_i_1	dp1/reg2/mem_reg[64][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2_
 "I
dp1/reg2/dout_reg[25]_5[0]dp1/reg2/dout_reg[25]_52default:default2default:default2l
 "V
dp1/reg2/mem_reg[128][15]_i_2/Odp1/reg2/mem_reg[128][15]_i_2/O2default:default2default:default2h
 "R
dp1/reg2/mem_reg[128][15]_i_2	dp1/reg2/mem_reg[128][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2_
 "I
dp1/reg2/dout_reg[25]_6[0]dp1/reg2/dout_reg[25]_62default:default2default:default2h
 "R
dp1/reg2/mem_reg[1][15]_i_1/Odp1/reg2/mem_reg[1][15]_i_1/O2default:default2default:default2d
 "N
dp1/reg2/mem_reg[1][15]_i_1	dp1/reg2/mem_reg[1][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2e
 "O
dp1/reg2/inst_addr_reg[10][0]dp1/reg2/inst_addr_reg[10]2default:default2default:default2h
 "R
dp1/reg2/mem_reg[0][15]_i_1/Odp1/reg2/mem_reg[0][15]_i_1/O2default:default2default:default2d
 "N
dp1/reg2/mem_reg[0][15]_i_1	dp1/reg2/mem_reg[0][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2i
 "S
dp1/reg2/inst_addr_reg[10]_0[0]dp1/reg2/inst_addr_reg[10]_02default:default2default:default2h
 "R
dp1/reg2/mem_reg[6][15]_i_1/Odp1/reg2/mem_reg[6][15]_i_1/O2default:default2default:default2d
 "N
dp1/reg2/mem_reg[6][15]_i_1	dp1/reg2/mem_reg[6][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2m
 "W
!dp1/reg2/inst_addr_reg[10]_100[0]dp1/reg2/inst_addr_reg[10]_1002default:default2default:default2j
 "T
dp1/reg2/mem_reg[33][15]_i_1/Odp1/reg2/mem_reg[33][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[33][15]_i_1	dp1/reg2/mem_reg[33][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2m
 "W
!dp1/reg2/inst_addr_reg[10]_101[0]dp1/reg2/inst_addr_reg[10]_1012default:default2default:default2j
 "T
dp1/reg2/mem_reg[29][15]_i_1/Odp1/reg2/mem_reg[29][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[29][15]_i_1	dp1/reg2/mem_reg[29][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2m
 "W
!dp1/reg2/inst_addr_reg[10]_102[0]dp1/reg2/inst_addr_reg[10]_1022default:default2default:default2j
 "T
dp1/reg2/mem_reg[27][15]_i_1/Odp1/reg2/mem_reg[27][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[27][15]_i_1	dp1/reg2/mem_reg[27][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2m
 "W
!dp1/reg2/inst_addr_reg[10]_103[0]dp1/reg2/inst_addr_reg[10]_1032default:default2default:default2j
 "T
dp1/reg2/mem_reg[25][15]_i_1/Odp1/reg2/mem_reg[25][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[25][15]_i_1	dp1/reg2/mem_reg[25][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2m
 "W
!dp1/reg2/inst_addr_reg[10]_104[0]dp1/reg2/inst_addr_reg[10]_1042default:default2default:default2j
 "T
dp1/reg2/mem_reg[23][15]_i_1/Odp1/reg2/mem_reg[23][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[23][15]_i_1	dp1/reg2/mem_reg[23][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2m
 "W
!dp1/reg2/inst_addr_reg[10]_105[0]dp1/reg2/inst_addr_reg[10]_1052default:default2default:default2j
 "T
dp1/reg2/mem_reg[21][15]_i_1/Odp1/reg2/mem_reg[21][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[21][15]_i_1	dp1/reg2/mem_reg[21][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2m
 "W
!dp1/reg2/inst_addr_reg[10]_106[0]dp1/reg2/inst_addr_reg[10]_1062default:default2default:default2j
 "T
dp1/reg2/mem_reg[19][15]_i_1/Odp1/reg2/mem_reg[19][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[19][15]_i_1	dp1/reg2/mem_reg[19][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2m
 "W
!dp1/reg2/inst_addr_reg[10]_107[0]dp1/reg2/inst_addr_reg[10]_1072default:default2default:default2j
 "T
dp1/reg2/mem_reg[17][15]_i_1/Odp1/reg2/mem_reg[17][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[17][15]_i_1	dp1/reg2/mem_reg[17][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2m
 "W
!dp1/reg2/inst_addr_reg[10]_108[0]dp1/reg2/inst_addr_reg[10]_1082default:default2default:default2j
 "T
dp1/reg2/mem_reg[15][15]_i_1/Odp1/reg2/mem_reg[15][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[15][15]_i_1	dp1/reg2/mem_reg[15][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2m
 "W
!dp1/reg2/inst_addr_reg[10]_109[0]dp1/reg2/inst_addr_reg[10]_1092default:default2default:default2j
 "T
dp1/reg2/mem_reg[13][15]_i_1/Odp1/reg2/mem_reg[13][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[13][15]_i_1	dp1/reg2/mem_reg[13][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2k
 "U
 dp1/reg2/inst_addr_reg[10]_10[0]dp1/reg2/inst_addr_reg[10]_102default:default2default:default2j
 "T
dp1/reg2/mem_reg[40][15]_i_1/Odp1/reg2/mem_reg[40][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[40][15]_i_1	dp1/reg2/mem_reg[40][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2m
 "W
!dp1/reg2/inst_addr_reg[10]_110[0]dp1/reg2/inst_addr_reg[10]_1102default:default2default:default2j
 "T
dp1/reg2/mem_reg[11][15]_i_1/Odp1/reg2/mem_reg[11][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[11][15]_i_1	dp1/reg2/mem_reg[11][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2m
 "W
!dp1/reg2/inst_addr_reg[10]_111[0]dp1/reg2/inst_addr_reg[10]_1112default:default2default:default2h
 "R
dp1/reg2/mem_reg[9][15]_i_1/Odp1/reg2/mem_reg[9][15]_i_1/O2default:default2default:default2d
 "N
dp1/reg2/mem_reg[9][15]_i_1	dp1/reg2/mem_reg[9][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2m
 "W
!dp1/reg2/inst_addr_reg[10]_112[0]dp1/reg2/inst_addr_reg[10]_1122default:default2default:default2h
 "R
dp1/reg2/mem_reg[7][15]_i_1/Odp1/reg2/mem_reg[7][15]_i_1/O2default:default2default:default2d
 "N
dp1/reg2/mem_reg[7][15]_i_1	dp1/reg2/mem_reg[7][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2m
 "W
!dp1/reg2/inst_addr_reg[10]_113[0]dp1/reg2/inst_addr_reg[10]_1132default:default2default:default2h
 "R
dp1/reg2/mem_reg[5][15]_i_1/Odp1/reg2/mem_reg[5][15]_i_1/O2default:default2default:default2d
 "N
dp1/reg2/mem_reg[5][15]_i_1	dp1/reg2/mem_reg[5][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2m
 "W
!dp1/reg2/inst_addr_reg[10]_114[0]dp1/reg2/inst_addr_reg[10]_1142default:default2default:default2h
 "R
dp1/reg2/mem_reg[3][15]_i_1/Odp1/reg2/mem_reg[3][15]_i_1/O2default:default2default:default2d
 "N
dp1/reg2/mem_reg[3][15]_i_1	dp1/reg2/mem_reg[3][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2k
 "U
 dp1/reg2/inst_addr_reg[10]_11[0]dp1/reg2/inst_addr_reg[10]_112default:default2default:default2j
 "T
dp1/reg2/mem_reg[42][15]_i_1/Odp1/reg2/mem_reg[42][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[42][15]_i_1	dp1/reg2/mem_reg[42][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2k
 "U
 dp1/reg2/inst_addr_reg[10]_12[0]dp1/reg2/inst_addr_reg[10]_122default:default2default:default2j
 "T
dp1/reg2/mem_reg[44][15]_i_1/Odp1/reg2/mem_reg[44][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[44][15]_i_1	dp1/reg2/mem_reg[44][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2k
 "U
 dp1/reg2/inst_addr_reg[10]_13[0]dp1/reg2/inst_addr_reg[10]_132default:default2default:default2j
 "T
dp1/reg2/mem_reg[46][15]_i_1/Odp1/reg2/mem_reg[46][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[46][15]_i_1	dp1/reg2/mem_reg[46][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2k
 "U
 dp1/reg2/inst_addr_reg[10]_14[0]dp1/reg2/inst_addr_reg[10]_142default:default2default:default2j
 "T
dp1/reg2/mem_reg[48][15]_i_1/Odp1/reg2/mem_reg[48][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[48][15]_i_1	dp1/reg2/mem_reg[48][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2k
 "U
 dp1/reg2/inst_addr_reg[10]_15[0]dp1/reg2/inst_addr_reg[10]_152default:default2default:default2j
 "T
dp1/reg2/mem_reg[50][15]_i_1/Odp1/reg2/mem_reg[50][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[50][15]_i_1	dp1/reg2/mem_reg[50][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2k
 "U
 dp1/reg2/inst_addr_reg[10]_16[0]dp1/reg2/inst_addr_reg[10]_162default:default2default:default2j
 "T
dp1/reg2/mem_reg[52][15]_i_1/Odp1/reg2/mem_reg[52][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[52][15]_i_1	dp1/reg2/mem_reg[52][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2k
 "U
 dp1/reg2/inst_addr_reg[10]_17[0]dp1/reg2/inst_addr_reg[10]_172default:default2default:default2j
 "T
dp1/reg2/mem_reg[54][15]_i_1/Odp1/reg2/mem_reg[54][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[54][15]_i_1	dp1/reg2/mem_reg[54][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2k
 "U
 dp1/reg2/inst_addr_reg[10]_18[0]dp1/reg2/inst_addr_reg[10]_182default:default2default:default2j
 "T
dp1/reg2/mem_reg[56][15]_i_1/Odp1/reg2/mem_reg[56][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[56][15]_i_1	dp1/reg2/mem_reg[56][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2k
 "U
 dp1/reg2/inst_addr_reg[10]_19[0]dp1/reg2/inst_addr_reg[10]_192default:default2default:default2j
 "T
dp1/reg2/mem_reg[58][15]_i_1/Odp1/reg2/mem_reg[58][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[58][15]_i_1	dp1/reg2/mem_reg[58][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2i
 "S
dp1/reg2/inst_addr_reg[10]_1[0]dp1/reg2/inst_addr_reg[10]_12default:default2default:default2j
 "T
dp1/reg2/mem_reg[10][15]_i_1/Odp1/reg2/mem_reg[10][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[10][15]_i_1	dp1/reg2/mem_reg[10][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2k
 "U
 dp1/reg2/inst_addr_reg[10]_20[0]dp1/reg2/inst_addr_reg[10]_202default:default2default:default2j
 "T
dp1/reg2/mem_reg[60][15]_i_1/Odp1/reg2/mem_reg[60][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[60][15]_i_1	dp1/reg2/mem_reg[60][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2k
 "U
 dp1/reg2/inst_addr_reg[10]_21[0]dp1/reg2/inst_addr_reg[10]_212default:default2default:default2j
 "T
dp1/reg2/mem_reg[62][15]_i_1/Odp1/reg2/mem_reg[62][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[62][15]_i_1	dp1/reg2/mem_reg[62][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2k
 "U
 dp1/reg2/inst_addr_reg[10]_22[0]dp1/reg2/inst_addr_reg[10]_222default:default2default:default2j
 "T
dp1/reg2/mem_reg[66][15]_i_1/Odp1/reg2/mem_reg[66][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[66][15]_i_1	dp1/reg2/mem_reg[66][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2k
 "U
 dp1/reg2/inst_addr_reg[10]_23[0]dp1/reg2/inst_addr_reg[10]_232default:default2default:default2j
 "T
dp1/reg2/mem_reg[68][15]_i_1/Odp1/reg2/mem_reg[68][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[68][15]_i_1	dp1/reg2/mem_reg[68][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2k
 "U
 dp1/reg2/inst_addr_reg[10]_24[0]dp1/reg2/inst_addr_reg[10]_242default:default2default:default2j
 "T
dp1/reg2/mem_reg[70][15]_i_1/Odp1/reg2/mem_reg[70][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[70][15]_i_1	dp1/reg2/mem_reg[70][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2k
 "U
 dp1/reg2/inst_addr_reg[10]_25[0]dp1/reg2/inst_addr_reg[10]_252default:default2default:default2j
 "T
dp1/reg2/mem_reg[72][15]_i_1/Odp1/reg2/mem_reg[72][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[72][15]_i_1	dp1/reg2/mem_reg[72][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2k
 "U
 dp1/reg2/inst_addr_reg[10]_26[0]dp1/reg2/inst_addr_reg[10]_262default:default2default:default2j
 "T
dp1/reg2/mem_reg[74][15]_i_1/Odp1/reg2/mem_reg[74][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[74][15]_i_1	dp1/reg2/mem_reg[74][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2k
 "U
 dp1/reg2/inst_addr_reg[10]_27[0]dp1/reg2/inst_addr_reg[10]_272default:default2default:default2j
 "T
dp1/reg2/mem_reg[76][15]_i_1/Odp1/reg2/mem_reg[76][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[76][15]_i_1	dp1/reg2/mem_reg[76][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2k
 "U
 dp1/reg2/inst_addr_reg[10]_28[0]dp1/reg2/inst_addr_reg[10]_282default:default2default:default2j
 "T
dp1/reg2/mem_reg[78][15]_i_1/Odp1/reg2/mem_reg[78][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[78][15]_i_1	dp1/reg2/mem_reg[78][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2k
 "U
 dp1/reg2/inst_addr_reg[10]_29[0]dp1/reg2/inst_addr_reg[10]_292default:default2default:default2j
 "T
dp1/reg2/mem_reg[80][15]_i_1/Odp1/reg2/mem_reg[80][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[80][15]_i_1	dp1/reg2/mem_reg[80][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2i
 "S
dp1/reg2/inst_addr_reg[10]_2[0]dp1/reg2/inst_addr_reg[10]_22default:default2default:default2j
 "T
dp1/reg2/mem_reg[12][15]_i_1/Odp1/reg2/mem_reg[12][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[12][15]_i_1	dp1/reg2/mem_reg[12][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2k
 "U
 dp1/reg2/inst_addr_reg[10]_30[0]dp1/reg2/inst_addr_reg[10]_302default:default2default:default2j
 "T
dp1/reg2/mem_reg[82][15]_i_1/Odp1/reg2/mem_reg[82][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[82][15]_i_1	dp1/reg2/mem_reg[82][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2k
 "U
 dp1/reg2/inst_addr_reg[10]_31[0]dp1/reg2/inst_addr_reg[10]_312default:default2default:default2j
 "T
dp1/reg2/mem_reg[84][15]_i_1/Odp1/reg2/mem_reg[84][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[84][15]_i_1	dp1/reg2/mem_reg[84][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2k
 "U
 dp1/reg2/inst_addr_reg[10]_32[0]dp1/reg2/inst_addr_reg[10]_322default:default2default:default2j
 "T
dp1/reg2/mem_reg[86][15]_i_1/Odp1/reg2/mem_reg[86][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[86][15]_i_1	dp1/reg2/mem_reg[86][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2k
 "U
 dp1/reg2/inst_addr_reg[10]_33[0]dp1/reg2/inst_addr_reg[10]_332default:default2default:default2j
 "T
dp1/reg2/mem_reg[88][15]_i_1/Odp1/reg2/mem_reg[88][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[88][15]_i_1	dp1/reg2/mem_reg[88][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2k
 "U
 dp1/reg2/inst_addr_reg[10]_34[0]dp1/reg2/inst_addr_reg[10]_342default:default2default:default2j
 "T
dp1/reg2/mem_reg[90][15]_i_1/Odp1/reg2/mem_reg[90][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[90][15]_i_1	dp1/reg2/mem_reg[90][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2k
 "U
 dp1/reg2/inst_addr_reg[10]_35[0]dp1/reg2/inst_addr_reg[10]_352default:default2default:default2j
 "T
dp1/reg2/mem_reg[92][15]_i_1/Odp1/reg2/mem_reg[92][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[92][15]_i_1	dp1/reg2/mem_reg[92][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2k
 "U
 dp1/reg2/inst_addr_reg[10]_36[0]dp1/reg2/inst_addr_reg[10]_362default:default2default:default2j
 "T
dp1/reg2/mem_reg[94][15]_i_1/Odp1/reg2/mem_reg[94][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[94][15]_i_1	dp1/reg2/mem_reg[94][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2k
 "U
 dp1/reg2/inst_addr_reg[10]_37[0]dp1/reg2/inst_addr_reg[10]_372default:default2default:default2j
 "T
dp1/reg2/mem_reg[96][15]_i_1/Odp1/reg2/mem_reg[96][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[96][15]_i_1	dp1/reg2/mem_reg[96][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2k
 "U
 dp1/reg2/inst_addr_reg[10]_38[0]dp1/reg2/inst_addr_reg[10]_382default:default2default:default2j
 "T
dp1/reg2/mem_reg[98][15]_i_1/Odp1/reg2/mem_reg[98][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[98][15]_i_1	dp1/reg2/mem_reg[98][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2k
 "U
 dp1/reg2/inst_addr_reg[10]_39[0]dp1/reg2/inst_addr_reg[10]_392default:default2default:default2l
 "V
dp1/reg2/mem_reg[100][15]_i_1/Odp1/reg2/mem_reg[100][15]_i_1/O2default:default2default:default2h
 "R
dp1/reg2/mem_reg[100][15]_i_1	dp1/reg2/mem_reg[100][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2i
 "S
dp1/reg2/inst_addr_reg[10]_3[0]dp1/reg2/inst_addr_reg[10]_32default:default2default:default2j
 "T
dp1/reg2/mem_reg[14][15]_i_1/Odp1/reg2/mem_reg[14][15]_i_1/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[14][15]_i_1	dp1/reg2/mem_reg[14][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2k
 "U
 dp1/reg2/inst_addr_reg[10]_40[0]dp1/reg2/inst_addr_reg[10]_402default:default2default:default2l
 "V
dp1/reg2/mem_reg[102][15]_i_1/Odp1/reg2/mem_reg[102][15]_i_1/O2default:default2default:default2h
 "R
dp1/reg2/mem_reg[102][15]_i_1	dp1/reg2/mem_reg[102][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2k
 "U
 dp1/reg2/inst_addr_reg[10]_41[0]dp1/reg2/inst_addr_reg[10]_412default:default2default:default2l
 "V
dp1/reg2/mem_reg[104][15]_i_1/Odp1/reg2/mem_reg[104][15]_i_1/O2default:default2default:default2h
 "R
dp1/reg2/mem_reg[104][15]_i_1	dp1/reg2/mem_reg[104][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2k
 "U
 dp1/reg2/inst_addr_reg[10]_42[0]dp1/reg2/inst_addr_reg[10]_422default:default2default:default2l
 "V
dp1/reg2/mem_reg[106][15]_i_1/Odp1/reg2/mem_reg[106][15]_i_1/O2default:default2default:default2h
 "R
dp1/reg2/mem_reg[106][15]_i_1	dp1/reg2/mem_reg[106][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2k
 "U
 dp1/reg2/inst_addr_reg[10]_43[0]dp1/reg2/inst_addr_reg[10]_432default:default2default:default2l
 "V
dp1/reg2/mem_reg[108][15]_i_1/Odp1/reg2/mem_reg[108][15]_i_1/O2default:default2default:default2h
 "R
dp1/reg2/mem_reg[108][15]_i_1	dp1/reg2/mem_reg[108][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2k
 "U
 dp1/reg2/inst_addr_reg[10]_44[0]dp1/reg2/inst_addr_reg[10]_442default:default2default:default2l
 "V
dp1/reg2/mem_reg[110][15]_i_1/Odp1/reg2/mem_reg[110][15]_i_1/O2default:default2default:default2h
 "R
dp1/reg2/mem_reg[110][15]_i_1	dp1/reg2/mem_reg[110][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2k
 "U
 dp1/reg2/inst_addr_reg[10]_45[0]dp1/reg2/inst_addr_reg[10]_452default:default2default:default2l
 "V
dp1/reg2/mem_reg[112][15]_i_1/Odp1/reg2/mem_reg[112][15]_i_1/O2default:default2default:default2h
 "R
dp1/reg2/mem_reg[112][15]_i_1	dp1/reg2/mem_reg[112][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2k
 "U
 dp1/reg2/inst_addr_reg[10]_46[0]dp1/reg2/inst_addr_reg[10]_462default:default2default:default2l
 "V
dp1/reg2/mem_reg[114][15]_i_1/Odp1/reg2/mem_reg[114][15]_i_1/O2default:default2default:default2h
 "R
dp1/reg2/mem_reg[114][15]_i_1	dp1/reg2/mem_reg[114][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2k
 "U
 dp1/reg2/inst_addr_reg[10]_47[0]dp1/reg2/inst_addr_reg[10]_472default:default2default:default2l
 "V
dp1/reg2/mem_reg[116][15]_i_1/Odp1/reg2/mem_reg[116][15]_i_1/O2default:default2default:default2h
 "R
dp1/reg2/mem_reg[116][15]_i_1	dp1/reg2/mem_reg[116][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2k
 "U
 dp1/reg2/inst_addr_reg[10]_48[0]dp1/reg2/inst_addr_reg[10]_482default:default2default:default2l
 "V
dp1/reg2/mem_reg[118][15]_i_1/Odp1/reg2/mem_reg[118][15]_i_1/O2default:default2default:default2h
 "R
dp1/reg2/mem_reg[118][15]_i_1	dp1/reg2/mem_reg[118][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2k
 "U
 dp1/reg2/inst_addr_reg[10]_49[0]dp1/reg2/inst_addr_reg[10]_492default:default2default:default2l
 "V
dp1/reg2/mem_reg[120][15]_i_1/Odp1/reg2/mem_reg[120][15]_i_1/O2default:default2default:default2h
 "R
dp1/reg2/mem_reg[120][15]_i_1	dp1/reg2/mem_reg[120][15]_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2 
DRC PDRC-1532default:default2
1002default:defaultZ17-14h px? 
?
?Non-Optimal connections which could lead to hold violations: A LUT %s is driving clock pin of 16 cells. This could lead to large hold time violations. Involved cells are:
%s%s*DRC2\
 "F
cs/fifo/buf_mem_reg_i_2	cs/fifo/buf_mem_reg_i_22default:default2default:default2?
 ">
uart_txs_cnt_reg[0]	uart_txs_cnt_reg[0]2default:default"@
uart_txs_cnt_reg[10]	uart_txs_cnt_reg[10]2default:default"@
uart_txs_cnt_reg[11]	uart_txs_cnt_reg[11]2default:default"@
uart_txs_cnt_reg[12]	uart_txs_cnt_reg[12]2default:default"@
uart_txs_cnt_reg[13]	uart_txs_cnt_reg[13]2default:default"@
uart_txs_cnt_reg[14]	uart_txs_cnt_reg[14]2default:default"@
uart_txs_cnt_reg[15]	uart_txs_cnt_reg[15]2default:default">
uart_txs_cnt_reg[1]	uart_txs_cnt_reg[1]2default:default">
uart_txs_cnt_reg[2]	uart_txs_cnt_reg[2]2default:default">
uart_txs_cnt_reg[3]	uart_txs_cnt_reg[3]2default:default">
uart_txs_cnt_reg[4]	uart_txs_cnt_reg[4]2default:default">
uart_txs_cnt_reg[5]	uart_txs_cnt_reg[5]2default:default">
uart_txs_cnt_reg[6]	uart_txs_cnt_reg[6]2default:default">
uart_txs_cnt_reg[7]	uart_txs_cnt_reg[7]2default:default":
uart_txs_cnt_reg[8]	uart_txs_cnt_reg[8]2default:..."/
(the first 15 of 16 listed)2default:default2default:default2A
 )DRC|Implementation|Placement|DesignChecks2default:default8ZPLHOLDVIO-2h px? 
h
DRC finished with %s
1905*	planAhead2*
0 Errors, 161 Warnings2default:defaultZ12-3199h px? 
i
BPlease refer to the DRC report (report_drc) for more information.
1906*	planAheadZ12-3200h px? 
i
)Running write_bitstream with %s threads.
1750*designutils2
22default:defaultZ20-2272h px? 
?
Loading data files...
1271*designutilsZ12-1165h px? 
>
Loading site data...
1273*designutilsZ12-1167h px? 
?
Loading route data...
1272*designutilsZ12-1166h px? 
?
Processing options...
1362*designutilsZ12-1514h px? 
<
Creating bitmap...
1249*designutilsZ12-1141h px? 
7
Creating bitstream...
7*	bitstreamZ40-7h px? 
f
Writing bitstream %s...
11*	bitstream2)
./term_interf_top.bit2default:defaultZ40-11h px? 
F
Bitgen Completed Successfully.
1606*	planAheadZ12-1842h px? 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1132default:default2
1052default:default2
12default:default2
02default:defaultZ4-41h px? 
a
%s completed successfully
29*	vivadotcl2#
write_bitstream2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2%
write_bitstream: 2default:default2
00:00:272default:default2
00:00:222default:default2
2217.6722default:default2
453.0862default:defaultZ17-268h px? 


End Record