----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/16/2024 01:54:21 PM
-- Design Name: 
-- Module Name: Three_BIt_Adder - Behavioral
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

entity Three_Bit_Adder is
    Port (
        A    : in  STD_LOGIC_VECTOR (2 downto 0);  -- input bus 1
        B    : in  STD_LOGIC_VECTOR (2 downto 0);  -- input bus 2
        Cin  : in  STD_LOGIC;  -- carry in
        S    : out STD_LOGIC_VECTOR (2 downto 0); -- result sum
        Cout : out STD_LOGIC  -- carry out
    );
end Three_BIt_Adder;
 
architecture Behavioral of Three_BIt_Adder is
component FA is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S : out STD_LOGIC;
           C_out : out STD_LOGIC);
end component;

    signal c1, c2 : STD_LOGIC;
    signal P, G   : STD_LOGIC_VECTOR(2 downto 0);
begin

    FA1: FA port map (A(0), B(0), Cin, S(0), c1);
    FA2: FA port map (A(1), B(1), c1, S(1), c2);
    FA3: FA port map (A(2), B(2), c2, S(2), Cout);
    
end Behavioral;
