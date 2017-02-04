-- (c) Copyright 2011 - 2012 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--library verilog;
--use verilog.vl_types.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;

library std;
use std.textio.all;

library work;
use work.all;

use work.cdn_axi4_lite_example_tb_testbench.all;

entity cdn_axi4_lite_example_test is 
end entity; 


architecture rtl of cdn_axi4_lite_example_test is 

begin
    master_0:work.cdn_axi4_lite_example_tb_testbench.cdn_axi4_lite_master_bfm_wrap
    generic map (
                C_M_AXI_LITE_NAME                      =>  C_M_AXI_LITE_NAME                      ,
                C_M_AXI_LITE_DATA_WIDTH                =>  C_M_AXI_LITE_DATA_WIDTH                ,
                C_M_AXI_LITE_ADDR_WIDTH                =>  C_M_AXI_LITE_ADDR_WIDTH                ,
                C_INTERCONNECT_M_AXI_LITE_READ_ISSUING =>  C_INTERCONNECT_M_AXI_LITE_READ_ISSUING ,
                C_INTERCONNECT_M_AXI_LITE_WRITE_ISSUING=>  C_INTERCONNECT_M_AXI_LITE_WRITE_ISSUING
    )
    port map    (
                 M_AXI_LITE_ACLK      =>  M_AXI_LITE_ACLK      ,
                 M_AXI_LITE_ARESETN   =>  M_AXI_LITE_ARESETN   ,
                 M_AXI_LITE_AWADDR    =>  M_AXI_LITE_AWADDR    ,
                 M_AXI_LITE_AWPROT    =>  M_AXI_LITE_AWPROT    ,
                 M_AXI_LITE_AWVALID   =>  M_AXI_LITE_AWVALID   ,
                 M_AXI_LITE_AWREADY   =>  M_AXI_LITE_AWREADY   ,
                 M_AXI_LITE_WDATA     =>  M_AXI_LITE_WDATA     ,
                 M_AXI_LITE_WSTRB     =>  M_AXI_LITE_WSTRB     ,
                 M_AXI_LITE_WVALID    =>  M_AXI_LITE_WVALID    ,
                 M_AXI_LITE_WREADY    =>  M_AXI_LITE_WREADY    ,
                 M_AXI_LITE_BRESP     =>  M_AXI_LITE_BRESP     ,
                 M_AXI_LITE_BVALID    =>  M_AXI_LITE_BVALID    ,
                 M_AXI_LITE_BREADY    =>  M_AXI_LITE_BREADY    ,
                 M_AXI_LITE_ARADDR    =>  M_AXI_LITE_ARADDR    ,
                 M_AXI_LITE_ARPROT    =>  M_AXI_LITE_ARPROT    ,
                 M_AXI_LITE_ARVALID   =>  M_AXI_LITE_ARVALID   ,
                 M_AXI_LITE_RDATA     =>  M_AXI_LITE_RDATA     ,
                 M_AXI_LITE_RVALID    =>  M_AXI_LITE_RVALID    ,
                 M_AXI_LITE_RREADY    =>  M_AXI_LITE_RREADY    ,
                 M_AXI_LITE_ARREADY   =>  M_AXI_LITE_ARREADY   ,
                 M_AXI_LITE_RRESP     =>  M_AXI_LITE_RRESP     ,
                 MTESTADDRESS                  =>  MTESTADDRESS                  ,
                 MTESTPROTECTION               =>  MTESTPROTECTION               ,
                 TEST_DATA                     =>  TEST_DATA                     ,
                 RD_DATA                       =>  RD_DATA                       ,
                 RESPONSE                      =>  RESPONSE                      ,
                 MTESTDATASIZE                 =>  MTESTDATASIZE                 ,
                 WRITE_BURST                   =>  WRITE_BURST                   ,
                 READ_BURST                    =>  READ_BURST                    ,
                 WRITE_BURST_DONE              =>  WRITE_BURST_DONE              ,
                 READ_BURST_DONE               =>  READ_BURST_DONE               ,
                 WRITE_BURST_CONCURRENT        =>  WRITE_BURST_CONCURRENT        ,
                 WRITE_BURST_CONCURRENT_DONE   =>  WRITE_BURST_CONCURRENT_DONE   ,
                 WRITE_BURST_DATA_FIRST        =>  WRITE_BURST_DATA_FIRST        ,
                 WRITE_BURST_DATA_FIRST_DONE   =>  WRITE_BURST_DATA_FIRST_DONE   ,
                 REPORT_STATUS                     =>  REPORT_STATUS ,
                 REPORT_STATUS_DONE                =>  REPORT_STATUS_DONE,
                 NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING => NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING
    );

    slave_0:work.cdn_axi4_lite_example_tb_testbench.cdn_axi4_lite_slave_bfm_wrap
    generic map (
                C_S_AXI_LITE_NAME                          => C_S_AXI_LITE_NAME                          ,
                C_S_AXI_LITE_DATA_WIDTH                    => C_S_AXI_LITE_DATA_WIDTH                    ,
                C_S_AXI_LITE_ADDR_WIDTH                    => C_S_AXI_LITE_ADDR_WIDTH                    ,
                C_INTERCONNECT_S_AXI_LITE_READ_ACCEPTANCE  => C_INTERCONNECT_S_AXI_LITE_READ_ACCEPTANCE  ,
                C_INTERCONNECT_S_AXI_LITE_WRITE_ACCEPTANCE => C_INTERCONNECT_S_AXI_LITE_WRITE_ACCEPTANCE ,
                C_S_AXI_LITE_MEMORY_MODEL_MODE             => C_S_AXI_LITE_MEMORY_MODEL_MODE             ,
                C_BASEADDR                                 => C_BASEADDR                                 ,
                C_HIGHADDR                                 => C_HIGHADDR                                 ,
                C_S_AXI_LITE_SLAVE_MEM_SIZE                => C_S_AXI_LITE_SLAVE_MEM_SIZE                
    )
    port map    (
                 S_AXI_LITE_ACLK                  =>  S_AXI_LITE_ACLK                  ,
                 S_AXI_LITE_ARESETN               =>  S_AXI_LITE_ARESETN               ,
                 S_AXI_LITE_AWADDR                =>  M_AXI_LITE_AWADDR                ,
                 S_AXI_LITE_AWPROT                =>  M_AXI_LITE_AWPROT                ,
                 S_AXI_LITE_AWVALID               =>  M_AXI_LITE_AWVALID               ,
                 S_AXI_LITE_AWREADY               =>  M_AXI_LITE_AWREADY               ,
                 S_AXI_LITE_WDATA                 =>  M_AXI_LITE_WDATA                 ,
                 S_AXI_LITE_WSTRB                 =>  M_AXI_LITE_WSTRB                 ,
                 S_AXI_LITE_WVALID                =>  M_AXI_LITE_WVALID                ,
                 S_AXI_LITE_WREADY                =>  M_AXI_LITE_WREADY                ,
                 S_AXI_LITE_BRESP                 =>  M_AXI_LITE_BRESP                 ,
                 S_AXI_LITE_BVALID                =>  M_AXI_LITE_BVALID                ,
                 S_AXI_LITE_BREADY                =>  M_AXI_LITE_BREADY                ,
                 S_AXI_LITE_ARADDR                =>  M_AXI_LITE_ARADDR                ,
                 S_AXI_LITE_ARPROT                =>  M_AXI_LITE_ARPROT                ,
                 S_AXI_LITE_ARVALID               =>  M_AXI_LITE_ARVALID               ,
                 S_AXI_LITE_ARREADY               =>  M_AXI_LITE_ARREADY               ,
                 S_AXI_LITE_RDATA                 =>  M_AXI_LITE_RDATA                 ,
                 S_AXI_LITE_RRESP                 =>  M_AXI_LITE_RRESP                 ,
                 S_AXI_LITE_RVALID                =>  M_AXI_LITE_RVALID                ,
                 S_AXI_LITE_RREADY                =>  M_AXI_LITE_RREADY                ,
                 WRITE_ID_TAG                     =>  WRITE_ID_TAG                     ,
                 READ_ID_TAG                      =>  READ_ID_TAG                      ,
                 RESP_DATA                        =>  RESP_DATA                        ,
                 WRITE_BURST_RES                  =>  WRITE_BURST_RES                  ,
                 READ_BURST_RES                   =>  READ_BURST_RES                   ,
                 SET_READ_BURST_DATA_TRANSFER_GAP =>  SET_READ_BURST_DATA_TRANSFER_GAP ,
                 SET_WRITE_RESPONSE_GAP           =>  SET_WRITE_RESPONSE_GAP           ,
                 SET_READ_RESPONSE_GAP            =>  SET_READ_RESPONSE_GAP            ,
                 GAP_DATA                         =>  GAP_DATA                         ,
                 ADDRVALID                        =>  ADDRVALID                        ,
                 WRITE_BURST_RESP_CTRL            =>  WRITE_BURST_RESP_CTRL            ,
                 READ_BURST_RESP_CTRL             =>  READ_BURST_RESP_CTRL             ,
                 RESPONSE                         =>  SLAVERESPONSE                    ,
                 WRITE_BURST_RESP_CTRL_DONE       =>  WRITE_BURST_RESP_CTRL_DONE       ,
                 READ_BURST_RESP_CTRL_DONE        =>  READ_BURST_RESP_CTRL_DONE        ,
                 ERROR_RESPONSE                   =>  ERROR_RESPONSE                   ,
                 PENDING_TRANSACTIONS_COUNT       =>  PENDING_TRANSACTIONS_COUNT       ,
                 STESTDATASIZE                    =>  STESTDATASIZE                    ,
                 WR_DATA                          =>  WR_DATA                          ,
                 WRITE_BURST_RES_DONE             =>  WRITE_BURST_RES_DONE             ,
                 READ_BURST_RES_DONE              =>  READ_BURST_RES_DONE              ,
                 REPORT_STATUS                       =>  S_REPORT_STATUS                      ,
                 REPORT_STATUS_DONE                  =>  S_REPORT_STATUS_DONE                 ,
                 NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING => S_NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING
    );
           -- Master BFM Clock Generation
           process begin
            wait for (clk_per/2);
            M_AXI_LITE_ACLK <= not M_AXI_LITE_ACLK;
            end process;
            
           -- Slave BFM Clock Generation
            process begin
            wait for (clk_per/2);
            S_AXI_LITE_ACLK <= not S_AXI_LITE_ACLK;
            end process;


            -- Master BFM Reset
            process 
            begin
                M_AXI_LITE_ARESETN <= '1';
                wait for 10 ns;
                M_AXI_LITE_ARESETN <= '0';
				    		wait for 50 ns;
				    		wait until M_AXI_LITE_ACLK = '1';
                M_AXI_LITE_ARESETN  <= '1';
                wait ;
            end process;

            -- Slave BFM Reset
            process 
              begin
                  S_AXI_LITE_ARESETN <= '1';
                  wait for 10 ns;
                  S_AXI_LITE_ARESETN <= '0';
						      wait for 50 ns;
						      wait until S_AXI_LITE_ACLK = '1';
                  S_AXI_LITE_ARESETN  <= '1';
              wait;
            end process;

          
            process 
            begin
                 -----------------------------------------------------------------------
                 -- EXAMPLE TEST 3:
                 -- Parallel write and read burst transfers example.
                 -- DESCRIPTION:
                 -- The following master code starts 3 sequential writes and 3 
                 -- sequential reads in parallel.
                 -- Please note that care must be taken not to violate AXI order 
                 -- protocol when using parallel option.
                 -----------------------------------------------------------------------
                  MTESTADDRESS    <= X"00000000";
                  MTESTPROTECTION <= "000" ;
                  MTESTDATASIZE   <= "000000000100";
                  --WRITE  1 ----------------------------------------------------------------------------
                  TEST_DATA    <= X"FFFFFFFF"; MTESTADDRESS    <= "00000000000000000000000000000000";
                  WRITE_BURST          <= '1';
                  READ_BURST           <= '0';
                  wait until WRITE_BURST_DONE = '1';
                  WRITE_BURST <= '0';
                  check_response_okay(response);
                  ---------------------------------------------------------------------------------------
                  --WRITE  2 ----------------------------------------------------------------------------
                  TEST_DATA    <= X"12345678"; MTESTADDRESS    <= "00000000000000000000000000100000";
                  WRITE_BURST          <= '1';
                  READ_BURST           <= '0';
                  wait until WRITE_BURST_DONE = '1';
                  WRITE_BURST <= '0';
                  check_response_okay(response);
                  ---------------------------------------------------------------------------------------
                  --WRITE  3 ----------------------------------------------------------------------------
                  TEST_DATA    <= X"00000000"; MTESTADDRESS    <= "00000000000000000000000001000000";
                  WRITE_BURST          <= '1';
                  READ_BURST           <= '0';
                  wait until WRITE_BURST_DONE = '1';
                  WRITE_BURST <= '0';
                  check_response_okay(response);
                  ---------------------------------------------------------------------------------------
                  wait until M_AXI_LITE_ACLK = '1';
                  wait until M_AXI_LITE_ACLK = '1';
                  --READ 1 ----------------------------------------------------------------------------
                  TEST_DATA    <= X"FFFFFFFF"; MTESTADDRESS    <= "00000000000000000000000001100000";
                  READ_BURST          <= '1';
					  	    wait until READ_BURST_DONE = '1';
					  	    READ_BURST           <= '0';
                  check_response_okay(RESPONSE);
					  	    compare_data(TEST_DATA,RD_DATA);
                  ---------------------------------------------------------------------------------------
                  wait until M_AXI_LITE_ACLK = '1';
                  --READ 2 ----------------------------------------------------------------------------
                  TEST_DATA    <= X"12345678"; MTESTADDRESS    <= "00000000000000000000000010000000";
                  READ_BURST          <= '1';
					  	    wait until READ_BURST_DONE = '1';
					  	    READ_BURST           <= '0';
                  check_response_okay(RESPONSE);
					  	    compare_data(TEST_DATA,RD_DATA);
                  ---------------------------------------------------------------------------------------
                  wait until M_AXI_LITE_ACLK = '1';
                  --READ 3 ----------------------------------------------------------------------------
                  TEST_DATA    <= X"00000000"; MTESTADDRESS    <= "00000000000000000000000010100000";
                  READ_BURST          <= '1';
					  	    wait until READ_BURST_DONE = '1';
					  	    READ_BURST           <= '0';
                  check_response_okay(RESPONSE);
					  	    compare_data(TEST_DATA,RD_DATA);
                  ---------------------------------------------------------------------------------------
            wait ;
            end process;

            process 
             variable TEST     :  integer ; 
             variable outline1 : line;
            begin
                  TEST := 3;
                  -- WRITE 1 ------------------------------------------------------------------------------
                  RESP_DATA    <= X"FFFFFFFF";   
                  WRITE_ID_TAG     <= "00000000000000000000000000000000";
                  ADDRVALID        <= '0';
                  WRITE_BURST_RES  <= '1';
					    		wait until WRITE_BURST_RES_DONE = '1';
                  WRITE_BURST_RES  <= '0';
					    	  compare_data(RESP_DATA,WR_DATA);
                  ---------------------------------------------------------------------------------------
                  -- WRITE 2 ------------------------------------------------------------------------------
                  RESP_DATA    <= X"12345678";
                  WRITE_BURST_RES  <= '1';
					    		wait until WRITE_BURST_RES_DONE = '1';
                  WRITE_BURST_RES  <= '0';
					    	  compare_data(RESP_DATA,WR_DATA);
                  ---------------------------------------------------------------------------------------
                  -- WRITE 3 ------------------------------------------------------------------------------
                  RESP_DATA    <= X"00000000";
                  WRITE_BURST_RES  <= '1';
					    		wait until WRITE_BURST_RES_DONE = '1';
                  WRITE_BURST_RES  <= '0';
					    	  compare_data(RESP_DATA,WR_DATA);
                  ---------------------------------------------------------------------------------------
                  wait until M_AXI_LITE_ACLK = '1';
                  READ_ID_TAG  <= WRITE_ID_TAG;
                  -- READ 1 ------------------------------------------------------------------------------
                  RESP_DATA    <= X"FFFFFFFF"; 
					    		READ_BURST_RES <= '1';
					    		wait until READ_BURST_RES_DONE = '1';
					    		READ_BURST_RES <= '0';
                  ---------------------------------------------------------------------------------------
                  -- READ 2 ------------------------------------------------------------------------------
                  RESP_DATA    <= X"12345678"; 
					    		READ_BURST_RES <= '1';
					    		wait until READ_BURST_RES_DONE = '1';
					    		READ_BURST_RES <= '0';
                  ---------------------------------------------------------------------------------------
                  -- READ 3 ------------------------------------------------------------------------------
                  RESP_DATA    <= X"00000000"; 
					    		READ_BURST_RES <= '1';
					    		wait until READ_BURST_RES_DONE = '1';
					    		READ_BURST_RES <= '0';
                  ---------------------------------------------------------------------------------------
                wait until M_AXI_LITE_ACLK = '1';
                wait until M_AXI_LITE_ACLK = '1';
                wait until M_AXI_LITE_ACLK = '1';
                M_NO_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING <= '0';
                S_NO_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING <= '0';
                REPORT_STATUS  <= '1';
                wait until REPORT_STATUS_DONE  = '1';
                S_REPORT_STATUS  <= '1';
                wait until S_REPORT_STATUS_DONE  = '1';
                REPORT_MASTER_STATUS(M_NO_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING,TEST);
                REPORT_SLAVE_STATUS(S_NO_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING,TEST);
                write(outline1, string'("---------------------------------------------------------------"));
                writeline(output,outline1);
                write(outline1, string'("COMPLETE EXAMPLE TEST "));
                write(outline1, test);
                write(outline1, string'("  : FINISHED!"));
                writeline(output,outline1);
                write(outline1, string'("---------------------------------------------------------------"));
                writeline(output,outline1);
                stop_simulation;
                wait ;
            end process;


end;
