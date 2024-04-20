----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/16/2024 02:03:00 PM
-- Design Name: 
-- Module Name: TB_Three_Bit_Adder - Behavioral
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

entity TB_Three_Bit_Adder is
end TB_Three_Bit_Adder;

architecture behavior of TB_Three_Bit_Adder is
    -- Component Declaration for the Unit Under Test (UUT)
    component Three_BIt_Adder
        port (
            A    : in  std_logic_vector(2 downto 0);
            B    : in  std_logic_vector(2 downto 0);
            Cin  : in  std_logic;
            S    : out std_logic_vector(2 downto 0);
            Cout : out std_logic
        );
    end component;

    -- Inputs
    signal A    : std_logic_vector(2 downto 0);
    signal B    : std_logic_vector(2 downto 0);
    signal Cin  : std_logic;

    -- Outputs
    signal S    : std_logic_vector(2 downto 0);
    signal Cout : std_logic;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: Three_BIt_Adder port map (
        A    => A,
        B    => B,
        Cin  => Cin,
        S    => S,
        Cout => Cout
    );

    -- Stimulus process
    stim_proc: process
    begin
        -- hold reset state for 10 ns
        wait for 10 ns;

        -- Test case 1
        A <= "001";
        B <= "011";
        Cin <= '0';
        wait for 10 ns;

        -- Test case 2
        A <= "001";
        B <= "011";
        Cin <= '0';
        wait for 10 ns;

        -- Additional test cases can be added here

        -- End simulation
        wait for 10 ns;
        wait;

    end process;

end behavior;
