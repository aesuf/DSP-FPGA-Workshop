----------------------------------------------------------------------------------
-- FILENAME: acc_buffer.vhd
-- AUTHOR: Jackson Cornell
-- CREATE DATE: 9/12/2022
--
-- DESCRIPTION: Buffer inbetween multiplied data and accumulator.
--
-- ENITIES: acc_buffer
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

use work.user_pkg.all;

entity acc_buffer is
	port (
		-- input
		clk		: in std_logic;
		rst     : in std_logic;
		en   	: in std_logic;
		load	: in std_logic
		input	: in MULT_STAGE_OUT;
		-- output
		output	: out std_logic_vector(MULT_DATA_RANGE);
	);
end acc_buffer;

architecture STR of acc_buffer is

	-- variables
	signal temp_out, mux_out : MULT_STAGE_OUT;

begin

	-- generate input muxes
	U_INPUT_MUXES : for i in 1 to FIFO_OUT_DEPTH-1 generate
		U_MUX : entity work.mux_2x1
			generic map (
				width => MULT_DATA_SIZE)
			port map (
				sel    => load,
				input1 => temp_out(i - 1),
				input2 => input(i),
				output => mux_out(i)
			);
	end generate;

	-- first register
	U_REG1 : entity work.reg
			generic map (
				width   => MULT_DATA_RANGE)
			port map (
				clk     => clk,
				rst     => rst,
				en      => load,
				input   => input(0),
				output  => temp_out(0)
			);

	-- generate shift register of size 'FIFO_OUT_DEPTH'
	U_SHIFT_REG : for i in 1 to FIFO_OUT_DEPTH-1 generate
		U_REG : entity work.reg
			generic map (
				width   => MULT_DATA_RANGE)
			port map (
				clk     => clk,
				rst     => rst,
				en      => en,
				input   => mux_out(i),
				output  => temp_out(i)
			);
	end generate;

	-- connect remaining signals
	output <= temp_out;

end STR;