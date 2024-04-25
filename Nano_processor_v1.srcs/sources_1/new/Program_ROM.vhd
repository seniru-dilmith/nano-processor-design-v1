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

        "101110000001", --0  MOVI R7 , 1
        "101100000010", --1  MOVI R6 , 2
        "101010000011", --2  MOVI R5 , 3
        "001111100000", --3  ADD R7 , R6
        "001111010000", --4  ADD R7 , R5
        "110000000000", --5  JZR R0 , 0
        "000000000000", --6  NULL
        "000000000000"  --7  NULL
    );

begin

    data <= Instructions(to_integer(unsigned(address)));

end Behavioral;
