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
use work.axi3_example_testbench.all;

-- Entity of cdn_axi3_example_tb Test
entity cdn_axi3_example_tb is 
end entity; 

-- Architecture of cdn_axi3_example_tb Test
architecture rtl of cdn_axi3_example_tb is 

 begin
   master_0 : work.axi3_example_testbench.cdn_axi3_master_bfm_wrap 
	  generic map(
               C_M_AXI_NAME                       => C_M_AXI_NAME,                       
               C_M_AXI_DATA_WIDTH                 => C_M_AXI_DATA_WIDTH,               
               C_M_AXI_ADDR_WIDTH                 => C_M_AXI_ADDR_WIDTH,                 
               C_M_AXI_ID_WIDTH                   => C_M_AXI_ID_WIDTH,                   
               C_INTERCONNECT_M_AXI_READ_ISSUING  => C_INTERCONNECT_M_AXI_READ_ISSUING,  
               C_INTERCONNECT_M_AXI_WRITE_ISSUING => C_INTERCONNECT_M_AXI_WRITE_ISSUING, 
               C_M_AXI_EXCLUSIVE_ACCESS_SUPPORTED => C_M_AXI_EXCLUSIVE_ACCESS_SUPPORTED 
                )
	 port map 
	 (
	          M_AXI_ACLK    =>   M_AXI_ACLK,
            M_AXI_ARESETN =>   M_AXI_ARESETN,
            -- Write Address ChSnnel
            M_AXI_AWID    =>   M_AXI_AWID,
            M_AXI_AWADDR  =>   M_AXI_AWADDR,
            M_AXI_AWLEN   =>   M_AXI_AWLEN,
            M_AXI_AWSIZE  =>   M_AXI_AWSIZE,
            M_AXI_AWBURST =>   M_AXI_AWBURST,
            M_AXI_AWLOCK  =>   M_AXI_AWLOCK,
            M_AXI_AWCACHE =>   M_AXI_AWCACHE,
            M_AXI_AWPROT  =>   M_AXI_AWPROT,
            M_AXI_AWVALID =>   M_AXI_AWVALID,
            M_AXI_AWREADY =>   M_AXI_AWREADY,
            -- Write=>   Data CMannel Signals.
            M_AXI_WID     =>   M_AXI_WID,
            M_AXI_WDATA   =>   M_AXI_WDATA,
            M_AXI_WSTRB   =>   M_AXI_WSTRB, 
            M_AXI_WLAST   =>   M_AXI_WLAST, 
            M_AXI_WVALID  =>   M_AXI_WVALID,
            M_AXI_WREADY  =>   M_AXI_WREADY,
           -- Write=>   ResponsM Channel Signals.
            M_AXI_BID     =>   M_AXI_BID,
            M_AXI_BRESP   =>   M_AXI_BRESP,
            M_AXI_BVALID  =>   M_AXI_BVALID,
            M_AXI_BREADY  =>   M_AXI_BREADY,
            -- Read =>   ddressMChannel Signals.
            M_AXI_ARID    =>   M_AXI_ARID,
            M_AXI_ARADDR  =>   M_AXI_ARADDR,
            M_AXI_ARLEN   =>   M_AXI_ARLEN,
            M_AXI_ARSIZE  =>   M_AXI_ARSIZE,
            M_AXI_ARBURST =>   M_AXI_ARBURST,
            M_AXI_ARLOCK  =>   M_AXI_ARLOCK,
            M_AXI_ARCACHE =>   M_AXI_ARCACHE,
            M_AXI_ARPROT  =>   M_AXI_ARPROT,
            M_AXI_ARVALID =>   M_AXI_ARVALID,
            M_AXI_ARREADY =>   M_AXI_ARREADY,
            -- Read =>   ata ChMnnel Signals.
            M_AXI_RID     =>   M_AXI_RID,
            M_AXI_RDATA   =>   M_AXI_RDATA,
            M_AXI_RRESP   =>   M_AXI_RRESP,
            M_AXI_RLAST   =>   M_AXI_RLAST,
            M_AXI_RVALID  =>   M_AXI_RVALID,
            M_AXI_RREADY  =>   M_AXI_RREADY,
            WRITE_DONE    =>   WRITE_DONE,
            READ_DONE     =>   READ_DONE,
            mtestID       =>   mtestID,
            stestID       =>   stestID,
            mtestADDR     =>   mtestADDR,
            mtestBurstLength     =>    mtestBurstLength,
            BURST_SIZE_4_BYTES_s =>    BURST_SIZE_4_BYTES_s,
            BURST_TYPE_FIXED_s   =>    BURST_TYPE_FIXED_s,
            LOCK_TYPE_NORMAL_s   =>    LOCK_TYPE_NORMAL_s,
            fourbit              =>    fourbit,
            threebit             =>    threebit,
            test_data            =>    test_data ,
            mtestdatasize        =>    mtestdatasize,
            response             =>    response,
            rd_data              =>    rd_data,
            write_task           =>    write_task,
            read_task            =>    read_task,
            vresponse            =>    vresponse,
            WRITE_BURST_CONCURRENT            => WRITE_BURST_CONCURRENT            ,
            WRITE_BURST_CONCURRENT_DONE       => WRITE_BURST_CONCURRENT_DONE       ,
            WRITE_BURST_DATA_FIRST            => WRITE_BURST_DATA_FIRST            ,
            WRITE_BURST_DATA_FIRST_DONE       => WRITE_BURST_DATA_FIRST_DONE       ,
            SET_WRITE_BURST_DATA_TRANSFER_GAP => SET_WRITE_BURST_DATA_TRANSFER_GAP ,
            GAP_DATA                          => GAP_DATA                          ,
            WRITE_DATA_TRANSFER_COMPLETE      => WRITE_DATA_TRANSFER_COMPLETE      ,
            REPORT_STATUS                     =>  REPORT_STATUS ,
            REPORT_STATUS_DONE                =>  REPORT_STATUS_DONE,
            NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING => NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING
						);
     slave_0 : work.axi3_example_testbench.cdn_axi3_slave_bfm_wrap 
	  generic map(
               C_S_AXI_NAME                          => C_S_AXI_NAME                          ,
               C_S_AXI_DATA_WIDTH                    => C_S_AXI_DATA_WIDTH                    ,
               C_S_AXI_ADDR_WIDTH                    => C_S_AXI_ADDR_WIDTH                    ,
               C_S_AXI_ID_WIDTH                      => C_S_AXI_ID_WIDTH                      ,
               C_INTERCONNECT_S_AXI_READ_ACCEPTANCE  => C_INTERCONNECT_S_AXI_READ_ACCEPTANCE  ,
               C_INTERCONNECT_S_AXI_WRITE_ACCEPTANCE => C_INTERCONNECT_S_AXI_WRITE_ACCEPTANCE ,
               C_S_AXI_MEMORY_MODEL_MODE             => C_S_AXI_MEMORY_MODEL_MODE             ,
               C_BASEADDR                            => C_BASEADDR                            ,
               C_S_AXI_EXCLUSIVE_ACCESS_SUPPORTED    => C_S_AXI_EXCLUSIVE_ACCESS_SUPPORTED    ,
               C_S_AXI_SLAVE_MEM_SIZE                => C_S_AXI_SLAVE_MEM_SIZE                
    )
	 port map 
	 (
      S_AXI_ACLK                    => S_AXI_ACLK                    ,
      S_AXI_ARESETN                 => S_AXI_ARESETN                 ,
      S_AXI_AWID                    => M_AXI_AWID                    ,
      S_AXI_AWADDR                  => M_AXI_AWADDR                  ,
      S_AXI_AWLEN                   => M_AXI_AWLEN                   ,
      S_AXI_AWSIZE                  => M_AXI_AWSIZE                  ,
      S_AXI_AWBURST                 => M_AXI_AWBURST                 ,
      S_AXI_AWLOCK                  => M_AXI_AWLOCK                  ,
      S_AXI_AWCACHE                 => M_AXI_AWCACHE                 ,
      S_AXI_AWPROT                  => M_AXI_AWPROT                  ,
      S_AXI_AWVALID                 => M_AXI_AWVALID                 ,
      S_AXI_AWREADY                 => M_AXI_AWREADY                 ,
      S_AXI_WID                     => M_AXI_WID                     ,
      S_AXI_WDATA                   => M_AXI_WDATA                   ,
      S_AXI_WSTRB                   => M_AXI_WSTRB                   ,
      S_AXI_WLAST                   => M_AXI_WLAST                   ,
      S_AXI_WVALID                  => M_AXI_WVALID                  ,
      S_AXI_WREADY                  => M_AXI_WREADY                  ,
      S_AXI_BID                     => M_AXI_BID                     ,
      S_AXI_BRESP                   => M_AXI_BRESP                   ,
      S_AXI_BVALID                  => M_AXI_BVALID                  ,
      S_AXI_BREADY                  => M_AXI_BREADY                  ,
      S_AXI_ARID                    => M_AXI_ARID                    ,
      S_AXI_ARADDR                  => M_AXI_ARADDR                  ,
      S_AXI_ARLEN                   => M_AXI_ARLEN                   ,
      S_AXI_ARSIZE                  => M_AXI_ARSIZE                  ,
      S_AXI_ARBURST                 => M_AXI_ARBURST                 ,
      S_AXI_ARLOCK                  => M_AXI_ARLOCK                  ,
      S_AXI_ARCACHE                 => M_AXI_ARCACHE                 ,
      S_AXI_ARPROT                  => M_AXI_ARPROT                  ,
      S_AXI_ARVALID                 => M_AXI_ARVALID                 ,
      S_AXI_ARREADY                 => M_AXI_ARREADY                 ,
      S_AXI_RID                     => M_AXI_RID                     ,
      S_AXI_RDATA                   => M_AXI_RDATA                   ,
      S_AXI_RRESP                   => M_AXI_RRESP                   ,
      S_AXI_RLAST                   => M_AXI_RLAST                   ,
      S_AXI_RVALID                  => M_AXI_RVALID                  ,
      S_AXI_RREADY                  => M_AXI_RREADY                  ,
      SET_CHANNERL_LEVEL_INFO       => SET_CHANNERL_LEVEL_INFO       ,
      WRITE_ID_TAG                  => WRITE_ID_TAG                  ,
      WR_DATA                       => WR_DATA                       ,
      DATA_SIZE                     => DATA_SIZE                     ,                     
      READ_ID_TAG                   => READ_ID_TAG                   ,                  
      RESP_DATA                     => RESP_DATA                     ,
      WRITE_BURST_RES               => WRITE_BURST_RES               ,
      READ_BURST_RES                => READ_BURST_RES                ,
      WRITE_BURST_RES_DONE          => WRITE_BURST_RES_DONE          ,
      READ_BURST_RES_DONE           => READ_BURST_RES_DONE           ,
      RECEIVE_READ_ADDRESS                => RECEIVE_READ_ADDRESS                ,
      RECEIVE_READ_ADDRESS_DONE           => RECEIVE_READ_ADDRESS_DONE           ,
      RECEIVE_WRITE_ADDRESS               => RECEIVE_WRITE_ADDRESS               ,
      RECEIVE_WRITE_ADDRESS_DONE          => RECEIVE_WRITE_ADDRESS_DONE          ,
      IDVALID                             => IDVALID                             ,
      STESTADDRESS                        => STESTADDRESS                        ,
      STESTLENGTH                         => STESTLENGTH                         ,
      STESTSIZE                           => STESTSIZE                           ,
      STESTBURST_TYPE                     => STESTBURST_TYPE                     ,
      STESTLOCK_TYPE                      => STESTLOCK_TYPE                      ,
      STESTCACHE_TYPE                     => STESTCACHE_TYPE                     ,
      STESTPROTECTION_TYPE                => STESTPROTECTION_TYPE                ,
      ID_TAG                              => ID_TAG                              ,
      SEND_READ_BURST                     => SEND_READ_BURST                     ,
      SEND_READ_BURST_DONE                => SEND_READ_BURST_DONE                ,
      WRITE_SADDRESS                      => WRITE_SADDRESS                      ,
      WRITE_STESTLENGTH                   => WRITE_STESTLENGTH                   ,
      WRITE_STESTSIZE                     => WRITE_STESTSIZE                     ,
      WRITE_STESTBURST_TYPE               => WRITE_STESTBURST_TYPE               ,
      WRITE_STESTLOCK_TYPE                => WRITE_STESTLOCK_TYPE                ,
      WRITE_DATA                          => WRITE_DATA                          ,
      SEND_WRITE_RESPONSE                 => SEND_WRITE_RESPONSE                 ,
      SEND_WRITE_RESPONSE_DONE            => SEND_WRITE_RESPONSE_DONE            ,
      STESTRESPONSE                       => STESTRESPONSE                       ,
      ERROR_RESPONSE                      => ERROR_RESPONSE                      ,
      WRITE_BURST_RESPOND_DATA_FIRST      => WRITE_BURST_RESPOND_DATA_FIRST      ,
      WRITE_BURST_RESPOND_DATA_FIRST_DONE => WRITE_BURST_RESPOND_DATA_FIRST_DONE ,
      SET_READ_BURST_DATA_TRANSFER_GAP    => SET_READ_BURST_DATA_TRANSFER_GAP    ,
      PENDING_TRANSACTIONS_COUNT          => PENDING_TRANSACTIONS_COUNT          ,
      WRITE_BURST_RESP_CTRL               => WRITE_BURST_RESP_CTRL               ,
      WRITE_BURST_RESP_CTRL_DONE          => WRITE_BURST_RESP_CTRL_DONE          ,
      READ_BURST_RESP_CTRL                => READ_BURST_RESP_CTRL                ,
      READ_BURST_RESP_CTRL_DONE           => READ_BURST_RESP_CTRL_DONE           ,
      READ_DATA_TRANSFER_COMPLETE         => READ_DATA_TRANSFER_COMPLETE         ,
      SET_WRITE_RESPONSE_GAP              => SET_WRITE_RESPONSE_GAP              ,
      GAP_DATA                            => SLAVE_GAP_DATA                      ,
      SET_READ_RESPONSE_GAP               => SET_READ_RESPONSE_GAP               ,
      REPORT_STATUS                       =>  S_REPORT_STATUS                      ,
      REPORT_STATUS_DONE                  =>  S_REPORT_STATUS_DONE                 ,
      NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING => S_NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING
      );
           process begin
           wait for (clk_per/2);
           M_AXI_ACLK <= not M_AXI_ACLK;
           end process;
            
            process begin
            wait for (clk_per/2);
            S_AXI_ACLK <= not S_AXI_ACLK;
            end process;

            process 
              begin
                  S_AXI_ARESETN <= '1';
                  wait for 10 ns;
                  S_AXI_ARESETN <= '0';
						      wait for 50 ns;
						      wait until S_AXI_ACLK = '1';
                  S_AXI_ARESETN  <= '1';
              wait;
            end process;

            process 
            begin
                M_AXI_ARESETN <= '1';
                wait for 10 ns;
                M_AXI_ARESETN <= '0';
				    		wait for 50 ns;
				    		wait until M_AXI_ACLK = '1';
                M_AXI_ARESETN  <= '1';
                wait ;
            end process;

        process 
        begin 
				    		wait until M_AXI_ACLK = '1';
                SLAVE_FINISHED <= "0011";
                wait;
        end process;
        -----------------------------------------------------------------------
        -- EXAMPLE TEST 9:
        -- Write data interleaving example.
        -- DESCRIPTION:
        -- The following master code does the following:
        -- 1. Two write bursts interleaved (i.e. interleave depth 2)
        -- 2. Three write bursts interleaved (i.e. interleave depth 3)
        -- NOTE: To enable the master BFM to generate data interleaved writes
        -- the writes must be done in parallel (i.e. in a fork and join) AND
        -- The master control variable "WRITE_BURST_DATA_TRANSFER_GAP" must be
        -- greater than 0. This allows other parallel write data bursts time 
        -- to access the write data channel.
        -----------------------------------------------------------------------
        process 
					 variable outline2 : line ;
           variable ARSIZE  : integer ;
           variable ARLEN   : integer ;
        begin 
             SET_WRITE_BURST_DATA_TRANSFER_GAP <= '1';
             GAP_DATA                          <= "000000000001";
             SET_WRITE_BURST_DATA_TRANSFER_GAP <= '0';

          --- Depth 2
          -- write_task
                mtestID               <= "1010";
                mtestADDR             <= "00000000000000000000000000000000" ; 
                mtestBurstLength      <= "0111";
                BURST_SIZE_4_BYTES_s  <= "0010";
                BURST_TYPE_FIXED_s    <= "00"; 
                LOCK_TYPE_NORMAL_s    <= '0';
                fourbit               <= '0';           
                threebit              <= '0';          
                test_data             <= (others=>'1');
                mtestdatasize         <= "1000000";    
                ARSIZE               := 2;
                ARLEN                := 7;

                write_task <= '1';
								wait until WRITE_DONE = '1';
                write_task <= '0';
                check_response_okay(response);

          -- write_task
                BURST_TYPE_FIXED_s    <= "01"; 
                test_data     <= X"00000000111111112222222233333333444444445555555566666666777777778888888899999999aaaaaaaabbbbbbbbccccccccddddddddeeeeeeeeffffffff";
                mtestID               <= "1011";
                mtestADDR             <= "00000000000000000000000010000000" ; --SLAVE_ADDRESS;
                write_task <= '1';
								wait until WRITE_DONE = '1';
                write_task <= '0';
                check_response_okay(response);
           -- The following code does a write data interleave of depth 3
           -- write_task
                mtestID               <= "1111";
                mtestADDR             <= "00000000000000000000000000000000" ; 
                BURST_TYPE_FIXED_s    <= "00"; 
                test_data             <= (others=>'1');
                write_task <= '1';
								wait until WRITE_DONE = '1';
                write_task <= '0';
                check_response_okay(response);

          -- write_task
                 BURST_TYPE_FIXED_s    <= "01"; 
                 test_data     <= X"00000000111111112222222233333333444444445555555566666666777777778888888899999999aaaaaaaabbbbbbbbccccccccddddddddeeeeeeeeffffffff";
                mtestID               <= "0001";
                mtestADDR             <= "00000000000000000000000001000000" ; --SLAVE_ADDRESS;
                write_task <= '1';
								wait until WRITE_DONE = '1';
                write_task <= '0';
                check_response_okay(response);
                
          -- write_task
                mtestID               <= "0010";
                mtestADDR             <= "00000000000000000000000100000000" ; --SLAVE_ADDRESS;
                write_task <= '1';
								wait until WRITE_DONE = '1';
                write_task <= '0';
                check_response_okay(response);
   
                SET_WRITE_BURST_DATA_TRANSFER_GAP <= '1';
                GAP_DATA                          <= "000000000000";
                SET_WRITE_BURST_DATA_TRANSFER_GAP <= '0';
     
                wait;
        end process;

        -----------------------------------------------------------------------
        -- EXAMPLE TEST 9:
        -- Write data interleaving example.
        -- DESCRIPTION:
        -- The following slave code provides responses to all of the 
        -- interleaved write bursts coming from the master.
        -- The WRITE_BURST_RESPOND tasks need to be done in parallel as the
        -- interleaves bursts will be done in parallel.
        -----------------------------------------------------------------------
        process 
           variable SARSIZE  : integer ;
           variable SARLEN   : integer ;
           variable TEST     :  integer ; 
           variable outline1 : line;
        begin  
          -- WRITE_BURST_RES
                 SARSIZE             := 2;
                 SARLEN              := 7;
                 TEST                := 9;
                 WRITE_ID_TAG  <= "1010";
                 RESP_DATA     <= (others=>'1');
                 WRITE_BURST_RES  <= '1';
                 wait until WRITE_BURST_RES_DONE = '1';
                 WRITE_BURST_RES  <= '0';
                 compare_data(RESP_DATA,WR_DATA,SARSIZE,SARLEN);

          -- WRITE_BURST_RES
                 RESP_DATA     <= X"00000000111111112222222233333333444444445555555566666666777777778888888899999999aaaaaaaabbbbbbbbccccccccddddddddeeeeeeeeffffffff";
                 WRITE_ID_TAG  <= "1011";
                 WRITE_BURST_RES <= '1';
                 wait until WRITE_BURST_RES_DONE = '1';
                 WRITE_BURST_RES <= '0';
                 compare_data(RESP_DATA,WR_DATA,SARSIZE,SARLEN);
                 
          -- WRITE_BURST_RES
                 RESP_DATA     <= (others=>'1');
                 WRITE_ID_TAG  <= "1111";
                 WRITE_BURST_RES <= '1';
                 wait until WRITE_BURST_RES_DONE = '1';
                 WRITE_BURST_RES <= '0';
                 compare_data(RESP_DATA,WR_DATA,SARSIZE,SARLEN);

          -- WRITE_BURST_RES
                 RESP_DATA     <=  X"00000000111111112222222233333333444444445555555566666666777777778888888899999999aaaaaaaabbbbbbbbccccccccddddddddeeeeeeeeffffffff";
                 WRITE_ID_TAG  <= "0001";
                 WRITE_BURST_RES <= '1';
                 wait until WRITE_BURST_RES_DONE = '1';
                 WRITE_BURST_RES <= '0';
                 compare_data(RESP_DATA,WR_DATA,SARSIZE,SARLEN);
                 
          -- WRITE_BURST_RES
                 WRITE_ID_TAG  <= "0010";
                 WRITE_BURST_RES <= '1';
                 wait until WRITE_BURST_RES_DONE = '1';
                 WRITE_BURST_RES <= '0';
                 compare_data(RESP_DATA,WR_DATA,SARSIZE,SARLEN);
                wait until M_AXI_ACLK = '1';
                wait until M_AXI_ACLK = '1';
                wait until M_AXI_ACLK = '1';
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
                wait;
        end process;
        
    end;
