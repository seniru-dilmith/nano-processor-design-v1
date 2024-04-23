----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2024 08:35:40 PM
-- Design Name: 
-- Module Name: TB_Add_Sub_Unit - Behavioral
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

entity TB_Add_Sub_Unit is
end TB_Add_Sub_Unit;

architecture Behavioral of TB_Add_Sub_Unit is
    -- Component declaration for the Add_Sub_Unit module
    component Add_Sub_Unit is
        Port ( 
            A : in STD_LOGIC_VECTOR (3 downto 0);
            B : in STD_LOGIC_VECTOR (3 downto 0);
            Sel : in STD_LOGIC;
            Sum : out STD_LOGIC_VECTOR (3 downto 0);
            C_out : out STD_LOGIC;
            Pos_or_Neg : out STD_LOGIC;
            Zero : out STD_LOGIC
        );
    end component;

    -- Signals for testbench
    signal A_tb, B_tb : STD_LOGIC_VECTOR (3 downto 0);
    signal Sel_tb : STD_LOGIC;
    signal Sum_tb : STD_LOGIC_VECTOR (3 downto 0);
    signal C_out_tb, Pos_or_Neg_tb, Zero_tb : STD_LOGIC;

begin

    -- Instantiate the Add_Sub_Unit module
    UUT : Add_Sub_Unit port map (
        A => A_tb,
        B => B_tb,
        Sel => Sel_tb,
        Sum => Sum_tb,
        C_out => C_out_tb,
        Pos_or_Neg => Pos_or_Neg_tb,
        Zero => Zero_tb
    );

    -- Stimulus process
    stimulus: process
    begin
        -- Test Case 1: Addition (Sel = '0')
        A_tb <= "0010";
        B_tb <= "0001";
        Sel_tb <= '0';
        wait for 10 ns;

        -- Test Case 2: Subtraction (Sel = '1')
        A_tb <= "0101";
        B_tb <= "0011";
        Sel_tb <= '1';
        wait for 10 ns;

        -- Test Case 3: Addition (Sel = '0')
        A_tb <= "1111";
        B_tb <= "1010";
        Sel_tb <= '0';
        wait for 10 ns;

        -- Test Case 4: Subtraction (Sel = '1')
        A_tb <= "0100";
        B_tb <= "0011";
        Sel_tb <= '1';
        wait for 10 ns;

        -- Test Case 5: Addition (Sel = '0')
        A_tb <= "1111";
        B_tb <= "0001";
        Sel_tb <= '0';
        wait for 10 ns;

        -- Test Case 6: Subtraction (Sel = '1')
        A_tb <= "0000";
        B_tb <= "0101";
        Sel_tb <= '1';
        wait for 10 ns;

        -- Test Case 7: Addition (Sel = '0')
        A_tb <= "1100";
        B_tb <= "0011";
        Sel_tb <= '0';
        wait for 10 ns;

        -- Test Case 8: Subtraction (Sel = '1')
        A_tb <= "1000";
        B_tb <= "0100";
        Sel_tb <= '1';
        wait for 10 ns;

        -- Test Case 9: Addition (Sel = '0')
        A_tb <= "1010";
        B_tb <= "1100";
        Sel_tb <= '0';
        wait for 10 ns;

        -- Test Case 10: Subtraction (Sel = '1')
        A_tb <= "0111";
        B_tb <= "0101";
        Sel_tb <= '1';
        wait for 10 ns;

        wait;
    end process;

end Behavioral;

