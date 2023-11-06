library IEEE;
use ieee.std_logic_1164.ALL;

entity system is
    port(
        i_carSensor: in std_logic;
        i_clock: in std_logic;
        i_reset: in std_logic;
        i_sscMax: in STD_LOGIC_VECTOR(3 downto 0);
        i_mscMax: in STD_LOGIC_VECTOR(3 downto 0);
		  
        o_mstl: out STD_LOGIC_VECTOR(2 downto 0);
        o_sstl: out STD_LOGIC_VECTOR(2 downto 0)
    );
end system;

architecture rtl of system is

    component FSMController
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
    end component;

    component clockDivider
    port(
        i_clock: in std_logic;
        i_reset: in std_logic;
        o_clock: out std_logic
    );
    end component;

    component comparator
    port(
		i_x: in std_logic_vector(3 downto 0);
		i_y: in std_logic_vector(3 downto 0);
		
		o_equal: out std_logic
    );
    end component;

    component debouncer
    port(
		i_reset		: IN	STD_LOGIC;
		i_clock			: IN	STD_LOGIC;
		i_raw			: IN	STD_LOGIC;
		o_clean			: OUT	STD_LOGIC);
    end component;

    component eightToFourMux
    port(
        i_input1: in STD_LOGIC_VECTOR(3 downto 0);
        i_input2: in STD_LOGIC_VECTOR(3 downto 0);
        i_sel: in std_logic;

        o: out STD_LOGIC_VECTOR(3 downto 0)
    );
    end component;

    component modSixteenCounter
    port(
			i_count: in std_logic;
			i_reset: in std_logic;
			i_clock: in std_logic;
			
			o: out std_logic_vector(3 downto 0)
    );
    end component;

    component yellowLightTimer
    port(
        i_count: in std_logic;
		i_reset: in std_logic;
		i_clock: in std_logic;
			
		o_done: out std_logic;
		o_timer: out std_logic_vector(3 downto 0)
    );
    end component;

    signal int_clock: std_logic;
    signal int_Isscs, int_Imsc, int_Imt, int_Issc, int_Isst: std_logic;
    signal int_sstR, int_mscR, int_mtR, int_sscR: std_logic;
    signal int_msc, int_mt, int_ssc, int_sst: std_logic;
    signal int_mscOut: std_logic_vector(3 downto 0);
    signal int_sscOut: std_logic_vector(3 downto 0);
    signal int_currentCount: std_logic_vector(3 downto 0);
    signal int_currentMax: std_logic_vector(3 downto 0);
    signal int_counterEqual: std_logic;
    signal int_timerDone: std_logic;

begin

    yellowLightTimer1: yellowLightTimer
    port map(
        i_count => (int_mt or int_sst),
        i_reset => (i_reset or int_mtR or int_sstR),
        i_clock => int_clock,
        o_done => int_timerDone
    );

    int_Imt <= int_timerDone;
    int_Isst <= int_timerDone;

    clockdivider1: ClockDivider
    port map(
        i_clock => i_clock,
        i_reset => i_reset
        --o_clock => int_clock
    );
    
    int_clock <= i_clock;

    debouncer1: debouncer
    port map(
        i_reset => i_reset,
        i_clock => i_clock,
        i_raw => i_carSensor,
        o_clean => int_Isscs
    );
	 
	 --int_Isscs <= i_carSensor;

    FSMController1: FSMController
    port map(
        i_clock => int_clock,
        i_reset => i_reset,

        i_sscs => int_Isscs,
        i_msc => int_Imsc,
        i_mt => int_Imt,
        i_ssc => int_Issc,
        i_sst => int_Isst,

        o_mstl => o_mstl,
        o_sstl => o_sstl,

        o_sstR => int_sstR,
        o_mscR => int_mscR,
        o_mtR => int_mtR,
        o_sscR => int_sscR,

        o_msc => int_msc,
        o_mt => int_mt,
        o_ssc => int_ssc,
        o_sst => int_sst
    );

    MSCounter: modSixteenCounter
    port map(
        i_count => int_msc,
        i_reset => (int_mscR or i_reset),
        i_clock => int_clock,
        o => int_mscOut
    );

    SSCounter: modSixteenCounter
    port map(
        i_count => int_ssc,
        i_reset => (int_sscR or i_reset),
        i_clock => int_clock,
        o => int_sscOut
    );
	 
    currentCount: eightToFourMux
    port map(
        i_input1 => int_mscOut,
        i_input2 => int_sscOut,
        i_sel => not(int_msc), --note that int_msc means s0 is on
        o => int_currentCount
    );

    countMax: eightToFourMux
    port map(
        i_input1 => i_mscMax,
        i_input2 => i_sscMax,
        i_sel => not(int_msc), --note that int_msc means s0 is on
        o => int_currentMax
    );

    comparator1: comparator
    port map(
        i_x => int_currentCount,
        i_y => int_currentMax,
        o_equal => int_counterEqual
    );

    int_Issc <= int_counterEqual;
    int_Imsc <= int_counterEqual;

end rtl;