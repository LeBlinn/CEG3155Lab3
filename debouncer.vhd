library ieee;
use ieee.std_logic_1164.all;

entity debouncer is
	port(
        i_reset 		: IN	STD_LOGIC;
		i_clock			: IN	STD_LOGIC;
		i_raw			: IN	STD_LOGIC;
		o_clean			: OUT	STD_LOGIC
    );
end debouncer;

architecture rtl of debouncer is

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

	 signal int_reset: std_logic;
    signal int_A, int_ABar, int_B, int_BBar, int_C, int_CBar: std_logic;
    signal int_D0, int_D1, int_D2: std_logic;

begin

    o_clean <= int_A and int_B and int_C;
    int_reset <= not(i_raw) or i_reset;

    int_D0 <= (int_CBar or (int_A and int_B));
    int_D1 <= ((int_BBar and int_C) or (int_A and int_C) or (int_B and int_CBar));
    int_D2 <= (int_A or (int_B and int_C));

    FF0: DFlipFlopASR
    port map(
        i_set => '0',
        i_d => int_D0,
        i_enable => i_raw,
        i_clock => i_clock,
        i_clear => int_reset,
        o_q => int_A,
        o_qBar => int_ABar
    );

    FF1: DFlipFlopASR
    port map(
        i_set => '0',
        i_d => int_D1,
        i_enable => i_raw,
        i_clock => i_clock,
        i_clear => int_reset,
        o_q => int_B,
        o_qBar => int_BBar
    );

    FF2: DFlipFlopASR
    port map(
        i_set => '0',
        i_d => int_D2,
        i_enable => i_raw,
        i_clock => i_clock,
        i_clear => int_reset,
        o_q => int_C,
        o_qBar => int_CBar
    );

end rtl;