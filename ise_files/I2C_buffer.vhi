
-- VHDL Instantiation Created from source file I2C_buffer.vhd -- 20:03:03 03/20/2017
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT I2C_buffer
	PORT(
		sda_in : IN std_logic;
		scl_in : IN std_logic;    
		sda : INOUT std_logic;
		scl : INOUT std_logic;      
		sda_out : OUT std_logic;
		scl_out : OUT std_logic
		);
	END COMPONENT;

	Inst_I2C_buffer: I2C_buffer PORT MAP(
		sda_in => ,
		scl_in => ,
		sda_out => ,
		scl_out => ,
		sda => ,
		scl => 
	);


