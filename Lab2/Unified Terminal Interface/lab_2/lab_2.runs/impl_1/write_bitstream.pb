
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
VGA1/vga_controller/E[0]VGA1/vga_controller/E2default:default2default:default2~
 "h
(VGA1/vga_controller/address_reg[7]_i_2/O(VGA1/vga_controller/address_reg[7]_i_2/O2default:default2default:default2z
 "d
&VGA1/vga_controller/address_reg[7]_i_2	&VGA1/vga_controller/address_reg[7]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2x
 "b
%VGA1/vga_controller/hcounter_reg[2]_0%VGA1/vga_controller/hcounter_reg[2]_02default:default2default:default2z
 "d
&VGA1/vga_controller/VGA_R_reg[3]_i_2/O&VGA1/vga_controller/VGA_R_reg[3]_i_2/O2default:default2default:default2v
 "`
$VGA1/vga_controller/VGA_R_reg[3]_i_2	$VGA1/vga_controller/VGA_R_reg[3]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2{
 "e
(VGA1/vga_controller/hcounter_reg[8]_0[0]%VGA1/vga_controller/hcounter_reg[8]_02default:default2default:default2?
 "|
2VGA1/vga_controller/address_init_part_reg[7]_i_2/O2VGA1/vga_controller/address_init_part_reg[7]_i_2/O2default:default2default:default2?
 "x
0VGA1/vga_controller/address_init_part_reg[7]_i_2	0VGA1/vga_controller/address_init_part_reg[7]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2?
 "n
+dl/FSM_sequential_next_state_reg[3]_i_2_n_1+dl/FSM_sequential_next_state_reg[3]_i_2_n_12default:default2default:default2?
 "j
)dl/FSM_sequential_next_state_reg[3]_i_2/O)dl/FSM_sequential_next_state_reg[3]_i_2/O2default:default2default:default2|
 "f
'dl/FSM_sequential_next_state_reg[3]_i_2	'dl/FSM_sequential_next_state_reg[3]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2t
 "^
#dp1/fetch_0/stall_ns_reg[1]_i_1_n_1#dp1/fetch_0/stall_ns_reg[1]_i_1_n_12default:default2default:default2p
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
dp1/clk_sel_reg_i_1/Odp1/clk_sel_reg_i_1/O2default:default2default:default2T
 ">
dp1/clk_sel_reg_i_1	dp1/clk_sel_reg_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2\
 "F
dp1/reg1/dout_reg[60]_6dp1/reg1/dout_reg[60]_62default:default2default:default2d
 "N
dp1/reg1/cmp_flag_reg_i_1/Odp1/reg1/cmp_flag_reg_i_1/O2default:default2default:default2`
 "J
dp1/reg1/cmp_flag_reg_i_1	dp1/reg1/cmp_flag_reg_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2O
 "9
dp1/reg2/BTN[4][0]dp1/reg2/BTN[4]2default:default2default:default2j
 "T
dp1/reg2/mem_reg[47][15]_i_2/Odp1/reg2/mem_reg[47][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[47][15]_i_2	dp1/reg2/mem_reg[47][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2S
 "=
dp1/reg2/BTN[4]_0[0]dp1/reg2/BTN[4]_02default:default2default:default2j
 "T
dp1/reg2/mem_reg[30][15]_i_2/Odp1/reg2/mem_reg[30][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[30][15]_i_2	dp1/reg2/mem_reg[30][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2U
 "?
dp1/reg2/BTN[4]_10[0]dp1/reg2/BTN[4]_102default:default2default:default2j
 "T
dp1/reg2/mem_reg[36][15]_i_2/Odp1/reg2/mem_reg[36][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[36][15]_i_2	dp1/reg2/mem_reg[36][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2U
 "?
dp1/reg2/BTN[4]_11[0]dp1/reg2/BTN[4]_112default:default2default:default2j
 "T
dp1/reg2/mem_reg[33][15]_i_2/Odp1/reg2/mem_reg[33][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[33][15]_i_2	dp1/reg2/mem_reg[33][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2U
 "?
dp1/reg2/BTN[4]_12[0]dp1/reg2/BTN[4]_122default:default2default:default2j
 "T
dp1/reg2/mem_reg[83][15]_i_2/Odp1/reg2/mem_reg[83][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[83][15]_i_2	dp1/reg2/mem_reg[83][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2U
 "?
dp1/reg2/BTN[4]_13[0]dp1/reg2/BTN[4]_132default:default2default:default2l
 "V
dp1/reg2/mem_reg[108][15]_i_2/Odp1/reg2/mem_reg[108][15]_i_2/O2default:default2default:default2h
 "R
dp1/reg2/mem_reg[108][15]_i_2	dp1/reg2/mem_reg[108][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2U
 "?
dp1/reg2/BTN[4]_14[0]dp1/reg2/BTN[4]_142default:default2default:default2j
 "T
dp1/reg2/mem_reg[20][15]_i_2/Odp1/reg2/mem_reg[20][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[20][15]_i_2	dp1/reg2/mem_reg[20][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2U
 "?
dp1/reg2/BTN[4]_15[0]dp1/reg2/BTN[4]_152default:default2default:default2j
 "T
dp1/reg2/mem_reg[21][15]_i_2/Odp1/reg2/mem_reg[21][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[21][15]_i_2	dp1/reg2/mem_reg[21][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2U
 "?
dp1/reg2/BTN[4]_16[0]dp1/reg2/BTN[4]_162default:default2default:default2j
 "T
dp1/reg2/mem_reg[16][15]_i_2/Odp1/reg2/mem_reg[16][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[16][15]_i_2	dp1/reg2/mem_reg[16][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2U
 "?
dp1/reg2/BTN[4]_17[0]dp1/reg2/BTN[4]_172default:default2default:default2j
 "T
dp1/reg2/mem_reg[81][15]_i_2/Odp1/reg2/mem_reg[81][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[81][15]_i_2	dp1/reg2/mem_reg[81][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2U
 "?
dp1/reg2/BTN[4]_18[0]dp1/reg2/BTN[4]_182default:default2default:default2j
 "T
dp1/reg2/mem_reg[15][15]_i_2/Odp1/reg2/mem_reg[15][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[15][15]_i_2	dp1/reg2/mem_reg[15][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2U
 "?
dp1/reg2/BTN[4]_19[0]dp1/reg2/BTN[4]_192default:default2default:default2j
 "T
dp1/reg2/mem_reg[14][15]_i_2/Odp1/reg2/mem_reg[14][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[14][15]_i_2	dp1/reg2/mem_reg[14][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2S
 "=
dp1/reg2/BTN[4]_1[0]dp1/reg2/BTN[4]_12default:default2default:default2l
 "V
dp1/reg2/mem_reg[118][15]_i_2/Odp1/reg2/mem_reg[118][15]_i_2/O2default:default2default:default2h
 "R
dp1/reg2/mem_reg[118][15]_i_2	dp1/reg2/mem_reg[118][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2U
 "?
dp1/reg2/BTN[4]_20[0]dp1/reg2/BTN[4]_202default:default2default:default2j
 "T
dp1/reg2/mem_reg[13][15]_i_2/Odp1/reg2/mem_reg[13][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[13][15]_i_2	dp1/reg2/mem_reg[13][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2U
 "?
dp1/reg2/BTN[4]_21[0]dp1/reg2/BTN[4]_212default:default2default:default2j
 "T
dp1/reg2/mem_reg[80][15]_i_2/Odp1/reg2/mem_reg[80][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[80][15]_i_2	dp1/reg2/mem_reg[80][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2U
 "?
dp1/reg2/BTN[4]_22[0]dp1/reg2/BTN[4]_222default:default2default:default2l
 "V
dp1/reg2/mem_reg[110][15]_i_2/Odp1/reg2/mem_reg[110][15]_i_2/O2default:default2default:default2h
 "R
dp1/reg2/mem_reg[110][15]_i_2	dp1/reg2/mem_reg[110][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2U
 "?
dp1/reg2/BTN[4]_23[0]dp1/reg2/BTN[4]_232default:default2default:default2j
 "T
dp1/reg2/mem_reg[65][15]_i_2/Odp1/reg2/mem_reg[65][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[65][15]_i_2	dp1/reg2/mem_reg[65][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2U
 "?
dp1/reg2/BTN[4]_24[0]dp1/reg2/BTN[4]_242default:default2default:default2j
 "T
dp1/reg2/mem_reg[57][15]_i_2/Odp1/reg2/mem_reg[57][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[57][15]_i_2	dp1/reg2/mem_reg[57][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2U
 "?
dp1/reg2/BTN[4]_25[0]dp1/reg2/BTN[4]_252default:default2default:default2l
 "V
dp1/reg2/mem_reg[112][15]_i_2/Odp1/reg2/mem_reg[112][15]_i_2/O2default:default2default:default2h
 "R
dp1/reg2/mem_reg[112][15]_i_2	dp1/reg2/mem_reg[112][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2U
 "?
dp1/reg2/BTN[4]_26[0]dp1/reg2/BTN[4]_262default:default2default:default2j
 "T
dp1/reg2/mem_reg[55][15]_i_2/Odp1/reg2/mem_reg[55][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[55][15]_i_2	dp1/reg2/mem_reg[55][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2U
 "?
dp1/reg2/BTN[4]_27[0]dp1/reg2/BTN[4]_272default:default2default:default2j
 "T
dp1/reg2/mem_reg[28][15]_i_2/Odp1/reg2/mem_reg[28][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[28][15]_i_2	dp1/reg2/mem_reg[28][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2U
 "?
dp1/reg2/BTN[4]_28[0]dp1/reg2/BTN[4]_282default:default2default:default2l
 "V
dp1/reg2/mem_reg[123][15]_i_2/Odp1/reg2/mem_reg[123][15]_i_2/O2default:default2default:default2h
 "R
dp1/reg2/mem_reg[123][15]_i_2	dp1/reg2/mem_reg[123][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2U
 "?
dp1/reg2/BTN[4]_29[0]dp1/reg2/BTN[4]_292default:default2default:default2j
 "T
dp1/reg2/mem_reg[29][15]_i_2/Odp1/reg2/mem_reg[29][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[29][15]_i_2	dp1/reg2/mem_reg[29][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2S
 "=
dp1/reg2/BTN[4]_2[0]dp1/reg2/BTN[4]_22default:default2default:default2l
 "V
dp1/reg2/mem_reg[126][15]_i_2/Odp1/reg2/mem_reg[126][15]_i_2/O2default:default2default:default2h
 "R
dp1/reg2/mem_reg[126][15]_i_2	dp1/reg2/mem_reg[126][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2U
 "?
dp1/reg2/BTN[4]_30[0]dp1/reg2/BTN[4]_302default:default2default:default2j
 "T
dp1/reg2/mem_reg[52][15]_i_2/Odp1/reg2/mem_reg[52][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[52][15]_i_2	dp1/reg2/mem_reg[52][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2U
 "?
dp1/reg2/BTN[4]_31[0]dp1/reg2/BTN[4]_312default:default2default:default2l
 "V
dp1/reg2/mem_reg[127][15]_i_2/Odp1/reg2/mem_reg[127][15]_i_2/O2default:default2default:default2h
 "R
dp1/reg2/mem_reg[127][15]_i_2	dp1/reg2/mem_reg[127][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2U
 "?
dp1/reg2/BTN[4]_32[0]dp1/reg2/BTN[4]_322default:default2default:default2j
 "T
dp1/reg2/mem_reg[48][15]_i_2/Odp1/reg2/mem_reg[48][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[48][15]_i_2	dp1/reg2/mem_reg[48][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2U
 "?
dp1/reg2/BTN[4]_33[0]dp1/reg2/BTN[4]_332default:default2default:default2l
 "V
dp1/reg2/mem_reg[128][15]_i_2/Odp1/reg2/mem_reg[128][15]_i_2/O2default:default2default:default2h
 "R
dp1/reg2/mem_reg[128][15]_i_2	dp1/reg2/mem_reg[128][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2U
 "?
dp1/reg2/BTN[4]_34[0]dp1/reg2/BTN[4]_342default:default2default:default2j
 "T
dp1/reg2/mem_reg[32][15]_i_2/Odp1/reg2/mem_reg[32][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[32][15]_i_2	dp1/reg2/mem_reg[32][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2U
 "?
dp1/reg2/BTN[4]_35[0]dp1/reg2/BTN[4]_352default:default2default:default2j
 "T
dp1/reg2/mem_reg[42][15]_i_2/Odp1/reg2/mem_reg[42][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[42][15]_i_2	dp1/reg2/mem_reg[42][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2U
 "?
dp1/reg2/BTN[4]_36[0]dp1/reg2/BTN[4]_362default:default2default:default2j
 "T
dp1/reg2/mem_reg[34][15]_i_2/Odp1/reg2/mem_reg[34][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[34][15]_i_2	dp1/reg2/mem_reg[34][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2U
 "?
dp1/reg2/BTN[4]_37[0]dp1/reg2/BTN[4]_372default:default2default:default2j
 "T
dp1/reg2/mem_reg[18][15]_i_2/Odp1/reg2/mem_reg[18][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[18][15]_i_2	dp1/reg2/mem_reg[18][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2U
 "?
dp1/reg2/BTN[4]_38[0]dp1/reg2/BTN[4]_382default:default2default:default2j
 "T
dp1/reg2/mem_reg[17][15]_i_2/Odp1/reg2/mem_reg[17][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[17][15]_i_2	dp1/reg2/mem_reg[17][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2U
 "?
dp1/reg2/BTN[4]_39[0]dp1/reg2/BTN[4]_392default:default2default:default2j
 "T
dp1/reg2/mem_reg[22][15]_i_2/Odp1/reg2/mem_reg[22][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[22][15]_i_2	dp1/reg2/mem_reg[22][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2S
 "=
dp1/reg2/BTN[4]_3[0]dp1/reg2/BTN[4]_32default:default2default:default2l
 "V
dp1/reg2/mem_reg[122][15]_i_2/Odp1/reg2/mem_reg[122][15]_i_2/O2default:default2default:default2h
 "R
dp1/reg2/mem_reg[122][15]_i_2	dp1/reg2/mem_reg[122][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2U
 "?
dp1/reg2/BTN[4]_40[0]dp1/reg2/BTN[4]_402default:default2default:default2j
 "T
dp1/reg2/mem_reg[23][15]_i_2/Odp1/reg2/mem_reg[23][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[23][15]_i_2	dp1/reg2/mem_reg[23][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2U
 "?
dp1/reg2/BTN[4]_41[0]dp1/reg2/BTN[4]_412default:default2default:default2j
 "T
dp1/reg2/mem_reg[12][15]_i_2/Odp1/reg2/mem_reg[12][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[12][15]_i_2	dp1/reg2/mem_reg[12][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2U
 "?
dp1/reg2/BTN[4]_42[0]dp1/reg2/BTN[4]_422default:default2default:default2j
 "T
dp1/reg2/mem_reg[11][15]_i_2/Odp1/reg2/mem_reg[11][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[11][15]_i_2	dp1/reg2/mem_reg[11][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2U
 "?
dp1/reg2/BTN[4]_43[0]dp1/reg2/BTN[4]_432default:default2default:default2j
 "T
dp1/reg2/mem_reg[10][15]_i_2/Odp1/reg2/mem_reg[10][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[10][15]_i_2	dp1/reg2/mem_reg[10][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2U
 "?
dp1/reg2/BTN[4]_44[0]dp1/reg2/BTN[4]_442default:default2default:default2h
 "R
dp1/reg2/mem_reg[9][15]_i_2/Odp1/reg2/mem_reg[9][15]_i_2/O2default:default2default:default2d
 "N
dp1/reg2/mem_reg[9][15]_i_2	dp1/reg2/mem_reg[9][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2U
 "?
dp1/reg2/BTN[4]_45[0]dp1/reg2/BTN[4]_452default:default2default:default2h
 "R
dp1/reg2/mem_reg[8][15]_i_2/Odp1/reg2/mem_reg[8][15]_i_2/O2default:default2default:default2d
 "N
dp1/reg2/mem_reg[8][15]_i_2	dp1/reg2/mem_reg[8][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2U
 "?
dp1/reg2/BTN[4]_46[0]dp1/reg2/BTN[4]_462default:default2default:default2h
 "R
dp1/reg2/mem_reg[7][15]_i_2/Odp1/reg2/mem_reg[7][15]_i_2/O2default:default2default:default2d
 "N
dp1/reg2/mem_reg[7][15]_i_2	dp1/reg2/mem_reg[7][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2U
 "?
dp1/reg2/BTN[4]_47[0]dp1/reg2/BTN[4]_472default:default2default:default2h
 "R
dp1/reg2/mem_reg[6][15]_i_2/Odp1/reg2/mem_reg[6][15]_i_2/O2default:default2default:default2d
 "N
dp1/reg2/mem_reg[6][15]_i_2	dp1/reg2/mem_reg[6][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2U
 "?
dp1/reg2/BTN[4]_48[0]dp1/reg2/BTN[4]_482default:default2default:default2h
 "R
dp1/reg2/mem_reg[5][15]_i_2/Odp1/reg2/mem_reg[5][15]_i_2/O2default:default2default:default2d
 "N
dp1/reg2/mem_reg[5][15]_i_2	dp1/reg2/mem_reg[5][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2U
 "?
dp1/reg2/BTN[4]_49[0]dp1/reg2/BTN[4]_492default:default2default:default2h
 "R
dp1/reg2/mem_reg[4][15]_i_2/Odp1/reg2/mem_reg[4][15]_i_2/O2default:default2default:default2d
 "N
dp1/reg2/mem_reg[4][15]_i_2	dp1/reg2/mem_reg[4][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2S
 "=
dp1/reg2/BTN[4]_4[0]dp1/reg2/BTN[4]_42default:default2default:default2l
 "V
dp1/reg2/mem_reg[116][15]_i_2/Odp1/reg2/mem_reg[116][15]_i_2/O2default:default2default:default2h
 "R
dp1/reg2/mem_reg[116][15]_i_2	dp1/reg2/mem_reg[116][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2U
 "?
dp1/reg2/BTN[4]_50[0]dp1/reg2/BTN[4]_502default:default2default:default2h
 "R
dp1/reg2/mem_reg[3][15]_i_2/Odp1/reg2/mem_reg[3][15]_i_2/O2default:default2default:default2d
 "N
dp1/reg2/mem_reg[3][15]_i_2	dp1/reg2/mem_reg[3][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2U
 "?
dp1/reg2/BTN[4]_51[0]dp1/reg2/BTN[4]_512default:default2default:default2h
 "R
dp1/reg2/mem_reg[2][15]_i_2/Odp1/reg2/mem_reg[2][15]_i_2/O2default:default2default:default2d
 "N
dp1/reg2/mem_reg[2][15]_i_2	dp1/reg2/mem_reg[2][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2U
 "?
dp1/reg2/BTN[4]_52[0]dp1/reg2/BTN[4]_522default:default2default:default2h
 "R
dp1/reg2/mem_reg[1][15]_i_2/Odp1/reg2/mem_reg[1][15]_i_2/O2default:default2default:default2d
 "N
dp1/reg2/mem_reg[1][15]_i_2	dp1/reg2/mem_reg[1][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2U
 "?
dp1/reg2/BTN[4]_53[0]dp1/reg2/BTN[4]_532default:default2default:default2h
 "R
dp1/reg2/mem_reg[0][15]_i_2/Odp1/reg2/mem_reg[0][15]_i_2/O2default:default2default:default2d
 "N
dp1/reg2/mem_reg[0][15]_i_2	dp1/reg2/mem_reg[0][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2S
 "=
dp1/reg2/BTN[4]_5[0]dp1/reg2/BTN[4]_52default:default2default:default2l
 "V
dp1/reg2/mem_reg[120][15]_i_2/Odp1/reg2/mem_reg[120][15]_i_2/O2default:default2default:default2h
 "R
dp1/reg2/mem_reg[120][15]_i_2	dp1/reg2/mem_reg[120][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2S
 "=
dp1/reg2/BTN[4]_6[0]dp1/reg2/BTN[4]_62default:default2default:default2l
 "V
dp1/reg2/mem_reg[124][15]_i_2/Odp1/reg2/mem_reg[124][15]_i_2/O2default:default2default:default2h
 "R
dp1/reg2/mem_reg[124][15]_i_2	dp1/reg2/mem_reg[124][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2S
 "=
dp1/reg2/BTN[4]_7[0]dp1/reg2/BTN[4]_72default:default2default:default2l
 "V
dp1/reg2/mem_reg[121][15]_i_2/Odp1/reg2/mem_reg[121][15]_i_2/O2default:default2default:default2h
 "R
dp1/reg2/mem_reg[121][15]_i_2	dp1/reg2/mem_reg[121][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2S
 "=
dp1/reg2/BTN[4]_8[0]dp1/reg2/BTN[4]_82default:default2default:default2l
 "V
dp1/reg2/mem_reg[125][15]_i_2/Odp1/reg2/mem_reg[125][15]_i_2/O2default:default2default:default2h
 "R
dp1/reg2/mem_reg[125][15]_i_2	dp1/reg2/mem_reg[125][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2S
 "=
dp1/reg2/BTN[4]_9[0]dp1/reg2/BTN[4]_92default:default2default:default2l
 "V
dp1/reg2/mem_reg[117][15]_i_2/Odp1/reg2/mem_reg[117][15]_i_2/O2default:default2default:default2h
 "R
dp1/reg2/mem_reg[117][15]_i_2	dp1/reg2/mem_reg[117][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2E
 "/
dp1/reg2/E[0]
dp1/reg2/E2default:default2default:default2j
 "T
dp1/reg2/mem_reg[77][15]_i_2/Odp1/reg2/mem_reg[77][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[77][15]_i_2	dp1/reg2/mem_reg[77][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2a
 "K
dp1/reg2/ap_start_cs_reg[0]dp1/reg2/ap_start_cs_reg2default:default2default:default2j
 "T
dp1/reg2/mem_reg[64][15]_i_2/Odp1/reg2/mem_reg[64][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[64][15]_i_2	dp1/reg2/mem_reg[64][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2e
 "O
dp1/reg2/ap_start_cs_reg_0[0]dp1/reg2/ap_start_cs_reg_02default:default2default:default2l
 "V
dp1/reg2/mem_reg[113][15]_i_2/Odp1/reg2/mem_reg[113][15]_i_2/O2default:default2default:default2h
 "R
dp1/reg2/mem_reg[113][15]_i_2	dp1/reg2/mem_reg[113][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2e
 "O
dp1/reg2/ap_start_cs_reg_1[0]dp1/reg2/ap_start_cs_reg_12default:default2default:default2j
 "T
dp1/reg2/mem_reg[73][15]_i_2/Odp1/reg2/mem_reg[73][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[73][15]_i_2	dp1/reg2/mem_reg[73][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2e
 "O
dp1/reg2/ap_start_cs_reg_2[0]dp1/reg2/ap_start_cs_reg_22default:default2default:default2l
 "V
dp1/reg2/mem_reg[114][15]_i_2/Odp1/reg2/mem_reg[114][15]_i_2/O2default:default2default:default2h
 "R
dp1/reg2/mem_reg[114][15]_i_2	dp1/reg2/mem_reg[114][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2e
 "O
dp1/reg2/ap_start_cs_reg_3[0]dp1/reg2/ap_start_cs_reg_32default:default2default:default2l
 "V
dp1/reg2/mem_reg[107][15]_i_2/Odp1/reg2/mem_reg[107][15]_i_2/O2default:default2default:default2h
 "R
dp1/reg2/mem_reg[107][15]_i_2	dp1/reg2/mem_reg[107][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2a
 "K
dp1/reg2/dout_reg[17]_10[0]dp1/reg2/dout_reg[17]_102default:default2default:default2j
 "T
dp1/reg2/mem_reg[40][15]_i_2/Odp1/reg2/mem_reg[40][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[40][15]_i_2	dp1/reg2/mem_reg[40][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2a
 "K
dp1/reg2/dout_reg[17]_11[0]dp1/reg2/dout_reg[17]_112default:default2default:default2j
 "T
dp1/reg2/mem_reg[84][15]_i_2/Odp1/reg2/mem_reg[84][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[84][15]_i_2	dp1/reg2/mem_reg[84][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2a
 "K
dp1/reg2/dout_reg[17]_12[0]dp1/reg2/dout_reg[17]_122default:default2default:default2l
 "V
dp1/reg2/mem_reg[102][15]_i_2/Odp1/reg2/mem_reg[102][15]_i_2/O2default:default2default:default2h
 "R
dp1/reg2/mem_reg[102][15]_i_2	dp1/reg2/mem_reg[102][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2a
 "K
dp1/reg2/dout_reg[17]_13[0]dp1/reg2/dout_reg[17]_132default:default2default:default2j
 "T
dp1/reg2/mem_reg[98][15]_i_2/Odp1/reg2/mem_reg[98][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[98][15]_i_2	dp1/reg2/mem_reg[98][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2a
 "K
dp1/reg2/dout_reg[17]_14[0]dp1/reg2/dout_reg[17]_142default:default2default:default2l
 "V
dp1/reg2/mem_reg[106][15]_i_2/Odp1/reg2/mem_reg[106][15]_i_2/O2default:default2default:default2h
 "R
dp1/reg2/mem_reg[106][15]_i_2	dp1/reg2/mem_reg[106][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2a
 "K
dp1/reg2/dout_reg[17]_15[0]dp1/reg2/dout_reg[17]_152default:default2default:default2j
 "T
dp1/reg2/mem_reg[75][15]_i_2/Odp1/reg2/mem_reg[75][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[75][15]_i_2	dp1/reg2/mem_reg[75][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2_
 "I
dp1/reg2/dout_reg[17]_3[0]dp1/reg2/dout_reg[17]_32default:default2default:default2j
 "T
dp1/reg2/mem_reg[62][15]_i_2/Odp1/reg2/mem_reg[62][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[62][15]_i_2	dp1/reg2/mem_reg[62][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2_
 "I
dp1/reg2/dout_reg[17]_4[0]dp1/reg2/dout_reg[17]_42default:default2default:default2j
 "T
dp1/reg2/mem_reg[88][15]_i_2/Odp1/reg2/mem_reg[88][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[88][15]_i_2	dp1/reg2/mem_reg[88][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2_
 "I
dp1/reg2/dout_reg[17]_5[0]dp1/reg2/dout_reg[17]_52default:default2default:default2j
 "T
dp1/reg2/mem_reg[31][15]_i_2/Odp1/reg2/mem_reg[31][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[31][15]_i_2	dp1/reg2/mem_reg[31][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2_
 "I
dp1/reg2/dout_reg[17]_6[0]dp1/reg2/dout_reg[17]_62default:default2default:default2l
 "V
dp1/reg2/mem_reg[104][15]_i_2/Odp1/reg2/mem_reg[104][15]_i_2/O2default:default2default:default2h
 "R
dp1/reg2/mem_reg[104][15]_i_2	dp1/reg2/mem_reg[104][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2_
 "I
dp1/reg2/dout_reg[17]_7[0]dp1/reg2/dout_reg[17]_72default:default2default:default2j
 "T
dp1/reg2/mem_reg[96][15]_i_2/Odp1/reg2/mem_reg[96][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[96][15]_i_2	dp1/reg2/mem_reg[96][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2_
 "I
dp1/reg2/dout_reg[17]_8[0]dp1/reg2/dout_reg[17]_82default:default2default:default2j
 "T
dp1/reg2/mem_reg[46][15]_i_2/Odp1/reg2/mem_reg[46][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[46][15]_i_2	dp1/reg2/mem_reg[46][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2_
 "I
dp1/reg2/dout_reg[17]_9[0]dp1/reg2/dout_reg[17]_92default:default2default:default2j
 "T
dp1/reg2/mem_reg[44][15]_i_2/Odp1/reg2/mem_reg[44][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[44][15]_i_2	dp1/reg2/mem_reg[44][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2a
 "K
dp1/reg2/dout_reg[18]_26[0]dp1/reg2/dout_reg[18]_262default:default2default:default2j
 "T
dp1/reg2/mem_reg[63][15]_i_2/Odp1/reg2/mem_reg[63][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[63][15]_i_2	dp1/reg2/mem_reg[63][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2a
 "K
dp1/reg2/dout_reg[18]_27[0]dp1/reg2/dout_reg[18]_272default:default2default:default2j
 "T
dp1/reg2/mem_reg[79][15]_i_2/Odp1/reg2/mem_reg[79][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[79][15]_i_2	dp1/reg2/mem_reg[79][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2a
 "K
dp1/reg2/dout_reg[18]_28[0]dp1/reg2/dout_reg[18]_282default:default2default:default2j
 "T
dp1/reg2/mem_reg[72][15]_i_2/Odp1/reg2/mem_reg[72][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[72][15]_i_2	dp1/reg2/mem_reg[72][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2a
 "K
dp1/reg2/dout_reg[19]_33[0]dp1/reg2/dout_reg[19]_332default:default2default:default2j
 "T
dp1/reg2/mem_reg[45][15]_i_2/Odp1/reg2/mem_reg[45][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[45][15]_i_2	dp1/reg2/mem_reg[45][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2a
 "K
dp1/reg2/dout_reg[19]_34[0]dp1/reg2/dout_reg[19]_342default:default2default:default2j
 "T
dp1/reg2/mem_reg[41][15]_i_2/Odp1/reg2/mem_reg[41][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[41][15]_i_2	dp1/reg2/mem_reg[41][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2a
 "K
dp1/reg2/dout_reg[19]_35[0]dp1/reg2/dout_reg[19]_352default:default2default:default2j
 "T
dp1/reg2/mem_reg[38][15]_i_2/Odp1/reg2/mem_reg[38][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[38][15]_i_2	dp1/reg2/mem_reg[38][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2a
 "K
dp1/reg2/dout_reg[19]_37[0]dp1/reg2/dout_reg[19]_372default:default2default:default2j
 "T
dp1/reg2/mem_reg[60][15]_i_2/Odp1/reg2/mem_reg[60][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[60][15]_i_2	dp1/reg2/mem_reg[60][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2a
 "K
dp1/reg2/dout_reg[20]_31[0]dp1/reg2/dout_reg[20]_312default:default2default:default2l
 "V
dp1/reg2/mem_reg[103][15]_i_2/Odp1/reg2/mem_reg[103][15]_i_2/O2default:default2default:default2h
 "R
dp1/reg2/mem_reg[103][15]_i_2	dp1/reg2/mem_reg[103][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2a
 "K
dp1/reg2/dout_reg[20]_32[0]dp1/reg2/dout_reg[20]_322default:default2default:default2l
 "V
dp1/reg2/mem_reg[111][15]_i_2/Odp1/reg2/mem_reg[111][15]_i_2/O2default:default2default:default2h
 "R
dp1/reg2/mem_reg[111][15]_i_2	dp1/reg2/mem_reg[111][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2a
 "K
dp1/reg2/dout_reg[20]_33[0]dp1/reg2/dout_reg[20]_332default:default2default:default2l
 "V
dp1/reg2/mem_reg[115][15]_i_2/Odp1/reg2/mem_reg[115][15]_i_2/O2default:default2default:default2h
 "R
dp1/reg2/mem_reg[115][15]_i_2	dp1/reg2/mem_reg[115][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2a
 "K
dp1/reg2/dout_reg[22]_19[0]dp1/reg2/dout_reg[22]_192default:default2default:default2j
 "T
dp1/reg2/mem_reg[25][15]_i_2/Odp1/reg2/mem_reg[25][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[25][15]_i_2	dp1/reg2/mem_reg[25][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2a
 "K
dp1/reg2/dout_reg[22]_20[0]dp1/reg2/dout_reg[22]_202default:default2default:default2j
 "T
dp1/reg2/mem_reg[56][15]_i_2/Odp1/reg2/mem_reg[56][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[56][15]_i_2	dp1/reg2/mem_reg[56][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2a
 "K
dp1/reg2/dout_reg[22]_21[0]dp1/reg2/dout_reg[22]_212default:default2default:default2j
 "T
dp1/reg2/mem_reg[91][15]_i_2/Odp1/reg2/mem_reg[91][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[91][15]_i_2	dp1/reg2/mem_reg[91][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2a
 "K
dp1/reg2/dout_reg[22]_22[0]dp1/reg2/dout_reg[22]_222default:default2default:default2j
 "T
dp1/reg2/mem_reg[24][15]_i_2/Odp1/reg2/mem_reg[24][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[24][15]_i_2	dp1/reg2/mem_reg[24][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2a
 "K
dp1/reg2/dout_reg[22]_23[0]dp1/reg2/dout_reg[22]_232default:default2default:default2j
 "T
dp1/reg2/mem_reg[92][15]_i_2/Odp1/reg2/mem_reg[92][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[92][15]_i_2	dp1/reg2/mem_reg[92][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2a
 "K
dp1/reg2/dout_reg[22]_24[0]dp1/reg2/dout_reg[22]_242default:default2default:default2j
 "T
dp1/reg2/mem_reg[71][15]_i_2/Odp1/reg2/mem_reg[71][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[71][15]_i_2	dp1/reg2/mem_reg[71][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2a
 "K
dp1/reg2/dout_reg[22]_25[0]dp1/reg2/dout_reg[22]_252default:default2default:default2j
 "T
dp1/reg2/mem_reg[69][15]_i_2/Odp1/reg2/mem_reg[69][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[69][15]_i_2	dp1/reg2/mem_reg[69][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2a
 "K
dp1/reg2/dout_reg[22]_26[0]dp1/reg2/dout_reg[22]_262default:default2default:default2j
 "T
dp1/reg2/mem_reg[68][15]_i_2/Odp1/reg2/mem_reg[68][15]_i_2/O2default:default2default:default2f
 "P
dp1/reg2/mem_reg[68][15]_i_2	dp1/reg2/mem_reg[68][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2a
 "K
dp1/reg2/dout_reg[22]_27[0]dp1/reg2/dout_reg[22]_272default:default2default:default2l
 "V
dp1/reg2/mem_reg[100][15]_i_2/Odp1/reg2/mem_reg[100][15]_i_2/O2default:default2default:default2h
 "R
dp1/reg2/mem_reg[100][15]_i_2	dp1/reg2/mem_reg[100][15]_i_22default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px? 
?
?Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2 
DRC PDRC-1532default:default2
1002default:defaultZ17-14h px? 
h
DRC finished with %s
1905*	planAhead2*
0 Errors, 140 Warnings2default:defaultZ12-3199h px? 
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
1062default:default2
1022default:default2
02default:default2
02default:defaultZ4-41h px? 
a
%s completed successfully
29*	vivadotcl2#
write_bitstream2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2%
write_bitstream: 2default:default2
00:00:292default:default2
00:00:212default:default2
2357.3832default:default2
487.8482default:defaultZ17-268h px? 


End Record