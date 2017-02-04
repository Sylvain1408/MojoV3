
-- VHDL Instantiation Created from source file i2c_master.vhd -- 20:16:51 05/07/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT i2c_master
	PORT(
		clk : IN std_logic;
		reset_n : IN std_logic;
		ena : IN std_logic;
		addr : IN std_logic_vector(6 downto 0);
		rw : IN std_logic;
		data_wr : IN std_logic_vector(7 downto 0);    
		sda : INOUT std_logic;
		scl : INOUT std_logic;      
		busy : OUT std_logic;
		data_rd : OUT std_logic_vector(7 downto 0);
		ack_error : OUT std_logic
		);
	END COMPONENT;

	Inst_i2c_master: i2c_master PORT MAP(
		clk => ,
		reset_n => ,
		ena => ,
		addr => ,
		rw => ,
		data_wr => ,
		busy => ,
		data_rd => ,
		ack_error => ,
		sda => ,
		scl => 
	);


