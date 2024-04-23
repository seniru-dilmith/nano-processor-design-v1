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
               load_sela: out STD_LOGIC;
               add_sub_sela: out STD_LOGIC;
               jump_flag: out STD_LOGIC;
               reg_ena : out STD_LOGIC_VECTOR(2 downto 0);
               reg_sel1 : out STD_LOGIC_VECTOR(2 downto 0);
               reg_sel2 : out STD_LOGIC_VECTOR(2 downto 0);
               add_to_jmp : out STD_LOGIC_VECTOR(2 downto 0);
               imm_value : out STD_LOGIC_VECTOR(3 downto 0);
               reg1_out : out STD_LOGIC_VECTOR(3 downto 0)
               
        );
    end component;

    -- Signals for testbench
    signal Clk_TB: STD_LOGIC := '0';
    signal Reset_TB: STD_LOGIC := '0';
    signal OverFlow_TB, Zero_TB,load_sel_TB,add_sub_sel_TB,jump_flag_TB: STD_LOGIC;
    signal reg_en_TB,reg_sel1_TB, reg_sel2_TB,add_to_jmp_TB : STD_LOGIC_VECTOR(2 downto 0); 
    signal imm_value_TB, reg1_out_TB: STD_LOGIC_VECTOR(3 downto 0); 

begin

    -- Instantiate the CPU
    UUT: CPU port map(
        Clk => Clk_TB,
        Reset => Reset_TB,
        OverFlow => OverFlow_TB,
        Zero => Zero_TB,
        load_sela => load_sel_TB,
        add_sub_sela => add_sub_sel_TB,
        jump_flag => jump_flag_TB,
        reg_ena => reg_en_TB,
        reg_sel1 => reg_sel1_TB,
        reg_sel2 => reg_sel2_TB,
        add_to_jmp => add_to_jmp_TB,
        imm_value => imm_value_TB,
        reg1_out => reg1_out_TB
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
