library IEEE;
use ieee.std_logic_1164.ALL;

entity DFlipFlopASR is
    port(
        i_set: in std_logic;
        i_d: in std_logic;
		i_enable: in std_logic;
        i_clock: in std_logic;
        i_clear: in std_logic;

        o_q: out std_logic;
        o_qBar: out std_logic
    );
end DFlipFlopASR;

architecture rtl of DFlipFlopASR is
	signal int_notEnable: std_logic;
    signal int_notSet: std_logic;
    signal int_notClear: std_logic;
	 
	signal int_d: std_logic;
	 
    signal int_n0: std_logic;
    signal int_n1: std_logic;
    signal int_n2: std_logic;
    signal int_n3: std_logic;
    signal int_n4: std_logic;
    signal int_n5: std_logic;
begin
    int_notEnable <= not(i_enable);
    int_notSet <= not(i_set);
    int_notClear <= not(i_clear);
	 
	int_d <= (int_notEnable and int_n4) or (i_enable and i_d);
	 
    int_n0 <= not(int_notSet and int_n3 and int_n1);
    int_n1 <= not(int_n0 and i_clock and int_notClear);
    int_n2 <= not(int_n1 and i_clock and int_n3);
    int_n3 <= not(int_n2 and int_d and int_notClear);
    int_n4 <= not(int_notSet and int_n1 and int_n5);
    int_n5 <= not(int_n4 and int_n2 and int_notClear);

    o_q <= int_n4;
    o_qBar <= int_n5;

end rtl;