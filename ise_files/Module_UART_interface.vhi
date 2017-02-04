
-- VHDL Instantiation Created from source file Module_UART_interface.vhd -- 14:20:57 05/13/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Module_UART_interface
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		rx : IN std_logic;
		tx_data : IN std_logic_vector(7 downto 0);
		tx_new_data : IN std_logic;
		rx_block : IN std_logic;          
		tx : OUT std_logic;
		rx_data : OUT std_logic_vector(7 downto 0);
		rx_new_data : OUT std_logic
		);
	END COMPONENT;

	Inst_Module_UART_interface: Module_UART_interface PORT MAP(
		clk => ,
		rst => ,
		rx => ,
		tx => ,
		rx_data => ,
		tx_data => ,
		rx_new_data => ,
		tx_new_data => ,
		rx_block => 
	);


