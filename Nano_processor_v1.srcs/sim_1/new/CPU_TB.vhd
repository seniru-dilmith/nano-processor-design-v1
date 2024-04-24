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
               Zero: out STD_LOGIC;
               DataSel : out STD_LOGIC;
               regSel : out STD_LOGIC_VECTOR(2 downto 0);
               regData : out STD_LOGIC_VECTOR(3 downto 0);
               InsId : out STD_LOGIC_VECTOR(2 downto 0);
               Ins : out STD_LOGIC_VECTOR(11 downto 0);
               ImValue : out STD_LOGIC_VECTOR(3 downto 0);
               AUout : out STD_LOGIC_VECTOR(3 downto 0); 
               reg_0_out_check: out STD_LOGIC_VECTOR (3 downto 0);
               reg_1_out_check: out STD_LOGIC_VECTOR (3 downto 0);
               reg_2_out_check: out STD_LOGIC_VECTOR (3 downto 0);
               reg_3_out_check: out STD_LOGIC_VECTOR (3 downto 0);
               reg_4_out_check: out STD_LOGIC_VECTOR (3 downto 0);
               reg_5_out_check: out STD_LOGIC_VECTOR (3 downto 0);
               reg_6_out_check: out STD_LOGIC_VECTOR (3 downto 0);
               reg_7_out_check: out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;

    -- Signals for testbench
    signal Clk_TB: STD_LOGIC := '0';
    signal Reset_TB: STD_LOGIC := '0';
    signal OverFlow_TB, Zero_TB, LoadSel: STD_LOGIC;
    signal regEn,Iindex : STD_LOGIC_VECTOR(2 downto 0);
    signal I : STD_LOGIC_VECTOR(11 downto 0);
    signal Im, AU, reg_0_out_check_TB, reg_1_out_check_TB, reg_2_out_check_TB, reg_3_out_check_TB, reg_4_out_check_TB, reg_5_out_check_TB, reg_6_out_check_TB, reg_7_out_check_TB, RegData: STD_LOGIC_VECTOR (3 downto 0);

begin

    -- Instantiate the CPU
    UUT: CPU port map(
        Clk => Clk_TB,
        Reset => Reset_TB,
        OverFlow => OverFlow_TB,
        Zero => Zero_TB,
        DataSel => LoadSel,
        regSel => regEn,
        regData => RegData,
        InsId => Iindex,
        Ins => I,
        ImValue => Im,
        AUout => AU,
        reg_0_out_check => reg_0_out_check_TB,
        reg_1_out_check => reg_1_out_check_TB,
        reg_2_out_check => reg_2_out_check_TB,
        reg_3_out_check => reg_3_out_check_TB,
        reg_4_out_check => reg_4_out_check_TB,
        reg_5_out_check => reg_5_out_check_TB,
        reg_6_out_check => reg_6_out_check_TB,
        reg_7_out_check => reg_7_out_check_TB
    );

    -- Clock process
    ClkProcess: process
    begin
        Clk_TB <= '0';
        wait for 50 ns;
        Clk_TB <= '1';
        wait for 50 ns;
    end process ClkProcess;

    process begin
    Reset_TB <= '1';
    wait for 100 ns;
    Reset_TB <= '0';
    wait;
    end process;
    
end Behavioral;

