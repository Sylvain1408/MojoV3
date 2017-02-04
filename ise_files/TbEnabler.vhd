--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:15:09 05/15/2016
-- Design Name:   
-- Module Name:   C:/Users/Sylvain/Desktop/Mojo-Base-VHDL/ise_files/TbEnabler.vhd
-- Project Name:  Mojo-Base-VHDL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Module_register_signals
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
 
ENTITY TbEnabler IS
END TbEnabler;
 
ARCHITECTURE behavior OF TbEnabler IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Module_register_signals
    PORT(
         clk : IN  std_logic;
         ram_addr : IN  std_logic_vector(31 downto 0);
         ram_read : IN  std_logic_vector(31 downto 0);
         byte_enable_a : IN  std_logic_vector(3 downto 0);
         led : OUT  std_logic_vector(7 downto 0);
         enable_i2c : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal ram_addr : std_logic_vector(31 downto 0) := (others => '0');
   signal ram_read : std_logic_vector(31 downto 0) := (others => '0');
   signal byte_enable_a : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal led : std_logic_vector(7 downto 0);
   signal enable_i2c : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Module_register_signals PORT MAP (
          clk => clk,
          ram_addr => ram_addr,
          ram_read => ram_read,
          byte_enable_a => byte_enable_a,
          led => led,
          enable_i2c => enable_i2c
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

      -- insert stimulus here 
		
		ram_addr <= X"C0000004";
		byte_enable_a <= "1111";
		
		wait for 20 ns;
		
		ram_addr <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
		byte_enable_a <= "0000";

      wait;
   end process;

END;
