library IEEE;
use ieee.std_logic_1164.ALL;

entity ClockDivider is
    port(
        i_clock: in std_logic;
        i_reset: in std_logic;
        o_clock: out std_logic
    );
end ClockDivider;

architecture rtl of ClockDivider is

signal int_1: std_logic;
signal int_1Bar: std_logic;
signal int_2: std_logic;
signal int_2Bar: std_logic;
signal int_3: std_logic;
signal int_3Bar: std_logic;
signal int_4: std_logic;
signal int_4Bar: std_logic;
signal int_5: std_logic;
signal int_5Bar: std_logic;
signal int_6: std_logic;
signal int_6Bar: std_logic;
signal int_7: std_logic;
signal int_7Bar: std_logic;
signal int_8: std_logic;
signal int_8Bar: std_logic;
signal int_9: std_logic;
signal int_9Bar: std_logic;
signal int_10: std_logic;
signal int_10Bar: std_logic;
signal int_11: std_logic;
signal int_11Bar: std_logic;
signal int_12: std_logic;
signal int_12Bar: std_logic;
signal int_13: std_logic;
signal int_13Bar: std_logic;
signal int_14: std_logic;
signal int_14Bar: std_logic;
signal int_15: std_logic;
signal int_15Bar: std_logic;
signal int_16: std_logic;
signal int_16Bar: std_logic;
signal int_17: std_logic;
signal int_17Bar: std_logic;
signal int_18: std_logic;
signal int_18Bar: std_logic;
signal int_19: std_logic;
signal int_19Bar: std_logic;
signal int_20: std_logic;
signal int_20Bar: std_logic;
signal int_21: std_logic;
signal int_21Bar: std_logic;
signal int_22: std_logic;
signal int_22Bar: std_logic;
signal int_23: std_logic;
signal int_23Bar: std_logic;
signal int_24: std_logic;
signal int_24Bar: std_logic;
    
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
    
    DFF1: DFlipFlopASR
    port map(
        i_set => '0',
        i_d => int_1Bar,
        i_enable => '1',
        i_clock => i_clock,
        i_clear => i_reset,
        o_q => int_1,
        o_qBar => int_1Bar
    );

    DFF2: DFlipFlopASR
    port map(
        i_set => '0',
        i_d => int_2Bar,
        i_enable => '1',
        i_clock => int_1,
        i_clear => i_reset,
        o_q => int_2,
        o_qBar => int_2Bar
    );

    DFF3: DFlipFlopASR
    port map(
        i_set => '0',
        i_d => int_3Bar,
        i_enable => '1',
        i_clock => int_2,
        i_clear => i_reset,
        o_q => int_3,
        o_qBar => int_3Bar
    );

    DFF4: DFlipFlopASR
    port map(
        i_set => '0',
        i_d => int_4Bar,
        i_enable => '1',
        i_clock => int_3,
        i_clear => i_reset,
        o_q => int_4,
        o_qBar => int_4Bar
    );

    DFF5: DFlipFlopASR
    port map(
        i_set => '0',
        i_d => int_5Bar,
        i_enable => '1',
        i_clock => int_4,
        i_clear => i_reset,
        o_q => int_5,
        o_qBar => int_5Bar
    );

    DFF6: DFlipFlopASR
    port map(
        i_set => '0',
        i_d => int_6Bar,
        i_enable => '1',
        i_clock => int_5,
        i_clear => i_reset,
        o_q => int_6,
        o_qBar => int_6Bar
    );

    DFF7: DFlipFlopASR
    port map(
        i_set => '0',
        i_d => int_7Bar,
        i_enable => '1',
        i_clock => int_6,
        i_clear => i_reset,
        o_q => int_7,
        o_qBar => int_7Bar
    );

    DFF8: DFlipFlopASR
    port map(
        i_set => '0',
        i_d => int_8Bar,
        i_enable => '1',
        i_clock => int_7,
        i_clear => i_reset,
        o_q => int_8,
        o_qBar => int_8Bar
    );

    DFF9: DFlipFlopASR
    port map(
        i_set => '0',
        i_d => int_9Bar,
        i_enable => '1',
        i_clock => int_8,
        i_clear => i_reset,
        o_q => int_9,
        o_qBar => int_9Bar
    );

    DFF10: DFlipFlopASR
    port map(
        i_set => '0',
        i_d => int_10Bar,
        i_enable => '1',
        i_clock => int_9,
        i_clear => i_reset,
        o_q => int_10,
        o_qBar => int_10Bar
    );

    DFF11: DFlipFlopASR
    port map(
        i_set => '0',
        i_d => int_11Bar,
        i_enable => '1',
        i_clock => int_10,
        i_clear => i_reset,
        o_q => int_11,
        o_qBar => int_11Bar
    );

    DFF12: DFlipFlopASR
    port map(
        i_set => '0',
        i_d => int_12Bar,
        i_enable => '1',
        i_clock => int_11,
        i_clear => i_reset,
        o_q => int_12,
        o_qBar => int_12Bar
    );

    DFF13: DFlipFlopASR
    port map(
        i_set => '0',
        i_d => int_13Bar,
        i_enable => '1',
        i_clock => int_12,
        i_clear => i_reset,
        o_q => int_13,
        o_qBar => int_13Bar
    );

    DFF14: DFlipFlopASR
    port map(
        i_set => '0',
        i_d => int_14Bar,
        i_enable => '1',
        i_clock => int_13,
        i_clear => i_reset,
        o_q => int_14,
        o_qBar => int_14Bar
    );

    DFF15: DFlipFlopASR
    port map(
        i_set => '0',
        i_d => int_15Bar,
        i_enable => '1',
        i_clock => int_14,
        i_clear => i_reset,
        o_q => int_15,
        o_qBar => int_15Bar
    );

    DFF16: DFlipFlopASR
    port map(
        i_set => '0',
        i_d => int_16Bar,
        i_enable => '1',
        i_clock => int_15,
        i_clear => i_reset,
        o_q => int_16,
        o_qBar => int_16Bar
    );

    DFF17: DFlipFlopASR
    port map(
        i_set => '0',
        i_d => int_17Bar,
        i_enable => '1',
        i_clock => int_16,
        i_clear => i_reset,
        o_q => int_17,
        o_qBar => int_17Bar
    );

    DFF18: DFlipFlopASR
    port map(
        i_set => '0',
        i_d => int_18Bar,
        i_enable => '1',
        i_clock => int_17,
        i_clear => i_reset,
        o_q => int_18,
        o_qBar => int_18Bar
    );

    DFF19: DFlipFlopASR
    port map(
        i_set => '0',
        i_d => int_19Bar,
        i_enable => '1',
        i_clock => int_18,
        i_clear => i_reset,
        o_q => int_19,
        o_qBar => int_19Bar
    );

    DFF20: DFlipFlopASR
    port map(
        i_set => '0',
        i_d => int_20Bar,
        i_enable => '1',
        i_clock => int_19,
        i_clear => i_reset,
        o_q => int_20,
        o_qBar => int_20Bar
    );

    DFF21: DFlipFlopASR
    port map(
        i_set => '0',
        i_d => int_21Bar,
        i_enable => '1',
        i_clock => int_20,
        i_clear => i_reset,
        o_q => int_21,
        o_qBar => int_21Bar
    );

    DFF22: DFlipFlopASR
    port map(
        i_set => '0',
        i_d => int_22Bar,
        i_enable => '1',
        i_clock => int_21,
        i_clear => i_reset,
        o_q => int_22,
        o_qBar => int_22Bar
    );

    DFF23: DFlipFlopASR
    port map(
        i_set => '0',
        i_d => int_23Bar,
        i_enable => '1',
        i_clock => int_22,
        i_clear => i_reset,
        o_q => int_23,
        o_qBar => int_23Bar
    );

    DFF24: DFlipFlopASR
    port map(
        i_set => '0',
        i_d => int_24Bar,
        i_enable => '1',
        i_clock => int_23,
        i_clear => i_reset,
        o_q => int_24,
        o_qBar => int_24Bar
    );

    o_clock <= int_24;

end rtl;