library ieee;
use ieee.std_logic_1164.all;

entity comparator is
	port(
			i_x: in std_logic_vector(3 downto 0);
			i_y: in std_logic_vector(3 downto 0);
			
			o_equal: out std_logic);
	end comparator;
	
	architecture rtl of comparator is
		
		signal int_bit: std_logic_vector(3 downto 0);
		
		begin
			 
		int_bit(0) <= i_x(0) xnor i_y(0);
		int_bit(1) <= i_x(1) xnor i_y(1);
		int_bit(2) <= i_x(2) xnor i_y(2);
		int_bit(3) <= i_x(3) xnor i_y(3);
		
		
		o_equal <= int_bit(0) and int_bit(1) and int_bit(2) and int_bit(3);
		
	end rtl;
			
			
			