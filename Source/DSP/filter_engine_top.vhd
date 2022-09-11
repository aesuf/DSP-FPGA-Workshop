----------------------------------------------------------------------------------
-- FILENAME: filter_engine_top.vhd
-- AUTHOR: Jackson Cornell
-- CREATE DATE: 9/10/2022
--
-- DESCRIPTION: FIR filter
--
-- ENITIES: filter_engine_top
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

use work.user_pkg.all;

entity filter_engine_top is
	generic (
		filter_num : positive);
    port (
		-- inputs
		clk		: in std_logic;
		rst		: in std_logic;
        input	: in FIFO_OUT;
		-- outputs
		output	: out std_logic_vector(ACC_DATA_RANGE);
	 );
end filter_engine_top;

architecture STR of filter_engine_top is

	-- variables
	signal adder_out	: ADDER_STAGE_OUT;
	signal mult_out		: MULT_STAGE_OUT;
	
begin

	-- add opposite ends of FIFO_OUT
	U_ADDER_STAGE : entity work.first_adder_stage
		port map (
			-- inputs
			clk		=> clk,
			rst		=> rst,
			input	=> input,
			-- outputs
			output	=> adder_out
		);
	
	-- multipy results by filter taps
	U_MULT_STAGE : entity work.taps_mult
		generic map (
			filter_num => filter_num
		)
		port map (
			-- inputs
			clk		=> clk,
			rst		=> rst,
			input	=> adder_out,
			-- outputs
			output	=> mult_out
		);
		
	-- second FIFO as input to accumulator
	
	-- addition accumulator
	
	-- amplifier stage
   
end STR;
