----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/20/2024 07:06:08 PM
-- Design Name: 
-- Module Name: CPU_TB - Behavioral
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

entity CPU_TB is
end CPU_TB;

architecture Behavioral of CPU_TB is
    -- Component declarations
    component CPU is
        Port ( Clk : in STD_LOGIC;
               Reset: in STD_LOGIC;
               OverFlow: out STD_LOGIC;
               Zero: out STD_LOGIC
        );
    end component;

    -- Signals for testbench
    signal Clk_TB: STD_LOGIC := '0';
    signal Reset_TB: STD_LOGIC := '0';
    signal OverFlow_TB, Zero_TB: STD_LOGIC;

begin

    -- Instantiate the CPU
    UUT: CPU port map(
        Clk => Clk_TB,
        Reset => Reset_TB,
        OverFlow => OverFlow_TB,
        Zero => Zero_TB
    );

    -- Clock process
    ClkProcess: process
    begin
        Clk_TB <= '0';
        wait for 5 ns;
        Clk_TB <= '1';
        wait for 5 ns;
    end process ClkProcess;

    process begin
    Reset_TB <= '1';
    wait for 10 ns;
    Reset_TB <= '0';
    wait;
    end process;
    
end Behavioral;

