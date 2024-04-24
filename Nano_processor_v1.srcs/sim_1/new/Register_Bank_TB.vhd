----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.04.2024 23:22:20
-- Design Name: 
-- Module Name: Register_Bank_TB - Behavioral
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

entity Register_Bank_TB is
end Register_Bank_TB;

architecture Behavioral of Register_Bank_TB is
    -- Component declaration for the Register_Bank module
    component Register_Bank is
        Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
               Res : in STD_LOGIC;
               Clk : in STD_LOGIC;
               Register_Select : in STD_LOGIC_VECTOR (2 downto 0);
               R_0_val : out STD_LOGIC_VECTOR (3 downto 0);
               R_1_val : out STD_LOGIC_VECTOR (3 downto 0);
               R_2_val : out STD_LOGIC_VECTOR (3 downto 0);
               R_3_val : out STD_LOGIC_VECTOR (3 downto 0);
               R_4_val : out STD_LOGIC_VECTOR (3 downto 0);
               R_5_val : out STD_LOGIC_VECTOR (3 downto 0);
               R_6_val : out STD_LOGIC_VECTOR (3 downto 0);
               R_7_val : out STD_LOGIC_VECTOR (3 downto 0)
               );
    end component;

    -- Signals for testbench
    signal D_tb : STD_LOGIC_VECTOR (3 downto 0);
    signal Res_tb : STD_LOGIC := '1';  -- Initially asserted
    signal Clk_tb : STD_LOGIC := '0';
    signal Register_Select_tb : STD_LOGIC_VECTOR (2 downto 0) := "000";
    signal R_0_val_tb, R_1_val_tb, R_2_val_tb, R_3_val_tb : STD_LOGIC_VECTOR (3 downto 0);
    signal R_4_val_tb, R_5_val_tb, R_6_val_tb, R_7_val_tb : STD_LOGIC_VECTOR (3 downto 0);

begin

    -- Instantiate the Register_Bank module
    UUT : Register_Bank port map (
        D => D_tb,
        Res => Res_tb,
        Clk => Clk_tb,
        Register_Select => Register_Select_tb,
        R_0_val => R_0_val_tb,
        R_1_val => R_1_val_tb,
        R_2_val => R_2_val_tb,
        R_3_val => R_3_val_tb,
        R_4_val => R_4_val_tb,
        R_5_val => R_5_val_tb,
        R_6_val => R_6_val_tb,
        R_7_val => R_7_val_tb
    );

    -- Clock process
    clk_process: process
    begin
        Clk_tb <= '0';
        wait for 5 ns;
        Clk_tb <= '1';
        wait for 5 ns;
    end process;

    -- Stimulus process
    process
    begin
       Res_tb <= '1';  -- Assert reset
       wait for 10 ns;
       Res_tb <= '0';  -- De-assert reset
       wait for 240ns;
       
       Res_tb <= '1';  -- Assert reset
       wait for 10 ns;
       Res_tb <= '0';  -- De-assert reset
       wait;
        
    end process;
    
    stimulus: process
    begin

        -- Test Case 2: Change input data and register selection
        D_tb <= "1010";
        Register_Select_tb <= "001";
        wait for 20 ns;

        -- Test Case 3: Change input data and register selection
        D_tb <= "0011";
        Register_Select_tb <= "100";
        wait for 20 ns;

        -- Test Case 4: Apply reset again

        -- Test Case 5: Change input data and register selection
        D_tb <= "1100";
        Register_Select_tb <= "010";
        wait for 20 ns;

        -- Test Case 6: Change input data and register selection
        D_tb <= "0101";
        Register_Select_tb <= "110";
        wait for 20 ns;

        -- Test Case 7: Change input data and register selection
        D_tb <= "1111";
        Register_Select_tb <= "101";
        wait for 20 ns;

        -- Test Case 8: Change input data and register selection
        D_tb <= "1001";
        Register_Select_tb <= "011";
        wait for 20 ns;

        -- Test Case 9: Change input data and register selection
        D_tb <= "0110";
        Register_Select_tb <= "111";
        wait for 20 ns;

        -- Test Case 10: Change input data and register selection
        D_tb <= "0100";
        Register_Select_tb <= "000";
        wait for 20 ns;
        
        D_tb <= "0111";
        Register_Select_tb <= "001";
        wait for 20 ns;
                
        D_tb <= "0010";
        Register_Select_tb <= "001";
        wait for 20 ns;
        
        wait;
    end process;

end Behavioral;



