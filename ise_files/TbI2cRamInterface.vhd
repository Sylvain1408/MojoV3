--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:47:13 05/14/2016
-- Design Name:   
-- Module Name:   C:/Users/Sylvain/Desktop/Mojo-Base-VHDL/ise_files/TbI2cRamInterface.vhd
-- Project Name:  Mojo-Base-VHDL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: i2c_ram_interface
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
 
ENTITY TbI2cRamInterface IS
END TbI2cRamInterface;
 
ARCHITECTURE behavior OF TbI2cRamInterface IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT i2c_ram_interface
    PORT(
         clk : IN  std_logic;
         ram_write : OUT  std_logic_vector(31 downto 0);
         ram_addr : OUT  std_logic_vector(31 downto 0);
         ram_read : IN  std_logic_vector(31 downto 0);
         ram_byte : OUT  std_logic_vector(3 downto 0);
         slave_addr : OUT  std_logic_vector(6 downto 0);
         slave_write : OUT  std_logic_vector(7 downto 0);
         slave_read : IN  std_logic_vector(7 downto 0);
         rw : OUT  std_logic;
         fetch_decode : IN  std_logic;
         enable_communication : OUT  std_logic;
         reset_n : OUT  std_logic;
         busy : IN  std_logic;
         ack_error : IN  std_logic;
         led : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal ram_read : std_logic_vector(31 downto 0) := (others => '0');
   signal slave_read : std_logic_vector(7 downto 0) := (others => '0');
   signal fetch_decode : std_logic := '0';
   signal busy : std_logic := '0';
   signal ack_error : std_logic := '0';

 	--Outputs
   signal ram_write : std_logic_vector(31 downto 0);
   signal ram_addr : std_logic_vector(31 downto 0);
   signal ram_byte : std_logic_vector(3 downto 0);
   signal slave_addr : std_logic_vector(6 downto 0);
   signal slave_write : std_logic_vector(7 downto 0);
   signal rw : std_logic;
   signal enable_communication : std_logic;
   signal reset_n : std_logic;
   signal led : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: i2c_ram_interface PORT MAP (
          clk => clk,
          ram_write => ram_write,
          ram_addr => ram_addr,
          ram_read => ram_read,
          ram_byte => ram_byte,
          slave_addr => slave_addr,
          slave_write => slave_write,
          slave_read => slave_read,
          rw => rw,
          fetch_decode => fetch_decode,
          enable_communication => enable_communication,
          reset_n => reset_n,
          busy => busy,
          ack_error => ack_error,
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
		wait for 5 ns;
		fetch_decode <= '1';
		slave_read <= X"BC";
		ram_read <= X"68000003";
		wait for 40 ns;
		
		fetch_decode <= '0';
		busy <= '1';
		
		wait for 500 ns;
		
		busy <= '0';
		
		wait for 50 ns;
		
		fetch_decode <= '1';
		
		wait for 40 ns;
		
		fetch_decode <= '0';
		busy <= '1';
		
		wait for 500 ns;
		
		busy <= '0';

      wait;
   end process;

END;
