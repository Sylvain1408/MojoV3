--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:12:53 06/03/2016
-- Design Name:   
-- Module Name:   E:/workspace/Mojo-Base-VHDL/ise_files/TbI2c.vhd
-- Project Name:  Mojo-Base-VHDL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: i2c
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
 
ENTITY TbI2c IS
END TbI2c;
 
ARCHITECTURE behavior OF TbI2c IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT i2c
    PORT(
         clk : IN  std_logic;
         fetch_decode : IN  std_logic;
         ram_din : OUT  std_logic_vector(31 downto 0);
         ram_dout : IN  std_logic_vector(31 downto 0);
         ram_addr : OUT  std_logic_vector(31 downto 0);
         ram_byte : OUT  std_logic_vector(3 downto 0);
         scl : INOUT  std_logic;
         sda : INOUT  std_logic;
         led : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal fetch_decode : std_logic := '0';
   signal ram_dout : std_logic_vector(31 downto 0) := (others => '0');

	--BiDirs
   signal scl : std_logic;
   signal sda : std_logic;

 	--Outputs
   signal ram_din : std_logic_vector(31 downto 0);
   signal ram_addr : std_logic_vector(31 downto 0);
   signal ram_byte : std_logic_vector(3 downto 0);
   signal led : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: i2c PORT MAP (
          clk => clk,
          fetch_decode => fetch_decode,
          ram_din => ram_din,
          ram_dout => ram_dout,
          ram_addr => ram_addr,
          ram_byte => ram_byte,
          scl => scl,
          sda => sda,
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
		
		wait for 5 ns;

      -- insert stimulus here 
		fetch_decode <= '1';
		--ram_dout <= X"00036803";
		ram_dout <= X"00152503";
		
		
		wait for 25 ns;
		
		ram_dout <= X"55555555";
		fetch_decode <= '0';

      wait;
   end process;

END;
