--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:38:48 06/10/2016
-- Design Name:   
-- Module Name:   E:/workspace/Mojo-Base-VHDL/ise_files/TbRamInterface.vhd
-- Project Name:  Mojo-Base-VHDL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ram_interface
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TbRamInterface IS
END TbRamInterface;
 
ARCHITECTURE behavior OF TbRamInterface IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ram_interface
    PORT(
         clk : IN  std_logic;
         mcs_addr : IN  std_logic_vector(31 downto 0);
         mcs_read : OUT  std_logic_vector(31 downto 0);
         mcs_write : IN  std_logic_vector(31 downto 0);
         mcs_byte_enable : IN  std_logic_vector(3 downto 0);
         mcs_ready : OUT  std_logic;
         mcs_rd_strobe : IN  std_logic;
         mcs_wr_strobe : IN  std_logic;
         mcs_addr_strobe : IN  std_logic;
         ram_addr : OUT  std_logic_vector(31 downto 0);
         ram_read : IN  std_logic_vector(31 downto 0);
         ram_write : OUT  std_logic_vector(31 downto 0);
         ram_byte_enable : OUT  std_logic_vector(3 downto 0);
         led : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal mcs_addr : std_logic_vector(31 downto 0) := (others => '0');
   signal mcs_write : std_logic_vector(31 downto 0) := (others => '0');
   signal mcs_byte_enable : std_logic_vector(3 downto 0) := (others => '0');
   signal mcs_rd_strobe : std_logic := '0';
   signal mcs_wr_strobe : std_logic := '0';
   signal mcs_addr_strobe : std_logic := '0';
   signal ram_read : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal mcs_read : std_logic_vector(31 downto 0);
   signal mcs_ready : std_logic;
   signal ram_addr : std_logic_vector(31 downto 0);
   signal ram_write : std_logic_vector(31 downto 0);
   signal ram_byte_enable : std_logic_vector(3 downto 0);
   signal led : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ram_interface PORT MAP (
          clk => clk,
          mcs_addr => mcs_addr,
          mcs_read => mcs_read,
          mcs_write => mcs_write,
          mcs_byte_enable => mcs_byte_enable,
          mcs_ready => mcs_ready,
          mcs_rd_strobe => mcs_rd_strobe,
          mcs_wr_strobe => mcs_wr_strobe,
          mcs_addr_strobe => mcs_addr_strobe,
          ram_addr => ram_addr,
          ram_read => ram_read,
          ram_write => ram_write,
          ram_byte_enable => ram_byte_enable,
          led => led
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;
		mcs_addr <= X"FFEEDDCC";
		mcs_write <= X"AABBCCDD";
		mcs_wr_strobe <= '1';
		mcs_addr_strobe <= '1';
		
		wait for 10 ns;
		
		mcs_wr_strobe <= '0';
		mcs_addr_strobe <= '0';
		
		wait for 20 ns;
		
		mcs_addr <= X"C0000000";
		mcs_rd_strobe <= '1';
		mcs_addr_strobe <= '1';
		ram_read <= X"11111111";
		
		wait for 20 ns;
		
		mcs_addr_strobe <= '0';
		mcs_rd_strobe <= '0';
		
      -- insert stimulus here 

      wait;
   end process;

END;
