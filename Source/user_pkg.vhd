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
	constant DATA_SIZE		: positive := 16;
	constant FILTER_COUNT	: positive := 6;
	constant FILTER_DEPTH	: positive := 512;
	constant SAMPLE_RATE	: positive := 48000;
	
	-- Calculated values (DON'T EDIT)
	constant DELAY	: positive := integer(ceil(log2(real(FILTER_DEPTH))));
	
	subtype ADC_DATA_RANGE	is natural range ADC_DATA_SIZE-1 downto 0;
	subtype DATA_RANGE		is natural range DATA_SIZE-1 downto 0;
	subtype TREE_OUT_RANGE	is natural range DATA_SIZE + 2 + integer(ceil(log2(real(FILTER_DEPTH)))) - 1 downto 0;
	
	type BUFF_ARR		is array (0 to FILTER_DEPTH-1) of std_logic_vector(DATA_RANGE);

end user_pkg;