--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:11:33 03/22/2017
-- Design Name:   
-- Module Name:   C:/Users/Sylvain/workspace/MojoV3/ise_files/TbI2CRamInterface.vhd
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
 
ENTITY TbI2CRamInterface IS
END TbI2CRamInterface;
 
ARCHITECTURE behavior OF TbI2CRamInterface IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT i2c_ram_interface
    PORT(
         clk : IN  std_logic;
         tic : OUT  std_logic;
         ram_write : OUT  std_logic_vector(31 downto 0);
         ram_addr : OUT  std_logic_vector(31 downto 0);
         ram_read : IN  std_logic_vector(31 downto 0);
         ram_byte : OUT  std_logic_vector(3 downto 0);
         slave_din : OUT  std_logic_vector(7 downto 0);
         slave_dout : IN  std_logic_vector(7 downto 0);
         rd : OUT  std_logic;
         we : OUT  std_logic;
         queue : IN  std_logic;
         data_valid : IN  std_logic;
         stop : IN  std_logic;
         go : IN  std_logic;
         reset_n : OUT  std_logic;
         status : IN  std_logic_vector(2 downto 0);
         ack_error : IN  std_logic;
         reset_in : IN  std_logic;
			device : OUT std_logic_vector(6 downto 0);
         led : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal ram_read : std_logic_vector(31 downto 0) := (others => '0');
   signal slave_dout : std_logic_vector(7 downto 0) := (others => '0');
   signal queue : std_logic := '0';
   signal data_valid : std_logic := '0';
   signal stop : std_logic := '0';
   signal go : std_logic := '0';
   signal status : std_logic_vector(2 downto 0) := (others => '0');
   signal ack_error : std_logic := '0';
   signal reset_in : std_logic := '0';

 	--Outputs
   signal tic : std_logic;
   signal ram_write : std_logic_vector(31 downto 0);
   signal ram_addr : std_logic_vector(31 downto 0);
   signal ram_byte : std_logic_vector(3 downto 0);
   signal slave_din : std_logic_vector(7 downto 0);
   signal rd : std_logic;
   signal we : std_logic;
   signal reset_n : std_logic;
   signal device : std_logic_vector(6 downto 0);
   signal led : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: i2c_ram_interface PORT MAP (
          clk => clk,
          tic => tic,
          ram_write => ram_write,
          ram_addr => ram_addr,
          ram_read => ram_read,
          ram_byte => ram_byte,
          slave_din => slave_din,
          slave_dout => slave_dout,
          rd => rd,
          we => we,
          queue => queue,
          data_valid => data_valid,
          stop => stop,
          go => go,
          reset_n => reset_n,
          status => status,
          ack_error => ack_error,
          reset_in => reset_in,
			 device => device,
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
		go <= '1';
		wait for 10ns;
		go <= '0';
		queue <= '0';
		slave_dout <= X"12";
		
		wait for 10us;
		queue <= '1';
		wait for 105ns;
		queue <= '0';

      -- insert stimulus here 

      wait;
   end process;

END;
