----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:47:20 05/08/2016 
-- Design Name: 
-- Module Name:    Module_register_signals - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
--
--Module used to generate signals (such as enable module) by reading the
--mcs/ram bus and instantaneously pull up enable signal without needing
--of read the ram (that need 2 clock rising edge)
--
--register C_BASEADDR + 0x04 
-- |			31-1			|		0			|
--	|		see I2C part	|	enable i2c	|

entity Module_register_signals is
    Port ( 
		clk : IN  STD_LOGIC;
		ram_addr : IN std_logic_vector(31 downto 0);
		ram_read : IN std_logic_vector(31 downto 0);
		byte_enable_a : IN std_logic_vector(3 downto 0);
		
		led : OUT std_logic_vector(7 downto 0);
		enable_i2c : OUT std_logic
	 );
end Module_register_signals;

architecture Behavioral of Module_register_signals is

signal test : std_logic;

begin

test <= '1' when ram_addr = X"00000004" and byte_enable_a /= "0000" and ram_read(0) = '1' else
					'0';--check ram_data

enable_i2c <= test;--Flip Flop to clean the output may be useless

end Behavioral;

