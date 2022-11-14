----------------------------------------------------------------------------------
-- FILENAME: filter_engine_top.vhd
-- AUTHOR: Jackson Cornell
-- CREATE DATE: 9/10/2022
--
-- DESCRIPTION: FIR filter object
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
		valid	: in std_logic;
		amp		: in std_logic_vector(DATA_RANGE);
        input	: in ADDER_STAGE_OUT;
		-- outputs
		done	: out std_logic;
		output	: out std_logic_vector(DATA_RANGE);
	 );
end filter_engine_top;

architecture STR of filter_engine_top is

	-- variables
	signal acc_buffer_valid	: std_logic;
	signal acc_clear		: std_logic;
	signal en_buffer		: std_logic;
	signal shift_buff		: std_logic;
	
	signal acc_input		: std_logic_vector(MULT_DATA_RANGE);
	signal acc_output		: std_logic_vector(ACC_DATA_RANGE);
	
	signal mult_out			: MULT_STAGE_OUT;
	
begin
	
	-- "valid" pipeline delay
	U_DELAY1 : entity work.valid_pipeline
		generic map (
			num_clks => 1)	-- number of cycles for pipelined multiplication
		port map (
			-- inputs
			clk         => clk,
			rst         => rst,
			valid_in	=> valid,
			-- outputs
			valid_out	=> acc_buffer_valid
		);
		
	-- state machine to handle accumulator and buffer loading (DEFINE)
	U_ACC_FSM : entity work.acc_buffer_fsm
		port map (
			-- input
			clk		=> clk,
			rst		=> rst,
			clear	=> acc_clear,
			valid	=> acc_buffer_valid,
			-- output
			load	=> shift_buff
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
	U_ACC_BUFF : entity work.acc_buffer
		port map (
			-- input
			clk		=> clk,
			rst     => rst,
			en   	=> en_buffer,
			load	=> acc_buffer_valid,
			input	=> mult_out,
			-- output
			output	=> acc_input
		);
	
	-- addition accumulator (DEFINE)
	U_ACC : entity work.addition_acc
		port map (
			-- input
			clear	=> acc_clear,
			enable	=> shift_buff,
			input	=> acc_input,
			-- output
			output	=> acc_output
		);
	
	-- amplifier dividing (DEFINE)
	U_AMP : entity work.normalizer
		port map (
			-- input
			acc_output	<= acc_output,
			quantizer	<= amp,
			-- output
			result		<= output
		);
	
	-- additional logic
	en_buffer <= acc_buffer_valid OR shift_buff;
   
end STR;
