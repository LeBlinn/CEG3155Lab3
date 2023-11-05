library ieee;
use ieee.std_logic_1164.all;

entity modSixteenCounter is
	port(
			i_count: in std_logic;
			i_reset: in std_logic;
			i_clock: in std_logic;
			
			o: out std_logic_vector(3 downto 0));
	end modSixteenCounter;
	
architecture rtl of modSixteenCounter is
	signal int_q: std_logic_vector(3 downto 0);
	signal int_qBar: std_logic_vector(3 downto 0);
	signal int_d: std_logic_vector(3 downto 0);
	signal int_enable: std_logic;
	signal int_set: std_logic;
	signal int_load: std_logic;
	
	component DFlipFlopASR
		port(
			i_set: in std_logic;
			i_d: in std_logic;
			i_enable: in std_logic;
			i_clock: in std_logic;
			i_clear: in std_logic;

			o_q: out std_logic;
			o_qBar: out std_logic
			);
		end component;
		
	begin

	dFlipFlop0: DFlipFlopASR
	port map(
		i_enable => int_enable,
		i_clear => i_reset,
		i_set => int_set,
		i_clock => i_clock,
		i_d => int_d(0),
		o_q => int_q(0),
		o_qBar => int_qBar(0)
	);

	dFlipFlop1: DFlipFlopASR
	port map(
		i_enable => int_enable,
		i_clear => i_reset,
		i_set => int_set,
		i_clock => i_clock,
		i_d => int_d(1),
		o_q => int_q(1),
		o_qBar => int_qBar(1)
	);

	dFlipFlop2: DFlipFlopASR
	port map(
		i_enable => int_enable,
		i_clear => i_reset,
		i_set => int_set,
		i_clock => i_clock,
		i_d => int_d(2),
		o_q => int_q(2),
		o_qBar => int_qBar(2)
	);

	dFlipFlop3: DFlipFlopASR
	port map(
		i_enable => int_enable,
		i_clear => i_reset,
		i_set => int_set,
		i_clock => i_clock,
		i_d => int_d(3),
		o_q => int_q(3),
		o_qBar => int_qBar(3)
	);
	
    	     int_set <= '0';
    	  int_enable <= i_count;
    int_d(0) <= (int_qBar(1)and int_qBar(0)) or (int_q(1) and int_qBar(0));
    int_d(1) <= int_q(0) XOR int_q(1);
    int_d(2) <= (int_q(2) and int_qBar(1)) or (int_qBar(2) and int_q(1) and int_q(0))
						or (int_q(2) and int_q(1) and int_qBar(0));
    int_d(3) <= (int_q(3) and int_qBar(1)) or (int_q(3) and int_qBar(2)) or
						(int_q(3) and int_q(1) and int_qBar(0)) or (int_qBar(3) and int_q(2) and int_q(1) and int_q(0));
	 o <= int_q;
    

end rtl;