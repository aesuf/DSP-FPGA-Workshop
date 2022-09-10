----------------------------------------------------------------------------------
-- FILENAME: first_adder_stage.vhd
-- AUTHOR: Jackson Cornell
-- CREATE DATE: 9/10/2022
--
-- DESCRIPTION: Adds opposite elements of FIFO
--
-- ENITIES: first_adder_stage
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

use work.user_pkg.all;

entity first_adder_stage is
    port (
		-- inputs
		clk		: in std_logic;
		rst		: in std_logic;
        input	: in FIFO_OUT;
		-- outputs
		output	: out ADDER_STAGE_OUT;
	 );
end first_adder_stage;

architecture STR of first_adder_stage is

	-- variables
	signal adder_out : ADDER_STAGE_OUT;
	
begin

	-- add opposite ends of FIFO 
	U_ADDERS : for i in 0 to FIFO_OUT_DEPTH-2 generate
		adder_out(i) <= input(i) + input(FILTER_DEPTH - i - 1);
	end generate;
	adder_out(FIFO_OUT_DEPTH - 1) <= input(FIFO_OUT_DEPTH - 1); -- middle element
	
	-- pipelined output
	U_REGS : for j in 0 to FIFO_OUT_DEPTH-1 generate
		U_REG : entity work.reg
			generic map (
				width   => ADDER_STAGE_DATA_SIZE
			)
			port map (
				clk     => clk,
				rst     => rst,
				en      => '1',
				input   => adder_out(j),
				output  => output(j)
			);
	end generate;
   
end STR;
