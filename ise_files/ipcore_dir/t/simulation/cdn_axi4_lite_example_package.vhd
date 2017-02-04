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


package cdn_axi4_lite_example_tb_testbench is

     constant C_M_AXI_LITE_NAME                            : string  :=  "MASTER_0";
     constant C_M_AXI_LITE_DATA_WIDTH                      : integer := 32;
     constant C_M_AXI_LITE_ADDR_WIDTH                      : integer := 32;
     constant C_INTERCONNECT_M_AXI_LITE_READ_ISSUING       : integer := 8;
     constant C_INTERCONNECT_M_AXI_LITE_WRITE_ISSUING      : integer := 8;
     constant C_S_AXI_LITE_NAME                            : string  := "SLAVE_0";
     constant C_S_AXI_LITE_DATA_WIDTH                      : integer := 32;
     constant C_S_AXI_LITE_ADDR_WIDTH                      : integer := 32;
     constant C_INTERCONNECT_S_AXI_LITE_READ_ACCEPTANCE    : integer := 8;
     constant C_INTERCONNECT_S_AXI_LITE_WRITE_ACCEPTANCE   : integer := 8;
     constant C_S_AXI_LITE_MEMORY_MODEL_MODE               : integer := 0;
     constant C_BASEADDR                                   : integer := 0;
     constant C_HIGHADDR                                   : integer := 0;
     constant C_S_AXI_LITE_SLAVE_MEM_SIZE                  : integer := 4096 ;
     constant RESP_BUS_WIDTH                               : integer := 2 ;
     constant CLK_PER                                      : time    :=  20 ns; 

      -- Internal Signals for Master and Slave  
     signal M_AXI_LITE_ACLK      : std_logic                                                := '0';
     signal M_AXI_LITE_ARESETN   : std_logic                                                := '0';
     signal M_AXI_LITE_AWADDR    : std_logic_vector(C_M_AXI_LITE_ADDR_WIDTH-1 downto 0)     ;
     signal M_AXI_LITE_AWPROT    : std_logic_vector(2 downto 0)                             ;
     signal M_AXI_LITE_AWVALID   : std_logic                                                ;
     signal M_AXI_LITE_AWREADY   : std_logic                                                ;
     signal M_AXI_LITE_WDATA     : std_logic_vector(C_M_AXI_LITE_DATA_WIDTH-1 downto 0)     ;
     signal M_AXI_LITE_WSTRB     : std_logic_vector(3 downto 0) ;
     signal M_AXI_LITE_WVALID    : std_logic                                                ;
     signal M_AXI_LITE_WREADY    : std_logic                                                ;
     signal M_AXI_LITE_BRESP     : std_logic_vector(1 downto 0)                             ;
     signal M_AXI_LITE_BVALID    : std_logic                                                ;
     signal M_AXI_LITE_BREADY    : std_logic                                                ;
     signal M_AXI_LITE_ARADDR    : std_logic_vector (C_M_AXI_LITE_ADDR_WIDTH-1 downto 0)    ;
     signal M_AXI_LITE_ARPROT    : std_logic_vector (2 downto 0)                            ;
     signal M_AXI_LITE_ARVALID   : std_logic                                                ;
     signal M_AXI_LITE_RDATA     : std_logic_vector(C_M_AXI_LITE_DATA_WIDTH-1 downto 0)     ;
     signal M_AXI_LITE_RVALID    : std_logic                                                ;
     signal M_AXI_LITE_RREADY    : std_logic                                                ;
     signal M_AXI_LITE_ARREADY   : std_logic                                                ;
     signal M_AXI_LITE_RRESP     : std_logic_vector(1 downto 0)                                ;
     signal MTESTADDRESS                  :  std_logic_vector(C_M_AXI_LITE_ADDR_WIDTH-1 downto 0) ;
     signal MTESTPROTECTION               :  std_logic_vector(2 downto 0)                         ;
     signal TEST_DATA                     :  std_logic_vector(C_M_AXI_LITE_DATA_WIDTH-1 downto 0) := (others=>'0');
     signal RD_DATA                       :  std_logic_vector(C_M_AXI_LITE_DATA_WIDTH-1 downto 0) ;
     signal RESPONSE                      :  std_logic_vector(RESP_BUS_WIDTH-1 downto 0)          ;
     signal SLAVERESPONSE                      :  std_logic_vector(RESP_BUS_WIDTH-1 downto 0)     := (others=>'0');
     signal MTESTDATASIZE                 :  std_logic_vector(11 downto 0)                         ;
     signal WRITE_BURST                   :  std_logic                                             ;
     signal READ_BURST                    :  std_logic                                             ;
     signal WRITE_BURST_DONE              :  std_logic                                             ;
     signal READ_BURST_DONE               :  std_logic                                             ;
     signal WRITE_BURST_CONCURRENT        :  std_logic                                             ;
     signal WRITE_BURST_CONCURRENT_DONE   :  std_logic                                             ;
     signal WRITE_BURST_DATA_FIRST        :  std_logic                                             ;
     signal WRITE_BURST_DATA_FIRST_DONE   :  std_logic                                             ;
     signal S_AXI_LITE_ACLK                  :  std_logic                                          := '0' ;    
     signal S_AXI_LITE_ARESETN               :  std_logic                                          := '0' ;
     signal WRITE_ID_TAG                     :  std_logic_vector(C_M_AXI_LITE_ADDR_WIDTH-1 downto 0)  ;
     signal READ_ID_TAG                      :  std_logic_vector(C_M_AXI_LITE_ADDR_WIDTH-1 downto 0)  ;
     signal RESP_DATA                        :  std_logic_vector(C_S_AXI_LITE_DATA_WIDTH-1 downto 0)  ;
     signal WRITE_BURST_RES                  :  std_logic                                             ;
     signal READ_BURST_RES                   :  std_logic                                             ;
     signal SET_READ_BURST_DATA_TRANSFER_GAP :  std_logic                                             ;
     signal SET_WRITE_RESPONSE_GAP           :  std_logic                                             ;
     signal SET_READ_RESPONSE_GAP            :  std_logic                                             ;
     signal GAP_DATA                         :  std_logic_vector(3 downto 0)                          := (others=>'0');
     signal ADDRVALID                        :  std_logic                                             ;
     signal WRITE_BURST_RESP_CTRL            :  std_logic                                             ;
     signal READ_BURST_RESP_CTRL             :  std_logic                                             ;
     signal WRITE_BURST_RESP_CTRL_DONE       :  std_logic                                             ;
     signal READ_BURST_RESP_CTRL_DONE        :  std_logic                                             ;
     signal ERROR_RESPONSE                   :  std_logic_vector(RESP_BUS_WIDTH-1 downto 0)           ;
     signal PENDING_TRANSACTIONS_COUNT       :  std_logic_vector(3 downto 0)                          ;
     signal STESTDATASIZE                    :  std_logic_vector(2 downto 0)                          ;
     signal WR_DATA                          :  std_logic_vector(C_S_AXI_LITE_DATA_WIDTH-1 downto 0)  ;
     signal WRITE_BURST_RES_DONE             :  std_logic                                             ;
     signal READ_BURST_RES_DONE              :  std_logic                                             ;
     signal DONE                             :  std_logic                                             ;
     signal REPORT_STATUS                     : std_logic    ;
     signal REPORT_STATUS_DONE                : std_logic    ;
     signal NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING : std_logic;
     signal S_REPORT_STATUS                     : std_logic    := '0' ;
     signal S_REPORT_STATUS_DONE                : std_logic    ;
     signal S_NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING : std_logic;
     
     signal   M_NO_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING : std_logic := '0';
     signal   S_NO_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING : std_logic := '0';

   -- REPORT_MASTER_STATUS
   PROCEDURE  REPORT_MASTER_STATUS (signal NO_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING : IN std_logic;
                                    variable test                                     : IN integer) ;
   -- REPORT_SLAVE_STATUS
   PROCEDURE  REPORT_SLAVE_STATUS (signal NO_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING : IN std_logic;
                                   variable test                                     : IN integer) ;

   PROCEDURE CHECK_RESPONSE_OKAY(signal check_resp : IN std_logic_vector (RESP_BUS_WIDTH-1 downto 0));
   PROCEDURE STOP_SIMULATION;
   PROCEDURE COMPARE_DATA (signal WR_DATA : IN std_logic_vector (C_S_AXI_LITE_DATA_WIDTH-1 downto 0);
                           signal RD_DATA : IN std_logic_vector (C_S_AXI_LITE_DATA_WIDTH-1 downto 0));

   component cdn_axi4_lite_master_bfm_wrap is
    generic(
         C_M_AXI_LITE_NAME                      : string  :=  "MASTER_0";
         C_M_AXI_LITE_DATA_WIDTH                : integer := 32;
         C_M_AXI_LITE_ADDR_WIDTH                : integer := 32;
         C_INTERCONNECT_M_AXI_LITE_READ_ISSUING : integer := 8;
         C_INTERCONNECT_M_AXI_LITE_WRITE_ISSUING: integer := 8
        );
    port(
         M_AXI_LITE_ACLK      : in  std_logic                                                ;
         M_AXI_LITE_ARESETN   : in  std_logic                                                ;
         M_AXI_LITE_AWADDR    : out std_logic_vector(C_M_AXI_LITE_ADDR_WIDTH-1 downto 0)     ;  -- Master Write address. 
         M_AXI_LITE_AWPROT    : out std_logic_vector(2 downto 0)                             ;  -- Master Protection type.
         M_AXI_LITE_AWVALID   : out std_logic                                                ; -- Master Write address valid.
         M_AXI_LITE_AWREADY   : in  std_logic                                                ; -- Slave Write address ready.
         M_AXI_LITE_WDATA     : out std_logic_vector(C_M_AXI_LITE_DATA_WIDTH-1 downto 0)     ;   -- Master Write data.
         M_AXI_LITE_WSTRB     : out std_logic_vector(3 downto 0)                             ;   -- Master Write strobes.
         M_AXI_LITE_WVALID    : out std_logic                                                ;  -- Master Write valid.
         M_AXI_LITE_WREADY    : in  std_logic                                                ;  -- Slave Write ready.
         M_AXI_LITE_BRESP     : in  std_logic_vector(RESP_BUS_WIDTH-1 downto 0)              ;   -- Slave Write response.
         M_AXI_LITE_BVALID    : in  std_logic                                                ;  -- Slave Write response valid. 
         M_AXI_LITE_BREADY    : out std_logic                                                ;  -- Master Response ready.
         M_AXI_LITE_ARADDR    : out std_logic_vector (C_M_AXI_LITE_ADDR_WIDTH-1 downto 0)    ;  -- Master Read address.
         M_AXI_LITE_ARPROT    : out std_logic_vector (2 downto 0)                            ;  -- Master Protection type.
         M_AXI_LITE_ARVALID   : out std_logic                                                ; -- Master Read address valid.
         M_AXI_LITE_RDATA     : in  std_logic_vector(C_M_AXI_LITE_DATA_WIDTH-1 downto 0)     ;   -- Slave Read data.
         M_AXI_LITE_RVALID    : in  std_logic                                                ;  -- Slave Read valid.
         M_AXI_LITE_RREADY    : out std_logic                                                ; -- Master Read ready.
         M_AXI_LITE_ARREADY   : in  std_logic                                                ; 
         M_AXI_LITE_RRESP     : in  std_logic_vector(RESP_BUS_WIDTH-1 downto 0)              ;
         MTESTADDRESS                  : in   std_logic_vector(C_M_AXI_LITE_ADDR_WIDTH-1 downto 0)           ;
         MTESTPROTECTION               : in   std_logic_vector(2 downto 0)                                   ;
         TEST_DATA                     : in   std_logic_vector(C_M_AXI_LITE_DATA_WIDTH-1 downto 0)           ;
         RD_DATA                       : out  std_logic_vector(C_M_AXI_LITE_DATA_WIDTH-1 downto 0)           ;
         RESPONSE                      : out  std_logic_vector(RESP_BUS_WIDTH-1 downto 0)                    ;
         MTESTDATASIZE                 : in   std_logic_vector(11 downto 0)                                   ;
         WRITE_BURST                   : in   std_logic                                               ;
         READ_BURST                    : in   std_logic                                               ;
         WRITE_BURST_DONE              : out  std_logic                                               ;
         READ_BURST_DONE               : out  std_logic                                               ;
         WRITE_BURST_CONCURRENT        : in   std_logic                                               ;
         WRITE_BURST_CONCURRENT_DONE   : out  std_logic                                               ;
         WRITE_BURST_DATA_FIRST        : in   std_logic                                               ;
         WRITE_BURST_DATA_FIRST_DONE   : out  std_logic                                               ;
         REPORT_STATUS                     : in  std_logic    ;
         REPORT_STATUS_DONE                : out std_logic    ;
         NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING : out std_logic
    );
    end component;
    
component cdn_axi4_lite_slave_bfm_wrap is
    generic(
         C_S_AXI_LITE_NAME                          : string  := "SLAVE_0";
         C_S_AXI_LITE_DATA_WIDTH                    : integer := 32;
         C_S_AXI_LITE_ADDR_WIDTH                    : integer := 32;
         C_INTERCONNECT_S_AXI_LITE_READ_ACCEPTANCE  : integer := 8;
         C_INTERCONNECT_S_AXI_LITE_WRITE_ACCEPTANCE : integer := 8;
         C_S_AXI_LITE_MEMORY_MODEL_MODE             : integer := 0;
         C_BASEADDR                                 : integer := 0;
         C_HIGHADDR                                 : integer := 0;
         C_S_AXI_LITE_SLAVE_MEM_SIZE                : integer := 4096
    );
    port(
         S_AXI_LITE_ACLK                  : in   std_logic                                             ;    
         S_AXI_LITE_ARESETN               : in   std_logic                                             ;
         S_AXI_LITE_AWADDR                : in   std_logic_vector(C_S_AXI_LITE_ADDR_WIDTH-1 downto 0)  ;  
         S_AXI_LITE_AWPROT                : in   std_logic_vector(2 downto 0)                          ;  
         S_AXI_LITE_AWVALID               : in   std_logic                                             ;  
         S_AXI_LITE_AWREADY               : out  std_logic                                             ;  
         S_AXI_LITE_WDATA                 : in   std_logic_vector(C_S_AXI_LITE_DATA_WIDTH-1 downto 0)  ;  
         S_AXI_LITE_WSTRB                 : in   std_logic_vector((C_S_AXI_LITE_DATA_WIDTH/8)-1 downto 0)     ;  
         S_AXI_LITE_WVALID                : in   std_logic                                             ;  
         S_AXI_LITE_WREADY                : out  std_logic                                             ;  
         S_AXI_LITE_BRESP                 : out  std_logic_vector(RESP_BUS_WIDTH-1 downto 0)                          ;  
         S_AXI_LITE_BVALID                : out  std_logic                                             ;  
         S_AXI_LITE_BREADY                : in   std_logic                                             ;  
         S_AXI_LITE_ARADDR                : in   std_logic_vector(C_S_AXI_LITE_ADDR_WIDTH-1 downto 0)  ;  
         S_AXI_LITE_ARPROT                : in   std_logic_vector(2 downto 0)                          ;  
         S_AXI_LITE_ARVALID               : in   std_logic                                             ;  
         S_AXI_LITE_ARREADY               : out  std_logic                                             ;  
         S_AXI_LITE_RDATA                 : out  std_logic_vector(C_S_AXI_LITE_DATA_WIDTH-1 downto 0)  ;  
         S_AXI_LITE_RRESP                 : out  std_logic_vector(RESP_BUS_WIDTH-1 downto 0)                	         ; 
         S_AXI_LITE_RVALID                : out  std_logic                                             ;  
         S_AXI_LITE_RREADY                : in   std_logic                                             ;  
         WRITE_ID_TAG                     : in   std_logic_vector(C_M_AXI_LITE_ADDR_WIDTH-1 downto 0)                          ;
         READ_ID_TAG                      : in   std_logic_vector(C_M_AXI_LITE_ADDR_WIDTH-1 downto 0)                          ;
         RESP_DATA                        : in   std_logic_vector(C_S_AXI_LITE_DATA_WIDTH-1 downto 0)  ;
         WRITE_BURST_RES                  : in   std_logic                                              ;
         READ_BURST_RES                   : in   std_logic                                              ;
         SET_READ_BURST_DATA_TRANSFER_GAP : in   std_logic                                              ;
         SET_WRITE_RESPONSE_GAP           : in   std_logic                                              ;
         SET_READ_RESPONSE_GAP            : in   std_logic                                              ;
         GAP_DATA                         : in   std_logic_vector(3 downto 0)                           ;
         ADDRVALID                        : in   std_logic                                              ;
         WRITE_BURST_RESP_CTRL            : in   std_logic                                              ;
         READ_BURST_RESP_CTRL             : in   std_logic                                              ;
         RESPONSE                    : in   std_logic_vector(RESP_BUS_WIDTH-1 downto 0)            ;
         WRITE_BURST_RESP_CTRL_DONE       : out  std_logic                                              ;
         READ_BURST_RESP_CTRL_DONE        : out  std_logic                                              ;
         ERROR_RESPONSE                   : in  std_logic_vector(RESP_BUS_WIDTH-1 downto 0)            ;
         PENDING_TRANSACTIONS_COUNT       : out  std_logic_vector(3 downto 0)                           ;
         STESTDATASIZE                    : out  std_logic_vector(2 downto 0)                           ;
         WR_DATA                          : out  std_logic_vector(C_S_AXI_LITE_DATA_WIDTH-1 downto 0)   ;
         WRITE_BURST_RES_DONE             : out  std_logic                                              ;
         READ_BURST_RES_DONE              : out  std_logic                                               ;
         REPORT_STATUS                       : in  std_logic    ;
         REPORT_STATUS_DONE                  : out std_logic    ;
         NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING : out std_logic
     );
end component;

 
end;


package body cdn_axi4_lite_example_tb_testbench is


PROCEDURE CHECK_RESPONSE_OKAY(signal check_resp : IN std_logic_vector (RESP_BUS_WIDTH-1 downto 0)) IS
       variable outline1 : line;
   BEGIN

   IF response /= "00" THEN
        REPORT "Uacceptable values... Wrong Response";
        RETURN; -- Exit the procedure
   ELSE 
        write(outline1, string'("***********************  MASTER TO SLAVE RESPONSE VALUE :: PASS ******************************"));
        write(outline1, response);
        writeline(output,outline1);
   END IF;

END PROCEDURE Check_response_okay;

PROCEDURE COMPARE_DATA (signal wr_data : IN std_logic_vector (C_S_AXI_LITE_DATA_WIDTH-1 downto 0);
                        signal rd_data : IN std_logic_vector (C_S_AXI_LITE_DATA_WIDTH-1 downto 0)) IS
       variable outline2 : line;
   BEGIN
   write(outline2, string'("***********************  FUNCTION COMPARE DATA  ******************************"));
   writeline(output,outline2);
   
   IF wr_data /= rd_data THEN
        REPORT "Write data and Read data have not matched ... DATA MISMATCH .... ";
        write(outline2, wr_data);
        write(outline2, string'(" ============="));
        write(outline2, rd_data);
        write(outline2, string'(" ============="));
        writeline(output,outline2);
        RETURN; -- Exit the procedure
   ELSE 
        write(outline2, string'("******************************************************************************************"));
        writeline(output,outline2);
        write(outline2, string'("***********************   READ AND WRITE DATA MATCH :: PASS  ******************************"));
        writeline(output,outline2);
        write(outline2, string'("******************************************************************************************"));
        writeline(output,outline2);
   END IF;

END PROCEDURE COMPARE_DATA ;
 
PROCEDURE stop_simulation is
      begin
      wait for 100 ns;
      assert false report "simulation ended" severity failure;
end stop_simulation ;

PROCEDURE print_data ( signal SLAVE_FINISHED : IN std_logic_vector (3 downto 0)) IS
					 variable outline_tr : line;
   BEGIN
              write(outline_tr, string'("##============================================ ::"));
              write(outline_tr, string'("  EXAMPLE TEST  :: "));
              write(outline_tr, SLAVE_FINISHED);
              write(outline_tr, string'("  FINISHED WITH SLAVE ID :: "));
              write(outline_tr, SLAVE_FINISHED);
              write(outline_tr, string'("============================================ ::"));
              writeline(output,outline_tr);
	 END 
PROCEDURE print_data;
--------------------------------------------------------------------------
-- TEST BENCH LEVEL API: REPORT_MASTER_STATUS
--------------------------------------------------------------------------
-- Description:
-- REPORT_MASTER_STATUS(number_of_expected_errors_warnings_and_pending)
-- This task calls the masters report_status function which returns the 
-- total of the errors + warnings + pending counters. This return number 
-- is compared with the input 
-- number_of_expected_errors_warnings_and_pending
--------------------------------------------------------------------------
PROCEDURE REPORT_MASTER_STATUS (signal NO_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING : IN std_logic;
                                variable test                                     : IN integer ) IS 
       variable outline1 : line;
BEGIN
   If NO_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING /= NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING THEN
        write(outline1, string'("---------------------------------------------------------------"));
        writeline(output,outline1);
        write(outline1, string'("EXAMPLE TEST "));
        write(outline1, test);
        write(outline1, string'("  : MASTER FAILED"));
        writeline(output,outline1);
        write(outline1, string'("---------------------------------------------------------------"));
        writeline(output,outline1);

        write(outline1, string'("---------------------------------------------------------------"));
        writeline(output,outline1);
        write(outline1, string'(" EXPECTED  : "));
        write(outline1, NO_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING);
        writeline(output,outline1);
        write(outline1, string'(" ACTUAL (MASTER) : "));
        write(outline1, NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING);
        writeline(output,outline1);
        write(outline1, string'("---------------------------------------------------------------"));
        writeline(output,outline1);
   ELSE 
        write(outline1, string'("---------------------------------------------------------------"));
        writeline(output,outline1);
        write(outline1, string'("EXAMPLE TEST "));
        write(outline1, test);
        write(outline1, string'("  : MASTER PASSED"));
        writeline(output,outline1);
        write(outline1, string'("---------------------------------------------------------------"));
        writeline(output,outline1);

   END IF;

END PROCEDURE REPORT_MASTER_STATUS;

--------------------------------------------------------------------------
-- TEST BENCH LEVEL API: REPORT_SLAVE_STATUS
--------------------------------------------------------------------------
-- Description:
-- REPORT_SLAVE_STATUS(number_of_expected_errors_warnings_and_pending)
-- This task calls the slaves report_status function which returns the 
-- total of the errors + warnings + pending counters. This return number 
-- is compared with the input 
-- number_of_expected_errors_warnings_and_pending
--------------------------------------------------------------------------
PROCEDURE REPORT_SLAVE_STATUS (signal NO_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING : IN std_logic;
                                variable test                                     : IN integer ) IS 
       variable outline1 : line;
BEGIN
   If NO_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING /= S_NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING THEN
        write(outline1, string'("---------------------------------------------------------------"));
        writeline(output,outline1);
        write(outline1, string'("EXAMPLE TEST "));
        write(outline1, test);
        write(outline1, string'("  : SLAVE FAILED"));
        writeline(output,outline1);
        write(outline1, string'("---------------------------------------------------------------"));
        writeline(output,outline1);

        write(outline1, string'("---------------------------------------------------------------"));
        writeline(output,outline1);
        write(outline1, string'(" EXPECTED  : "));
        write(outline1, NO_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING);
        writeline(output,outline1);
        write(outline1, string'(" ACTUAL (MASTER) : "));
        write(outline1, S_NUMBER_OF_EXPECTED_ERRORS_WARNINGS_AND_PENDING);
        writeline(output,outline1);
        write(outline1, string'("---------------------------------------------------------------"));
        writeline(output,outline1);
   ELSE 
        write(outline1, string'("---------------------------------------------------------------"));
        writeline(output,outline1);
        write(outline1, string'("EXAMPLE TEST "));
        write(outline1, test);
        write(outline1, string'("  : SLAVE PASSED"));
        writeline(output,outline1);
        write(outline1, string'("---------------------------------------------------------------"));
        writeline(output,outline1);

   END IF;

END PROCEDURE REPORT_SLAVE_STATUS;
--------------------------------------------------------------------------
end package body;

