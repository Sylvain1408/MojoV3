# (c) Copyright 2011 - 2012 Xilinx, Inc. All rights reserved.
# 
# This file contains confidential and proprietary information
# of Xilinx, Inc. and is protected under U.S. and
# international copyright and other intellectual property
# laws.
# 
# DISCLAIMER
# This disclaimer is not a license and does not grant any
# rights to the materials distributed herewith. Except as
# otherwise provided in a valid license issued to you by
# Xilinx, and to the maximum extent permitted by applicable
# law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
# WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
# AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
# BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
# INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
# (2) Xilinx shall not be liable (whether in contract or tort,
# including negligence, or under any other theory of
# liability) for any loss or damage of any kind or nature
# related to, arising under or in connection with these
# materials, including for any direct, or any indirect,
# special, incidental, or consequential loss or damage
# (including loss of data, profits, goodwill, or any type of
# loss or damage suffered as a result of any action brought
# by a third party) even if such damage or loss was
# reasonably foreseeable or Xilinx had been advised of the
# possibility of the same.
# 
# CRITICAL APPLICATIONS
# Xilinx products are not designed or intended to be fail-
# safe, or for use in any application requiring fail-safe
# performance, such as life-support or safety devices or
# systems, Class III medical devices, nuclear facilities,
# applications related to the deployment of airbags, or any
# other applications that could lead to death, personal
# injury, or severe property or environmental damage
# (individually and collectively, "Critical
# Applications"). Customer assumes the sole risk and
# liability of any use of Xilinx products in Critical
# Applications, subject only to applicable laws and
# regulations governing limitations on product liability.
# 
# THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
# PART OF THIS FILE AT ALL TIMES.


vlib work
vlib work
vlog -work work ../cdn_axi3_example_master_v_vhd_tb.v ../cdn_axi3_example_slave_v_vhd_tb.v +incdir+./
vcom -work work ../cdn_axi3_example_package.vhd ../cdn_axi3_example_test1.vhd
vsim  -c -L secureip -pli libxil_riviera.dll -l aldec_axi3_ex1.log work.cdn_axi3_example_tb 
run -all
vcom -work work ../cdn_axi3_example_package.vhd ../cdn_axi3_example_test2.vhd
vsim  -c -L secureip -pli libxil_riviera.dll -l aldec_axi3_ex2.log work.cdn_axi3_example_tb 
run -all
vcom -work work ../cdn_axi3_example_package.vhd ../cdn_axi3_example_test3.vhd
vsim  -c -L secureip -pli libxil_riviera.dll -l aldec_axi3_ex3.log work.cdn_axi3_example_tb 
run -all
vcom -work work ../cdn_axi3_example_package.vhd ../cdn_axi3_example_test4.vhd
vsim  -c -L secureip -pli libxil_riviera.dll -l aldec_axi3_ex4.log work.cdn_axi3_example_tb 
run -all
vcom -work work ../cdn_axi3_example_package.vhd ../cdn_axi3_example_test5.vhd
vsim  -c -L secureip -pli libxil_riviera.dll -l aldec_axi3_axi5.log work.cdn_axi3_example_tb 
run -all
vcom -work work ../cdn_axi3_example_package.vhd ../cdn_axi3_example_test6.vhd
vsim  -c -L secureip -pli libxil_riviera.dll -l aldec_axi3_axi6.log work.cdn_axi3_example_tb 
run -all
vcom -work work ../cdn_axi3_example_package.vhd ../cdn_axi3_example_test7.vhd
vsim  -c -L secureip -pli libxil_riviera.dll -l aldec_axi3_ex7log work.cdn_axi3_example_tb 
run -all
vcom -work work ../cdn_axi3_example_package.vhd ../cdn_axi3_example_test8.vhd
vsim  -c -L secureip -pli libxil_riviera.dll -l aldec_axi3_ex8.log work.cdn_axi3_example_tb 
run -all
vcom -work work ../cdn_axi3_example_package.vhd ../cdn_axi3_example_test9.vhd
vsim  -c -L secureip -pli libxil_riviera.dll -l aldec_axi3_ex9.log work.cdn_axi3_example_tb 
run -all
vcom -work work ../cdn_axi3_example_package.vhd ../cdn_axi3_example_test10.vhd
vsim  -c -L secureip -pli libxil_riviera.dll -l aldec_axi3_ex10.log work.cdn_axi3_example_tb 
run -all
vcom -work work ../cdn_axi3_example_package.vhd ../cdn_axi3_example_test11.vhd
vsim  -c -L secureip -pli libxil_riviera.dll -l aldec_axi3_ex11.log work.cdn_axi3_example_tb 
run -all
vcom -work work ../cdn_axi3_example_package.vhd ../cdn_axi3_example_test12.vhd
vsim  -c -L secureip -pli libxil_riviera.dll -l aldec_axi3_ex12.log work.cdn_axi3_example_tb 
run -all
vcom -work work ../cdn_axi3_example_package.vhd ../cdn_axi3_example_test13.vhd
vsim  -c -L secureip -pli libxil_riviera.dll -l aldec_axi3_ex13.log work.cdn_axi3_example_tb 
run -all
vcom -work work ../cdn_axi3_example_package.vhd ../cdn_axi3_example_test14.vhd
vsim  -c -L secureip -pli libxil_riviera.dll -l aldec_axi3_ex14.log work.cdn_axi3_example_tb 
run -all
vcom -work work ../cdn_axi3_example_package.vhd ../cdn_axi3_example_test15.vhd
vsim  -c -L secureip -pli libxil_riviera.dll -l aldec_axi3_ex15.log work.cdn_axi3_example_tb 
run -all
vcom -work work ../cdn_axi3_example_package.vhd ../cdn_axi3_example_memory_model_test.vhd
vsim  -c -L secureip -pli libxil_riviera.dll -l aldec_axi3_em_mem.log work.cdn_axi3_example_memory_model_test 
run -all
#-----------------------------------------------------------------------
vlib work
vlog -work work ../cdn_axi4_example_master_v_vhd_tb.v ../cdn_axi4_example_slave_v_vhd_tb.v +incdir+./

vcom -work work ../cdn_axi4_example_package.vhd ../cdn_axi4_example_test1.vhd
vsim  -c -L secureip -pli libxil_riviera.dll -l aldec_axi4_ex1.log work.cdn_axi4_example_tb  
run -all 
vcom -work work ../cdn_axi4_example_package.vhd ../cdn_axi4_example_test2.vhd
vsim  -c -L secureip -pli libxil_riviera.dll -l aldec_axi4_ex2.log work.cdn_axi4_example_tb  
run -all
vcom -work work ../cdn_axi4_example_package.vhd ../cdn_axi4_example_test3.vhd
vsim  -c -L secureip -pli libxil_riviera.dll -l aldec_axi4_ex3.log work.cdn_axi4_example_tb  
run -all
vcom -work work ../cdn_axi4_example_package.vhd ../cdn_axi4_example_test4.vhd
vsim  -c -L secureip -pli libxil_riviera.dll -l aldec_axi4_ex4.log work.cdn_axi4_example_tb  
run -all
vcom -work work ../cdn_axi4_example_package.vhd ../cdn_axi4_example_test5.vhd
vsim  -c -L secureip -pli libxil_riviera.dll -l aldec_axi4_ex5.log work.cdn_axi4_example_tb  
run -all
vcom -work work ../cdn_axi4_example_package.vhd ../cdn_axi4_example_test6.vhd
vsim  -c -L secureip -pli libxil_riviera.dll -l aldec_axi4_ex6.log work.cdn_axi4_example_tb  
run -all
vcom -work work ../cdn_axi4_example_package.vhd ../cdn_axi4_example_test7.vhd
vsim  -c -L secureip -pli libxil_riviera.dll -l aldec_axi4_ex7.log work.cdn_axi4_example_tb  
run -all
vcom -work work ../cdn_axi4_example_package.vhd ../cdn_axi4_example_test8.vhd
vsim  -c -L secureip -pli libxil_riviera.dll -l aldec_axi4_ex8.log work.cdn_axi4_example_tb  
run -all
vcom -work work ../cdn_axi4_example_package.vhd ../cdn_axi4_example_test9.vhd
vsim  -c -L secureip -pli libxil_riviera.dll -l aldec_axi4_ex9.log work.cdn_axi4_example_tb  
run -all
vcom -work work ../cdn_axi4_example_package.vhd ../cdn_axi4_example_test10.vhd
vsim  -c -L secureip -pli libxil_riviera.dll -l aldec_axi4_ex10.log work.cdn_axi4_example_tb  
run -all
vcom -work work ../cdn_axi4_example_package.vhd ../cdn_axi4_example_test11.vhd
vsim  -c -L secureip -pli libxil_riviera.dll -l aldec_axi4_ex11.log work.cdn_axi4_example_tb  
run -all
vcom -work work ../cdn_axi4_example_package.vhd ../cdn_axi4_example_test12.vhd
vsim  -c -L secureip -pli libxil_riviera.dll -l aldec_axi4_ex12.log work.cdn_axi4_example_tb  
run -all
vcom -work work ../cdn_axi4_example_package.vhd ../cdn_axi4_example_test13.vhd
vsim  -c -L secureip -pli libxil_riviera.dll -l aldec_axi4_ex13.log work.cdn_axi4_example_tb  
run -all
vcom -work work ../cdn_axi4_example_package.vhd ../cdn_axi4_example_memory_model_test.vhd
vsim  -c -L secureip -pli libxil_riviera.dll -l aldec_axi4_ex14.log work.cdn_axi4_example_memory_model_test  
run -all

#-----------------------------------------------------------------------


vlib work
vlog -work work ../cdn_axi4_lite_example_master_v_vhd_tb.v ../cdn_axi4_lite_example_slave_v_vhd_tb.v

vcom -work work ../cdn_axi4_lite_example_package.vhd ../cdn_axi4_lite_example_test1.vhd
vsim  -c -L secureip -pli libxil_riviera.dll -l aldec_axi4lite_ex1.log work.cdn_axi4_lite_example_test 
run -all
vcom -work work ../cdn_axi4_lite_example_package.vhd ../cdn_axi4_lite_example_test2.vhd
vsim  -c -L secureip -pli libxil_riviera.dll -l aldec_axi4lite_ex2.log work.cdn_axi4_lite_example_test 
run -all
vcom -work work ../cdn_axi4_lite_example_package.vhd ../cdn_axi4_lite_example_test3.vhd
vsim  -c -L secureip -pli libxil_riviera.dll -l aldec_axi4lite_ex3.log work.cdn_axi4_lite_example_test 
run -all
vcom -work work ../cdn_axi4_lite_example_package.vhd ../cdn_axi4_lite_example_test4.vhd
vsim  -c -L secureip -pli libxil_riviera.dll -l aldec_axi4lite_ex4.log work.cdn_axi4_lite_example_test 
run -all
vcom -work work ../cdn_axi4_lite_example_package.vhd ../cdn_axi4_lite_example_test5.vhd
vsim  -c -L secureip -pli libxil_riviera.dll -l aldec_axi4lite_ex5.log work.cdn_axi4_lite_example_test 
run -all
vcom -work work ../cdn_axi4_lite_example_package.vhd ../cdn_axi4_lite_example_test6.vhd
vsim  -c -L secureip -pli libxil_riviera.dll -l aldec_axi4lite_ex6.log work.cdn_axi4_lite_example_test 
run -all
vcom -work work ../cdn_axi4_lite_example_package.vhd ../cdn_axi4_lite_example_test7.vhd
vsim  -c -L secureip -pli libxil_riviera.dll -l aldec_axi4lite_ex7.log work.cdn_axi4_lite_example_test 
run -all
vcom -work work ../cdn_axi4_lite_example_package.vhd ../cdn_axi4_lite_example_test8.vhd
vsim  -c -L secureip -pli libxil_riviera.dll -l aldec_axi4lite_ex8.log work.cdn_axi4_lite_example_test 
run -all
vcom -work work ../cdn_axi4_lite_example_package.vhd ../cdn_axi4_lite_example_test9.vhd
vsim  -c -L secureip -pli libxil_riviera.dll -l aldec_axi4lite_ex9.log work.cdn_axi4_lite_example_test 
run -all
vcom -work work ../cdn_axi4_lite_example_package.vhd ../cdn_axi4_lite_example_memory_model_test.vhd
vsim  -c -L secureip -pli libxil_riviera.dll -l aldec_axi4lite_ex_mem.log work.cdn_axi4_lite_example_memory_model_test 
run -all

#-----------------------------------------------------------------------

vlib work
vlog -work work ../cdn_axi4_streaming_example_master_v_vhd.v ../cdn_axi4_streaming_example_slave_v_vhd.v
vcom -work work ../cdn_axi4_streaming_example_package.vhd ../cdn_axi4_streaming_example_test1.vhd
vsim  -c -L secureip -pli libxil_riviera.dll -l aldec_axi4streaming_ex1.log work.cdn_axi4_streaming_example_testbench 
run -all
vcom -work work ../cdn_axi4_streaming_example_package.vhd ../cdn_axi4_streaming_example_test2.vhd
vsim  -c -L secureip -pli libxil_riviera.dll -l aldec_axi4streaming_ex2.log work.cdn_axi4_streaming_example_testbench 
run -all
vcom -work work ../cdn_axi4_streaming_example_package.vhd ../cdn_axi4_streaming_example_test3.vhd
vsim  -c -L secureip -pli libxil_riviera.dll -l aldec_axi4streaming_ex3.log work.cdn_axi4_streaming_example_testbench 
run -all
vcom -work work ../cdn_axi4_streaming_example_package.vhd ../cdn_axi4_streaming_example_test4.vhd
vsim  -c -L secureip -pli libxil_riviera.dll -l aldec_axi4streaming_ex4.log work.cdn_axi4_streaming_example_testbench 
run -all
vcom -work work ../cdn_axi4_streaming_example_package.vhd ../cdn_axi4_streaming_example_test5.vhd
vsim  -c -L secureip -pli libxil_riviera.dll -l aldec_axi4streaming_ex5.log work.cdn_axi4_streaming_example_testbench 
run -all
vcom -work work ../cdn_axi4_streaming_example_package.vhd ../cdn_axi4_streaming_example_test6.vhd
vsim  -c -L secureip -pli libxil_riviera.dll -l aldec_axi4streaming_ex6.log work.cdn_axi4_streaming_example_testbench 
run -all

