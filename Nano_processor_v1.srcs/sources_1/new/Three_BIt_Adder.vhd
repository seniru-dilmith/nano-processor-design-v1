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
        A    : in  STD_LOGIC_VECTOR (2 downto 0);
        B    : in  STD_LOGIC_VECTOR (2 downto 0);
        Cin  : in  STD_LOGIC;
        S    : out STD_LOGIC_VECTOR (2 downto 0);
        Cout : out STD_LOGIC
    );
end Three_BIt_Adder;
 
architecture Behavioral of Three_BIt_Adder is
    component Partial_Full_Adder is
        Port (
            A   : in  STD_LOGIC;
            B   : in  STD_LOGIC;
            Cin : in  STD_LOGIC;
            S   : out STD_LOGIC;
            P   : out STD_LOGIC;
            G   : out STD_LOGIC
        );
    end component;

    signal c1, c2 : STD_LOGIC;
    signal P, G   : STD_LOGIC_VECTOR(2 downto 0);
begin
    PFA1: Partial_Full_Adder port map (A(0), B(0), Cin, S(0), P(0), G(0));
    PFA2: Partial_Full_Adder port map (A(1), B(1), c1, S(1), P(1), G(1));
    PFA3: Partial_Full_Adder port map (A(2), B(2), c2, S(2), P(2), G(2));

    c1 <= G(0) OR (P(0) AND Cin);
    c2 <= G(1) OR (P(1) AND G(0)) OR (P(1) AND P(0) AND Cin);
    Cout <= G(2) OR (P(2) AND G(1)) OR (P(2) AND P(1) AND G(0)) OR (P(2) AND P(1) AND P(0) AND Cin);
    
    S(0) <= Cin XOR P(0);
    S(1) <= c1 XOR P(1);
    S(2) <= c2 XOR P(2);
end Behavioral;
