----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/21/2024 06:57:28 PM
-- Design Name: 
-- Module Name: LUT_16_7 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LUT_16_7 is
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end LUT_16_7;

architecture Behavioral of LUT_16_7 is

    type rom_type is array (0 to 15) of std_logic_vector(6 downto 0);
        signal sevenSegment_ROM : rom_type := (
                            "1000000",      --0
                            "1111001",      --1
                            "0100100",      --2      
                            "0110000",      --3
                            "0011001",      --4
                            "0010010",      --5
                            "0000010",      --6
                            "1111000",      --7
                            "0000000",      --8
                            "0010000",      --9
                            "0001000",      --A
                            "0000011",      --b
                            "1000110",      --C
                            "0100001",      --d    
                            "0000110",      --E
                            "0001110"       --F
    
    );

begin

    data <= sevenSegment_ROM(to_integer(unsigned(address)));


end Behavioral;
