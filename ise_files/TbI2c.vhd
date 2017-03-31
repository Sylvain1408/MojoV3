--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:23:41 03/23/2017
-- Design Name:   
-- Module Name:   C:/Users/CAO-PCB/Documents/MojoV3/ise_files/Tbi2c.vhd
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
 
ENTITY Tbi2c IS
END Tbi2c;
 
ARCHITECTURE behavior OF Tbi2c IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT i2c
    PORT(
         clk : IN  std_logic;
         go : IN  std_logic;
         ram_din : OUT  std_logic_vector(31 downto 0);
         ram_dout : IN  std_logic_vector(31 downto 0);
         ram_addr : OUT  std_logic_vector(31 downto 0);
         ram_byte : OUT  std_logic_vector(3 downto 0);
         reset_in : IN  std_logic;
         scl : INOUT  std_logic;
         sda : INOUT  std_logic;
         led : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal go : std_logic := '0';
   signal ram_dout : std_logic_vector(31 downto 0) := (others => '0');
   signal reset_in : std_logic := '0';

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
          go => go,
          ram_din => ram_din,
          ram_dout => ram_dout,
          ram_addr => ram_addr,
          ram_byte => ram_byte,
          reset_in => reset_in,
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

      -- insert stimulus here 
		ram_dout <= X"EEEEEEEE";
		go <= '1';
		
		wait for 40 ns;
		go <= '0';
		
		ram_dout <= X"AAAAAAAA";
		
      wait;
   end process;

END;
