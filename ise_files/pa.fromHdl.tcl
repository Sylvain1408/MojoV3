
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name Mojo-Base-VHDL -dir "C:/Users/Sylvain/Desktop/Mojo-Base-VHDL/ise_files/planAhead_run_3" -part xc6slx9tqg144-2
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "C:/Users/Sylvain/Desktop/Mojo-Base-VHDL/src/mojo.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {ipcore_dir/microblaze_mcs.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {ipcore_dir/ram.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../src/spi_slave.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../src/serial_tx.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../src/serial_rx.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../src/cclk_detector.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {i2c_ram_interface.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../i2c_master.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../src/avr_interface.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {ram_interface.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {i2c.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../src/mojo_top.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top mojo_top $srcset
add_files [list {C:/Users/Sylvain/Desktop/Mojo-Base-VHDL/src/mojo.ucf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/microblaze_mcs.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/ram.ncf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx9tqg144-2
