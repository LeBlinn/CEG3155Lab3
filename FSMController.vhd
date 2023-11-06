library IEEE;
use ieee.std_logic_1164.ALL;

entity FSMController is
    port(
        i_clock: in std_logic;
        i_reset: in std_logic;

        i_sscs: in std_logic;
        i_msc: in std_logic;
        i_mt: in std_logic;
        i_ssc: in std_logic;
        i_sst: in std_logic;

        o_mstl: out STD_LOGIC_VECTOR(2 downto 0);
        o_sstl: out STD_LOGIC_VECTOR(2 downto 0);

        o_sstR: out std_logic;
        o_mscR: out std_logic;
        o_mtR: out std_logic;
        o_sscR: out std_logic;

        o_msc: out std_logic;
        o_mt: out std_logic;
        o_ssc: out std_logic;
        o_sst: out std_logic
    );
end FSMController;

architecture rtl of FSMController is

signal int_DA, int_DB: std_logic;
signal int_A, int_ABar, int_B, int_BBar: std_logic;
signal int_sstBar, int_mtBar: std_logic;

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

    DFFa: DFlipFlopASR
    port map(
        i_set => '0',
        i_d => int_DA,
        i_enable => '1',
        i_clock => i_clock,
        i_clear => i_reset,
        o_q => int_A,
        o_qBar => int_ABar
    );

    DFFb: DFlipFlopASR
    port map(
        i_set => '0',
        i_d => int_DB,
        i_enable => '1',
        i_clock => i_clock,
        i_clear => i_reset,
        o_q => int_B,
        o_qBar => int_BBar
    );

int_DA <= ((int_ABar and int_B and i_mt) or (int_A and int_BBar) or (int_A and int_B and int_sstBar));

int_DB <= ((int_ABar and int_BBar and i_sscs and i_msc) or (int_ABar and int_B and int_mtBar) or (int_A and int_BBar and i_ssc) or (int_A and int_B and int_sstBar));

int_sstBar <= not(i_sst);
int_mtBar <= not(i_mt);

o_sstR <= int_ABar and int_BBar;
o_mscR <= int_ABar and int_B;
o_mtR <= int_A and int_BBar;
o_sscR <= int_A and int_B;

o_msc <= int_ABar and int_BBar;
o_mt <= int_ABar and int_B;
o_ssc <= int_A and int_BBar;
o_sst <= int_A and int_B;

o_mstl(0) <= int_ABar and int_BBar;
o_mstl(1) <= int_ABar and int_B;
o_mstl(2) <= int_A;

o_sstl(0) <= int_A and int_BBar;
o_sstl(1) <= int_A and int_B;
o_sstl(2) <= int_ABar;


end rtl;