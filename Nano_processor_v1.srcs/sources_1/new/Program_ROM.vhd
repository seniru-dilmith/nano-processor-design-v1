----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.04.2024 22:16:10
-- Design Name: 
-- Module Name: Program_ROM - Behavioral
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

entity Program_ROM is
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (11 downto 0));
end Program_ROM;

architecture Behavioral of Program_ROM is

type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);

    signal Instructions : rom_type := (
        "101110001010", --0  MOVI R7 , 10  
        "100100000001", --1  MOVI R2 , 1
        "010100000000", --2  NEG R2
        "001110100000", --3  ADD R7 , R2
        "111110000111", --4  JZR R7 , 7
        "110000000011", --5  JZR R0 , 3
        "000000000000", --6  NULL
        "000000000000"  --7  NULL

--        "000010000000",
--        "101010000101",
--        "000000000000",
--        "000000000000",
--        "000000000000",
--        "100110001010", -- 0 mov 1,10
--        "100100110001", -- 1 mov 2,1
----        "010100000000", -- 2 neg 2
--        "000110100000" -- 3 add 1,2
--        "110110000111", -- 4 jzr 1,7
--        "110000000100", -- 5 jzr 0,3
         -- 6 add 0,0
--        "000000000000"  -- 7 add 0,0
    --           "000000000000",
    --           "111111111111",
    --           "101010101010",
    --           "110011001100",
    --           "110111001110",
    --           "100111101110",
    --           "100111000110",
    --           "100111011110"
    );

begin

    data <= Instructions(to_integer(unsigned(address)));

end Behavioral;
