----------------------------------------------------------------------------------
-- FILENAME: input_buffer.vhd
-- AUTHOR: Jackson Cornell
-- CREATE DATE: 9/12/2022
--
-- DESCRIPTION: Buffer inbetween ADC and adding/multiplying stage
--
-- ENITIES: input_buffer
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

use work.user_pkg.all;

entity input_buffer is
	port (
		-- input
		clk		: in std_logic;
		rst     : in std_logic;
		valid   : in std_logic;
		input	: in std_logic_vector(FIFO_DATA_SIZE);
		-- output
		output	: out FIFO_OUT;
	);
end input_buffer;

architecture STR of input_buffer is

	-- variables
	signal temp_out : MULT_STAGE_OUT;

begin

	-- first register
	U_REG1 : entity work.reg
			generic map (
				width   => MULT_DATA_RANGE)
			port map (
				clk     => clk,
				rst     => rst,
				en      => valid,
				input   => input(0),
				output  => temp_out(0)
			);

	-- generate shift register of size 'FILTER_DEPTH'
	U_SHIFT_REG : for i in 1 to FILTER_DEPTH-1 generate
		U_REG : entity work.reg
			generic map (
				width   => MULT_DATA_RANGE)
			port map (
				clk     => clk,
				rst     => rst,
				en      => valid,
				input   => temp_out(i - 1),
				output  => temp_out(i)
			);
	end generate;

	-- connect remaining signals
	output <= temp_out;

end STR;