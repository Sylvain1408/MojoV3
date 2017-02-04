----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:35:10 05/11/2016 
-- Design Name: 
-- Module Name:    Module_UART_RxTx - Behavioral 
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

entity Module_UART_RxTx is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (7 downto 0);
           new_tx_data : out  STD_LOGIC;
           tx_busy : in  STD_LOGIC;
           rx_data : in  STD_LOGIC_VECTOR (7 downto 0);
           new_rx_data : in  STD_LOGIC);
end Module_UART_RxTx;

architecture Behavioral of Module_UART_RxTx is

type print_state is (IDLE, PRINT_MESSAGE);


begin


end Behavioral;

