library IEEE;
use ieee.std_logic_1164.ALL;

entity eightToFourMux is
    port(
        i_input1: in STD_LOGIC_VECTOR(3 downto 0);
        i_input2: in STD_LOGIC_VECTOR(3 downto 0);
        i_sel: in std_logic;

        o: out STD_LOGIC_VECTOR(3 downto 0)
    );
end eightToFourMux;

architecture rtl of eightToFourMux is
    signal int_notSel: std_logic;
    signal int_input1: STD_LOGIC_VECTOR(3 downto 0);
    signal int_input2: STD_LOGIC_VECTOR(3 downto 0);
begin

    int_notSel <= not(i_sel);
    int_input1(0) <= i_input1(0) and int_notSel;
    int_input1(1) <= i_input1(1) and int_notSel;
    int_input1(2) <= i_input1(2) and int_notSel;
    int_input1(3) <= i_input1(3) and int_notSel;
    
    int_input2(0) <= i_input2(0) and i_sel;
    int_input2(1) <= i_input2(1) and i_sel;
    int_input2(2) <= i_input2(2) and i_sel;
    int_input2(3) <= i_input2(3) and i_sel;

    o(0) <= int_input1(0) or int_input2(0);
    o(1) <= int_input1(1) or int_input2(1);
    o(2) <= int_input1(2) or int_input2(2);
    o(3) <= int_input1(3) or int_input2(3);

end rtl;