----------------------------------------------------------------------------------
-- FILENAME: user_interface.vhd
-- AUTHOR: Benjamin Findley
-- CREATE DATE: 9/8/2022
--
-- DESCRIPTION: User interface state machine
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity user_interface is
    generic (
        MAX : positive
    );
    port (
        Switch_Bank  : in  std_logic_vector(7 downto 0);
        Button1, Button2 : in std_logic;
        LEDs : out std_logic_vector(MAX-1 downto 0);
        Amp : out std_logic_vector(MAX-1 downto 0);
end user_interface;

architecture ARCH of user_interface is

    type state_t is (INIT, START, BUTT1_N, FILTER_INC, FILTER_RESET, AMP_SEL)
    signal state_r, next_state : state_t;

begin
	process (clk, rst)
	variable Filter_Select : positive;
	begin
		if (rst = '1') then
			state_r <= INIT;
		elsif (rising_edge(clk)) then
			state_r <= next_state;
		end if;
	end process;

	process (state_r, Button1, Button2, Switch_Bank)
	begin
		case(state_r) is
			when INIT =>
				Filter_Select <= 0;
				next_state <= START;
			when START =>
				if (Button1 = '1') then
					next_state <= FILTER_INC;
				else
					next_state <= BUTT1_N;
				end if;
			when FILTER_INC =>
				Filter_Select <= Filter_Select + 1;
				if (Filter_Select = MAX) then
					next_state <= FILTER_RESET;
				else
					next_state <= BUTT1_N;
				end if;
			when FILTER_RESET =>
				Filter_Select <= 0;
				next_state <= BUTT1_N;
			when BUTT1_N =>
				if (Button2 = '1') then
					next_state <= AMP_SEL;
				else
					next_state <= START;
				end if ;
			when AMP_SEL =>
				Amp(Filter_Select) <= Switch_Bank;
				next_state <= START;
		end case
	end process

	LEDs <= (others => '0');
	LEDs(Filter_Select) <= '1';
end ARCH