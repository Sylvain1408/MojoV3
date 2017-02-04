--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:54:35 06/11/2016
-- Design Name:   
-- Module Name:   E:/workspace/Mojo-Base-VHDL/ise_files/TbRamChain.vhd
-- Project Name:  Mojo-Base-VHDL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RamChain
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
 
ENTITY TbRamChain IS
END TbRamChain;
 
ARCHITECTURE behavior OF TbRamChain IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RamChain
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

 	--Outputs
   signal mcs_read : std_logic_vector(31 downto 0);
   signal mcs_ready : std_logic;
   signal led : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RamChain PORT MAP (
          clk => clk,
          mcs_addr => mcs_addr,
          mcs_read => mcs_read,
          mcs_write => mcs_write,
          mcs_byte_enable => mcs_byte_enable,
          mcs_ready => mcs_ready,
          mcs_rd_strobe => mcs_rd_strobe,
          mcs_wr_strobe => mcs_wr_strobe,
          mcs_addr_strobe => mcs_addr_strobe,
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
      wait for 105 ns;	

      wait for clk_period*10;

      -- insert stimulus here 
		mcs_addr <= X"00000008";
		mcs_write <= X"11223344";
		mcs_byte_enable <= "1111";
		mcs_addr_strobe <= '1';
		mcs_wr_strobe <= '1';
		
		wait for 10 ns;
		
		mcs_addr <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
		mcs_write <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
		mcs_byte_enable <= "XXXX";
		mcs_addr_strobe <= '0';
		mcs_wr_strobe <= '0';
		
		wait for 40 ns;
		
		mcs_addr <= X"00000004";
		mcs_write <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
		mcs_byte_enable <= "0000";
		mcs_addr_strobe <= '1';
		mcs_wr_strobe <= '0';
		mcs_rd_strobe <= '1';
		
		wait for 10 ns;
		
		mcs_addr <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
		mcs_write <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
		mcs_byte_enable <= "XXXX";
		mcs_addr_strobe <= '0';
		mcs_wr_strobe <= '0';
		mcs_rd_strobe <= '0';
		
		wait for 40 ns;
		
		mcs_addr <= X"00000004";
		mcs_write <= X"44332211";
		mcs_byte_enable <= "1111";
		mcs_addr_strobe <= '1';
		mcs_wr_strobe <= '1';
		
		wait for 10 ns;
		
		mcs_addr <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
		mcs_write <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
		mcs_byte_enable <= "XXXX";
		mcs_addr_strobe <= '0';
		mcs_wr_strobe <= '0';
		mcs_rd_strobe <= '0';
		
		wait for 40 ns;
		
		mcs_addr <= X"00000004";
		mcs_write <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
		mcs_byte_enable <= "0000";
		mcs_addr_strobe <= '1';
		mcs_wr_strobe <= '0';
		mcs_rd_strobe <= '1';
		
		wait for 10 ns;
		
		mcs_addr <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
		mcs_write <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
		mcs_byte_enable <= "XXXX";
		mcs_addr_strobe <= '0';
		mcs_wr_strobe <= '0';
		mcs_rd_strobe <= '0';
		
		wait for 40 ns;
		
		mcs_addr <= X"00000007";
		mcs_write <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
		mcs_byte_enable <= "1000";
		mcs_addr_strobe <= '1';
		mcs_wr_strobe <= '0';
		mcs_rd_strobe <= '1';
		

      wait;
   end process;

END;
