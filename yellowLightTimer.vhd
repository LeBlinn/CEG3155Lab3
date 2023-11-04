library ieee;
use ieee.std_logic_1164.all;

entity yellowLightTimer is
	port(
			i_count: in std_logic;
			i_reset: in std_logic;
			i_clock: in std_logic;
			
			o_done: out std_logic;
			o_timer: out std_logic_vector(3 downto 0));
end yellowLightTimer;

architecture rtl of yellowLightTimer is
	signal int_done: std_logic;
	signal int_o: std_logic_vector(3 downto 0);
	
	component modSixteenCounter 
		port(
			i_count: in std_logic;
			i_reset: in std_logic;
			i_clock: in std_logic;
			
			o: out std_logic_vector(3 downto 0));
	end component;
	
	begin
	
	timer: modSixteenCounter
	port map(
		i_count => (not(int_done) and i_count),
		i_reset => i_reset,
		i_clock => i_clock,
		
		o => int_o);
		
	--concurrent signal assignment
	int_done <= int_o(3) and int_o(2) and int_o(1) and int_o(0);
	o_timer <= int_o;
	o_done <= int_done;
	
end rtl;
	