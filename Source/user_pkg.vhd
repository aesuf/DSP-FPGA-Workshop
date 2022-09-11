----------------------------------------------------------------------------------
-- FILENAME: user_pkg.vhd
-- AUTHOR: Jackson Cornell
-- CREATE DATE: 9/8/2022
--
-- DESCRIPTION: File to set system parameters.
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

package user_pkg is
	
	-- System constraints (CHANGE BASED OFF SYSTEM)
	constant ADC_CLK		: positive := 10000000;
	constant ADC_DATA_SIZE	: positive := 12;
	constant SYS_CLK		: positive := 10000000;
   
	-- Application specific constraints
	constant ACC_DATA_SIZE	: positive := 64;
	constant DATA_SIZE		: positive := 16;
	constant FILTER_COUNT	: positive := 6;
	constant FILTER_DEPTH	: positive := 641;		-- must be odd value, assumes filters all same size
	constant MULT_DATA_SIZE	: positive := 32;
	constant SAMPLE_RATE	: positive := 48000;
	constant QUANTIZE_MAX	: positive := 8;		-- max value by which output is normalized
	constant QUANTIZE_MIN	: positive := 16777216; -- any very large value within range
	
	-- Calculated values (DON'T EDIT)
	constant ADDER_STAGE_DATA_SIZE	: positive := FIFO_DATA_SIZE + 1;
	constant ADDER_STAGE_DELAY		: positive := 2;
	constant FIFO_DATA_SIZE			: positive := ADC_DATA_SIZE + 1;
	constant FIFO_OUT_DEPTH			: positive := (FILTER_DEPTH - 1) / 2 + 1;
	constant QUANTIZE_DEFAULT		: positive := 2**DATA_SIZE;
	
	subtype ACC_DATA_RANGE			is natural range ACC_DATA_SIZE-1 downto 0;
	subtype ADC_DATA_RANGE			is natural range ADC_DATA_SIZE-1 downto 0;
	subtype FIFO_DATA_RANGE			is natural range FIFO_DATA_SIZE-1 downto 0;
	subtype FIRST_ADDER_STAGE_RANGE	is natural range ADDER_STAGE_DATA_SIZE-1 downto 0;
	subtype DATA_RANGE				is natural range DATA_SIZE-1 downto 0;
	subtype MULT_DATA_RANGE			is natural range MULT_DATA_SIZE-1 downto 0;
	
	type ADDER_STAGE_OUT	is array (0 to FIFO_OUT_DEPTH-1) of std_logic_vector(FIRST_ADDER_STAGE_RANGE);
	type FIFO_OUT			is array (0 to FIFO_OUT_DEPTH-1) of std_logic_vector(FIFO_DATA_RANGE);
	type MULT_STAGE_OUT		is array (0 to FIFO_OUT_DEPTH-1) of std_logic_vector(MULT_DATA_SIZE);

end user_pkg;