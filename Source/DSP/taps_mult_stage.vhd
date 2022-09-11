----------------------------------------------------------------------------------
-- FILENAME: taps_mult_stage.vhd
-- AUTHOR: Jackson Cornell
-- CREATE DATE: 9/10/2022
--
-- DESCRIPTION: Multiplies adder stage outputs by filter weights
--
-- ENITIES: taps_mult
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

use work.filter_taps_pkg.all
use work.user_pkg.all;

entity taps_mult is
	generic (
		filter_num : positive);
    port (
		-- inputs
		clk		: in std_logic;
		rst		: in std_logic;
        input	: in ADDER_STAGE_OUT;
		-- outputs
		output	: out MULT_STAGE_OUT;
	 );
end taps_mult;

architecture STR of taps_mult is

	-- variables
	signal mult_out : MULT_STAGE_OUT;
	
begin

	-- multiply input by filter taps
	U_MULTS : for i in 0 to FIFO_OUT_DEPTH-1 generate
		mult_out(i) <= input(i) * FILTER_TAPS(filter_num, i);
	end generate;
	
	-- pipelined output
	U_REGS : for j in 0 to FIFO_OUT_DEPTH-1 generate
		U_REG : entity work.reg
			generic map (
				width   => MULT_DATA_SIZE
			)
			port map (
				clk     => clk,
				rst     => rst,
				en      => '1',
				input   => mult_out(j),
				output  => output(j)
			);
	end generate;
   
end STR;
