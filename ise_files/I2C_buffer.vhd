----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:02:33 03/20/2017 
-- Design Name: 
-- Module Name:    I2C_buffer - Behavioral 
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

entity I2C_buffer is
    Port ( sda_in : in  STD_LOGIC;
           scl_in : in  STD_LOGIC;
           sda_out : out  STD_LOGIC;
           scl_out : out  STD_LOGIC;
           sda : inout  STD_LOGIC;
           scl : inout  STD_LOGIC);
end I2C_buffer;

architecture Behavioral of I2C_buffer is

begin

buffering : process (clk)
begin
	if(rising_edge(clk))then	
		sda <= sda_in;
		sda_out <= sda;
		scl <= scl_in;
		scl_out <= scl;
	end if;
end process buffering;
end Behavioral;

