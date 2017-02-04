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
use ieee.std_logic_1164.all;

library std;
use std.textio.all;

library work;
use work.all;

use work.cdn_axi4_example_tb_testbench.all;

entity cdn_axi4_example_tb is 
end entity; 


architecture rtl of cdn_axi4_example_tb is 
begin
    master_0:work.cdn_axi4_example_tb_testbench.cdn_axi4_master_bfm_wrap
    generic map (
        C_M_AXI_NAME                        => C_M_AXI_NAME                        , 
        C_M_AXI_DATA_WIDTH                  => C_M_AXI_DATA_WIDTH                  ,
        C_M_AXI_ADDR_WIDTH                  => C_M_AXI_ADDR_WIDTH                  ,
        C_M_AXI_ID_WIDTH                    => C_M_AXI_ID_WIDTH                    ,
        C_M_AXI_AWUSER_WIDTH                => C_M_AXI_AWUSER_WIDTH                ,
        C_M_AXI_ARUSER_WIDTH                => C_M_AXI_ARUSER_WIDTH                ,
        C_M_AXI_RUSER_WIDTH                 => C_M_AXI_RUSER_WIDTH                 ,
        C_M_AXI_WUSER_WIDTH                 => C_M_AXI_WUSER_WIDTH                 ,
        C_M_AXI_BUSER_WIDTH                 => C_M_AXI_BUSER_WIDTH                 ,
        C_INTERCONNECT_M_AXI_READ_ISSUING   => C_INTERCONNECT_M_AXI_READ_ISSUING   ,
        C_INTERCONNECT_M_AXI_WRITE_ISSUING  => C_INTERCONNECT_M_AXI_WRITE_ISSUING  ,
        C_M_AXI_EXCLUSIVE_ACCESS_SUPPORTED  => C_M_AXI_EXCLUSIVE_ACCESS_SUPPORTED  
    )
    port map    (
         M_AXI_ACLK      =>   M_AXI_ACLK      ,
         M_AXI_ARESETN   =>   M_AXI_ARESETN   ,
         M_AXI_AWID      =>   M_AXI_AWID      ,
         M_AXI_AWADDR    =>   M_AXI_AWADDR    ,
         M_AXI_AWLEN     =>   M_AXI_AWLEN     ,
         M_AXI_AWSIZE    =>   M_AXI_AWSIZE    ,
         M_AXI_AWBURST   =>   M_AXI_AWBURST   ,
         M_AXI_AWLOCK    =>   M_AXI_AWLOCK    ,
         M_AXI_AWCACHE   =>   M_AXI_AWCACHE   ,
         M_AXI_AWPROT    =>   M_AXI_AWPROT    ,
         M_AXI_AWREGION  =>   M_AXI_AWREGION  ,
         M_AXI_AWQOS     =>   M_AXI_AWQOS     ,
         M_AXI_AWUSER    =>   M_AXI_AWUSER    ,
         M_AXI_AWVALID   =>   M_AXI_AWVALID   ,
         M_AXI_AWREADY   =>   M_AXI_AWREADY   ,
         M_AXI_WDATA     =>   M_AXI_WDATA     ,
         M_AXI_WSTRB     =>   M_AXI_WSTRB     ,
         M_AXI_WLAST     =>   M_AXI_WLAST     ,
         M_AXI_WUSER     =>   M_AXI_WUSER     ,
         M_AXI_WVALID    =>   M_AXI_WVALID    ,
         M_AXI_WREADY    =>   M_AXI_WREADY    ,
         M_AXI_BID       =>   M_AXI_BID       ,
         M_AXI_BRESP     =>   M_AXI_BRESP     ,
         M_AXI_BVALID    =>   M_AXI_BVALID    ,
         M_AXI_BUSER     =>   M_AXI_BUSER     ,
         M_AXI_BREADY    =>   M_AXI_BREADY    ,
         M_AXI_ARID      =>   M_AXI_ARID      ,
         M_AXI_ARADDR    =>   M_AXI_ARADDR    ,
         M_AXI_ARLEN     =>   M_AXI_ARLEN     ,
         M_AXI_ARSIZE    =>   M_AXI_ARSIZE    ,
         M_AXI_ARBURST   =>   M_AXI_ARBURST   ,
         M_AXI_ARLOCK    =>   M_AXI_ARLOCK    ,
         M_AXI_ARCACHE   =>   M_AXI_ARCACHE   ,
         M_AXI_ARPROT    =>   M_AXI_ARPROT    ,
         M_AXI_ARREGION  =>   M_AXI_ARREGION  ,
         M_AXI_ARQOS     =>   M_AXI_ARQOS     ,
         M_AXI_ARUSER    =>   M_AXI_ARUSER    ,
         M_AXI_ARVALID   =>   M_AXI_ARVALID   ,
         M_AXI_ARREADY   =>   M_AXI_ARREADY   ,
         M_AXI_RID       =>   M_AXI_RID       ,
         M_AXI_RDATA     =>   M_AXI_RDATA     ,
         M_AXI_RRESP     =>   M_AXI_RRESP     ,
         M_AXI_RLAST     =>   M_AXI_RLAST     ,
         M_AXI_RUSER     =>   M_AXI_RUSER     ,
         M_AXI_RVALID    =>   M_AXI_RVALID    ,
         M_AXI_RREADY    =>   M_AXI_RREADY    ,
         MTESTCACHETYPE      =>  MTESTCACHETYPE      ,
         MTESTPROTECTIONTYPE =>  MTESTPROTECTIONTYPE ,
         MTESTREGION         =>  MTESTREGION         ,
         MTESTQOS            =>  MTESTQOS            ,
         MTESTAWUSER         =>  MTESTAWUSER         ,
         MTESTARUSER         =>  MTESTARUSER         ,
         MTESTBUSER          =>  MTESTBUSER          ,
         V_WUSER             =>  V_WUSER             ,
         WRITE_DONE          =>  WRITE_DONE          ,
         READ_DONE           =>  READ_DONE           ,
         MTESTID             =>  MTESTID             ,
         STESTID             =>  STESTID             ,
         MTESTADDR           =>  MTESTADDR           ,
         MTESTBURSTLENGTH    =>  MTESTBURSTLENGTH    ,
         BURST_SIZE_4_BYTES  =>  BURST_SIZE_4_BYTES  ,
         BURST_TYPE          =>  BURST_TYPE          ,
         LOCK_TYPE           =>  LOCK_TYPE           ,
         FOURBIT             =>  FOURBIT             ,
         THREEBIT            =>  THREEBIT            ,
         RD_DATA             =>  RD_DATA             ,
         WRITE_TASK          =>  WRITE_TASK          ,
         READ_TASK           =>  READ_TASK           ,
         WRITE_BURST_CONCURRENT  =>  WRITE_BURST_CONCURRENT  ,
         WRITE_BURST_CONCURRENT_DONE => WRITE_BURST_CONCURRENT_DONE ,
         MTESTDATASIZE       =>  MTESTDATASIZE       ,
         RESPONSE            =>  RESPONSE            ,
         VRESPONSE           =>  VRESPONSE           ,
         V_RUSER             =>  V_RUSER             ,
         TEST_DATA           => TEST_DATA            ,
         WRITE_DATA_TRANSFER_COMPLETE  =>  WRITE_DATA_TRANSFER_COMPLETE  , 
         WRITE_BURST_DATA_TRANSFER_GAP =>  WRITE_BURST_DATA_TRANSFER_GAP , 
         WRITE_BURST_DATA_TRANSFER_GAP_DONE =>  WRITE_BURST_DATA_TRANSFER_GAP_DONE , 
         GAP_DATA                      =>  M_GAP_DATA                        ,
         REPORT_STATUS                     =>  REPORT_STATUS ,
         REPORT_STATUS_DONE                =>  REPORT_STATUS_DONE,
         NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING => NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING
    );

    slave_0:work.cdn_axi4_example_tb_testbench.cdn_axi4_slave_bfm_wrap
    generic map (
        C_S_AXI_NAME                           =>C_S_AXI_NAME                           , 
        C_S_AXI_DATA_WIDTH                     =>C_S_AXI_DATA_WIDTH                     , 
        C_S_AXI_ADDR_WIDTH                     =>C_S_AXI_ADDR_WIDTH                     , 
        C_S_AXI_ID_WIDTH                       =>C_S_AXI_ID_WIDTH                       , 
        C_S_AXI_AWUSER_WIDTH                   =>C_S_AXI_AWUSER_WIDTH                   , 
        C_S_AXI_ARUSER_WIDTH                   =>C_S_AXI_ARUSER_WIDTH                   , 
        C_S_AXI_RUSER_WIDTH                    =>C_S_AXI_RUSER_WIDTH                    , 
        C_S_AXI_WUSER_WIDTH                    =>C_S_AXI_WUSER_WIDTH                    , 
        C_S_AXI_BUSER_WIDTH                    =>C_S_AXI_BUSER_WIDTH                    , 
        C_INTERCONNECT_S_AXI_READ_ACCEPTANCE   =>C_INTERCONNECT_S_AXI_READ_ACCEPTANCE   , 
        C_INTERCONNECT_S_AXI_WRITE_ACCEPTANCE  =>C_INTERCONNECT_S_AXI_WRITE_ACCEPTANCE  , 
        C_S_AXI_MEMORY_MODEL_MODE              =>C_S_AXI_MEMORY_MODEL_MODE              , 
        C_S_AXI_EXCLUSIVE_ACCESS_SUPPORTED     =>C_S_AXI_EXCLUSIVE_ACCESS_SUPPORTED     , 
        C_BASEADDR                             =>C_BASEADDR                             , 
        C_HIGHADDR                             =>C_HIGHADDR                              
    )
    port map    (
         S_AXI_ACLK      =>   S_AXI_ACLK      ,
         S_AXI_ARESETN   =>   S_AXI_ARESETN   ,
         S_AXI_AWID      =>   M_AXI_AWID      ,
         S_AXI_AWADDR    =>   M_AXI_AWADDR    ,
         S_AXI_AWLEN     =>   M_AXI_AWLEN     ,
         S_AXI_AWSIZE    =>   M_AXI_AWSIZE    ,
         S_AXI_AWBURST   =>   M_AXI_AWBURST   ,
         S_AXI_AWLOCK    =>   M_AXI_AWLOCK    ,
         S_AXI_AWCACHE   =>   M_AXI_AWCACHE   ,
         S_AXI_AWPROT    =>   M_AXI_AWPROT    ,
         S_AXI_AWREGION  =>   M_AXI_AWREGION  ,
         S_AXI_AWQOS     =>   M_AXI_AWQOS     ,
         S_AXI_AWUSER    =>   M_AXI_AWUSER    ,
         S_AXI_AWVALID   =>   M_AXI_AWVALID   ,
         S_AXI_AWREADY   =>   M_AXI_AWREADY   ,
         S_AXI_WDATA     =>   M_AXI_WDATA     ,
         S_AXI_WSTRB     =>   M_AXI_WSTRB     ,
         S_AXI_WLAST     =>   M_AXI_WLAST     ,
         S_AXI_WUSER     =>   M_AXI_WUSER     ,
         S_AXI_WVALID    =>   M_AXI_WVALID    ,
         S_AXI_WREADY    =>   M_AXI_WREADY    ,
         S_AXI_BID       =>   M_AXI_BID       ,
         S_AXI_BRESP     =>   M_AXI_BRESP     ,
         S_AXI_BVALID    =>   M_AXI_BVALID    ,
         S_AXI_BUSER     =>   M_AXI_BUSER     ,
         S_AXI_BREADY    =>   M_AXI_BREADY    ,
         S_AXI_ARID      =>   M_AXI_ARID      ,
         S_AXI_ARADDR    =>   M_AXI_ARADDR    ,
         S_AXI_ARLEN     =>   M_AXI_ARLEN     ,
         S_AXI_ARSIZE    =>   M_AXI_ARSIZE    ,
         S_AXI_ARBURST   =>   M_AXI_ARBURST   ,
         S_AXI_ARLOCK    =>   M_AXI_ARLOCK    ,
         S_AXI_ARCACHE   =>   M_AXI_ARCACHE   ,
         S_AXI_ARPROT    =>   M_AXI_ARPROT    ,
         S_AXI_ARREGION  =>   M_AXI_ARREGION  ,
         S_AXI_ARQOS     =>   M_AXI_ARQOS     ,
         S_AXI_ARUSER    =>   M_AXI_ARUSER    ,
         S_AXI_ARVALID   =>   M_AXI_ARVALID   ,
         S_AXI_ARREADY   =>   M_AXI_ARREADY   ,
         S_AXI_RID       =>   M_AXI_RID       ,
         S_AXI_RDATA     =>   M_AXI_RDATA     ,
         S_AXI_RRESP     =>   M_AXI_RRESP     ,
         S_AXI_RLAST     =>   M_AXI_RLAST     ,
         S_AXI_RUSER     =>   M_AXI_RUSER     ,
         S_AXI_RVALID    =>   M_AXI_RVALID    ,
         S_AXI_RREADY    =>   M_AXI_RREADY    ,
         WRITE_ID_TAG    =>   WRITE_ID_TAG, 
         WR_DATA         =>   WR_DATA,  
         READ_ID_TAG     =>   READ_ID_TAG, 
         ERROR_VRESPONSE   => ERROR_VRESPONSE,
         RESP_DATA       =>   RESP_DATA, 
         WRITE_BURST_RES =>   WRITE_BURST_RES, 
         READ_BURST_RES  =>   READ_BURST_RES,
         WRITE_BURST_RESP_CTRL      =>  WRITE_BURST_RESP_CTRL      ,
         WRITE_BURST_RESP_CTRL_DONE =>  WRITE_BURST_RESP_CTRL_DONE ,
         READ_BURST_RESP_CTRL      =>  READ_BURST_RESP_CTRL      ,
         READ_BURST_RESP_CTRL_DONE =>  READ_BURST_RESP_CTRL_DONE ,
         RESPONSE_TYPE              =>  RESPONSE_TYPE              ,
         WRITE_BURST_RES_DONE=> WRITE_BURST_RES_DONE, 
         READ_BURST_RES_DONE=>  READ_BURST_RES_DONE,
         STESTBUSER      =>   STESTBUSER, 
         STESTDATASIZE   =>   STESTDATASIZE, 
         S_V_WUSER       =>   S_V_WUSER,
         S_V_RUSER       =>   S_V_RUSER,
         PENDING_TRANSACTIONS_COUNT =>           PENDING_TRANSACTIONS_COUNT,
         SET_READ_BURST_DATA_TRANSFER_GAP  =>    SET_READ_BURST_DATA_TRANSFER_GAP,
         SET_READ_BURST_DATA_TRANSFER_GAP_DONE  =>    SET_READ_BURST_DATA_TRANSFER_GAP_DONE,
         SET_WRITE_RESPONSE_GAP => SET_WRITE_RESPONSE_GAP,
         READ_DATA_TRANSFER_COMPLETE => READ_DATA_TRANSFER_COMPLETE,
         GAP_DATA              =>  GAP_DATA,
         SET_READ_RESPONSE_GAP  => SET_READ_RESPONSE_GAP ,
         REPORT_STATUS                       =>  S_REPORT_STATUS                      ,
         REPORT_STATUS_DONE                  =>  S_REPORT_STATUS_DONE                 ,
         NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING => S_NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING
        );
           -- Master BFM clock Generation
           process begin
            wait for (clk_per/2);
            M_AXI_ACLK <= not M_AXI_ACLK;
            end process;
            
           -- Slave BFM clock Generation
            process begin
            wait for (clk_per/2);
            S_AXI_ACLK <= not S_AXI_ACLK;
            end process;

           -- Master Reset 
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
         
           -- Slave Reset 
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
            V_RUSER   <= (others => '0');
            V_WUSER   <= (others => '0');
            S_V_RUSER <= (others => '0');
            S_V_WUSER <= (others => '0');
            wait;
            end process;
           -----------------------------------------------------------------------
           -- EXAMPLE TEST 5:
           -- Unaligned write and read transfers example.
           -- DESCRIPTION:
           -- The following master code does:
           -- 1 of each write and read unaligned FIXED transfers
           -- 1 of each write and read unaligned INCR transfers
           -- NOTE: The slave does not model memory so the data might look wrong
           -- but the slave BFM has checked that the strobes are right.
           -- Also, a wrapping burst must have an address which is aligned to the
           -- burst size thus it is not possible to have an unaligned wrapping 
           -- burst unless it is also a narrow transfer.
           -----------------------------------------------------------------------
            process 
              variable check_resp : std_logic_vector (1 downto 0);
              variable ARSIZE  : integer ;
              variable ARLEN   : integer ;
              begin

                   MTESTADDR           <= "00000000000000000000000000000001"; 
                   MTESTID             <= "0010";
                   MTESTBURSTLENGTH(1 downto 0)   <= "01";
                   BURST_SIZE_4_BYTES  <= "0000"; 
                   BURST_TYPE          <= "00";
                   LOCK_TYPE           <= '0';
                   MTESTCACHETYPE      <= '0';
                   MTESTPROTECTIONTYPE <= '0';
                   MTESTDATASIZE       <= "10000000000";
                   MTESTREGION         <= '0';
                   MTESTQOS            <= '0';
                   MTESTAWUSER         <= '0';
                   MTESTARUSER         <= '0';
                   MTESTBUSER          <= '0';
                   TEST_DATA            <=  (others => '1');
                   LEN                  <= 1  ; 
                   ARSIZE               := 0;
                   ARLEN                := 1;
                -- Burst type FIX
                --WRITE 
                   WRITE_TASK <= '1';
				  		     wait until WRITE_DONE = '1';
				  		     WRITE_TASK <= '0';
                   wait until M_AXI_ACLK = '1';
                   check_resp := RESPONSE;
                   check_response_okay(check_resp) ;
               --READ
                   STESTID <= MTESTID+1;
                   READ_TASK <= '1';
				  		     wait until READ_DONE = '1';
				  		     READ_TASK <= '0';
                   CHECK_RESPONSE_VECTOR_OKAY(VRESPONSE,LEN);
                   compare_data(TEST_DATA,RD_DATA,ARSIZE,ARLEN);
                   COMPARE_RUSER(S_V_RUSER,V_RUSER,ARLEN);
               -- Burst type INC
               -- WRITE 
                   MTESTADDR              <= "00000000000000000000000000000010"; 
                   MTESTID                <= "0100";
                   BURST_TYPE             <= "01";
                   TEST_DATA              <=  (others => '0');
                   TEST_DATA(511 downto 0) <= X"00000000111111112222222233333333444444445555555566666666777777778888888899999999AAAAAAAABBBBBBBBCCCCCCCCDDDDDDDDEEEEEEEEFFFFFFFF";
                   WRITE_TASK <= '1';
				  		     wait until WRITE_DONE = '1';
				  		     WRITE_TASK <= '0';
                   wait until M_AXI_ACLK = '1';
                   check_resp := RESPONSE;
                   check_response_okay(check_resp) ;
               --READ
                   STESTID <= MTESTID+1;
                   READ_TASK <= '1';
				  		     wait until READ_DONE= '1';
				  		     READ_TASK <= '0';
                   CHECK_RESPONSE_VECTOR_OKAY(VRESPONSE,LEN);
                   compare_data(TEST_DATA,RD_DATA,ARSIZE,ARLEN);
                   COMPARE_RUSER(S_V_RUSER,V_RUSER,ARLEN);
              wait;
            end process;
            -----------------------------------------------------------------------
            -- EXAMPLE TEST 5:
            -- Unaligned write and read transfers example.
            -- DESCRIPTION:
            -- The following slave code automatically checks the unaligned 
            -- transfers and stobes and provides responses.
            -- Please note that the response data used here would not be the data
            -- expected from a memory.
            -----------------------------------------------------------------------
           process 
             variable SARSIZE  : integer ;
             variable SARLEN   : integer ;
             variable TEST     :  integer ; 
             variable outline1 : line;
           begin
              wait until M_AXI_ACLK = '1';
              SARSIZE             := 0;
              SARLEN              := 1;
              TEST                := 5;
            -- WRITE BURST
              RESP_DATA                 <=  (others => '1');
              STESTBUSER                <= '0';
              S_V_WUSER                 <= (others => '0');
              WRITE_ID_TAG              <= "0010";
              WRITE_BURST_RES           <= '1';
              wait until WRITE_BURST_RES_DONE = '1';
              WRITE_BURST_RES           <= '0';
              compare_data(RESP_DATA,WR_DATA,SARSIZE,SARLEN);
              COMPARE_WUSER(S_V_WUSER,V_WUSER,SARLEN);
           -- READ
              READ_ID_TAG <= WRITE_ID_TAG+1;
              READ_BURST_RES  <= '1';
              wait until READ_BURST_RES_DONE = '1';
              READ_BURST_RES           <= '0';
           -- WRITE BURST
              RESP_DATA              <=  (others => '0');
              RESP_DATA(511 downto 0) <= X"00000000111111112222222233333333444444445555555566666666777777778888888899999999AAAAAAAABBBBBBBBCCCCCCCCDDDDDDDDEEEEEEEEFFFFFFFF";
              WRITE_ID_TAG              <= "0100";
              WRITE_BURST_RES           <= '1';
              wait until WRITE_BURST_RES_DONE = '1';
              WRITE_BURST_RES           <= '0';
              compare_data(RESP_DATA,WR_DATA,SARSIZE,SARLEN);
              COMPARE_WUSER(S_V_WUSER,V_WUSER,SARLEN);
           -- READ
              READ_ID_TAG <= WRITE_ID_TAG+1;
              READ_BURST_RES  <= '1';
              wait until READ_BURST_RES_DONE = '1';
              READ_BURST_RES           <= '0';
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
              wait until M_AXI_ACLK = '1';
              wait until M_AXI_ACLK = '1';
              stop_simulation;
              wait;
            end process;

end;
