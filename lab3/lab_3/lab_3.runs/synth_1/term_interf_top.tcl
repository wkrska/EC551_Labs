# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param chipscope.maxJobs 3
set_param xicom.use_bs_reader 1
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir X:/Documents/EC551/EC551_Labs/lab3/lab_3/lab_3.cache/wt [current_project]
set_property parent.project_path X:/Documents/EC551/EC551_Labs/lab3/lab_3/lab_3.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo x:/Documents/EC551/EC551_Labs/lab3/lab_3/lab_3.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog X:/Documents/EC551/EC551_Labs/lab3/Sources/Design/my_header.vh
read_verilog -library xil_defaultlib {
  X:/Documents/EC551/EC551_Labs/lab3/Sources/Design/PS2Receiver.v
  X:/Documents/EC551/EC551_Labs/lab3/Sources/Design/UART_RX_CTRL.v
  X:/Documents/EC551/EC551_Labs/lab3/Sources/Design/UART_controller.v
  X:/Documents/EC551/EC551_Labs/lab3/Sources/Design/btn_edge.v
  X:/Documents/EC551/EC551_Labs/lab3/Sources/Design/char_stager.v
  X:/Documents/EC551/EC551_Labs/lab3/Sources/Design/data_loader.v
  X:/Documents/EC551/EC551_Labs/lab3/Sources/Design/debounce.v
  X:/Documents/EC551/EC551_Labs/lab3/Sources/Design/fifo_8bit.v
  X:/Documents/EC551/EC551_Labs/lab3/Sources/Design/hex_to_ascii.v
  X:/Documents/EC551/EC551_Labs/lab3/Sources/Design/keyboard_debouncer.v
  X:/Documents/EC551/EC551_Labs/lab3/Sources/Design/mat3mult.v
  X:/Documents/EC551/EC551_Labs/lab3/Sources/Design/mini_ALU.v
  X:/Documents/EC551/EC551_Labs/lab3/Sources/Design/ps2_to_ascii.v
  X:/Documents/EC551/EC551_Labs/lab3/Sources/Design/sev_seg_driver.v
  X:/Documents/EC551/EC551_Labs/lab3/Sources/Design/top_keyboard.v
  X:/Documents/EC551/EC551_Labs/lab3/Sources/Design/uart_arbiter.v
  X:/Documents/EC551/EC551_Labs/lab3/Sources/Design/vect3mac.v
  X:/Documents/EC551/EC551_Labs/lab3/Sources/Design/term_interf_top.v
}
read_vhdl -library xil_defaultlib X:/Documents/EC551/EC551_Labs/lab3/Sources/Design/UART_TX_CTRL.vhd
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc X:/Documents/EC551/EC551_Labs/lab3/Sources/Constraints/Nexys-A7-100T-Master.xdc
set_property used_in_implementation false [get_files X:/Documents/EC551/EC551_Labs/lab3/Sources/Constraints/Nexys-A7-100T-Master.xdc]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top term_interf_top -part xc7a100tcsg324-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef term_interf_top.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file term_interf_top_utilization_synth.rpt -pb term_interf_top_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]