----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:10:57 04/23/2016 
-- Design Name: 
-- Module Name:    ram_tester - Behavioral 
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

entity ram_interface is
    Port ( clk : in  STD_LOGIC;
           web : out  STD_LOGIC_VECTOR (3 downto 0);
           addrb : out  STD_LOGIC_VECTOR (31 downto 0);
           write_data : out  STD_LOGIC_VECTOR (31 downto 0);
           read_data : in  STD_LOGIC_VECTOR (31 downto 0);
           led : out  STD_LOGIC_VECTOR (7 downto 0));
end ram_tester;

architecture Behavioral of ram_interface is

begin

test: process(clk)
	begin
	if(rising_edge(clk)) then
		addrb <= X"00000000";
		web <= "1111";
		led <= "01010101";
		write_data <= X"F0F0F0F0";
	end if;
end process test;

end Behavioral;

