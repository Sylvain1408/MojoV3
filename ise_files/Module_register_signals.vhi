
-- VHDL Instantiation Created from source file Module_register_signals.vhd -- 20:34:53 05/08/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Module_register_signals
	PORT(
		clk : IN std_logic;
		ram_addr : IN std_logic_vector(31 downto 0);
		ram_read : IN std_logic_vector(31 downto 0);          
		enable_i2c : OUT std_logic;
		led : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	Inst_Module_register_signals: Module_register_signals PORT MAP(
		clk => ,
		ram_addr => ,
		ram_read => ,
		enable_i2c => ,
		led => 
	);


