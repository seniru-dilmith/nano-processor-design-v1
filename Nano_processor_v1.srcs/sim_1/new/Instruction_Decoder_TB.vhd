----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.04.2024 21:43:23
-- Design Name: 
-- Module Name: Instruction_Decoder_TB - Behavioral
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

entity Ins_Dec_TB is
--  Port ( );
end Ins_Dec_TB;

architecture Behavioral of Ins_Dec_TB is

    -- Component declaration for the instruction decoder
    component Instruction_Decoder is
        Port ( Ins_Bus : in STD_LOGIC_VECTOR (11 downto 0);
               Reg_Chk_Jmp : in STD_LOGIC_VECTOR (3 downto 0);
               Reg_En : out STD_LOGIC_VECTOR (2 downto 0);
               Load_Sel : out STD_LOGIC;
               Imm_Val : out STD_LOGIC_VECTOR (3 downto 0);
               Reg_Sel1 : out STD_LOGIC_VECTOR (2 downto 0);
               Reg_Sel2 : out STD_LOGIC_VECTOR (2 downto 0);
               Add_Sub_Sel : out STD_LOGIC;
               Jmp : out STD_LOGIC;
               Jmp_Add : out STD_LOGIC_VECTOR (2 downto 0));
    end component;

    -- Signals for testbench
    signal Ins_Bus_tb : STD_LOGIC_VECTOR (11 downto 0);
    signal Reg_Chk_Jmp_tb : STD_LOGIC_VECTOR (3 downto 0);
    signal Reg_En_tb : STD_LOGIC_VECTOR (2 downto 0);
    signal Load_Sel_tb : STD_LOGIC;
    signal Imm_Val_tb : STD_LOGIC_VECTOR (3 downto 0);
    signal Reg_Sel1_tb : STD_LOGIC_VECTOR (2 downto 0);
    signal Reg_Sel2_tb : STD_LOGIC_VECTOR (2 downto 0);
    signal Add_Sub_Sel_tb : STD_LOGIC;
    signal Jmp_tb : STD_LOGIC;
    signal Jmp_Add_tb : STD_LOGIC_VECTOR (2 downto 0);

begin

    -- Instantiate the instruction decoder
    UUT : Instruction_Decoder port map (
        Ins_Bus => Ins_Bus_tb,
        Reg_Chk_Jmp => Reg_Chk_Jmp_tb,
        Reg_En => Reg_En_tb,
        Load_Sel => Load_Sel_tb,
        Imm_Val => Imm_Val_tb,
        Reg_Sel1 => Reg_Sel1_tb,
        Reg_Sel2 => Reg_Sel2_tb,
        Add_Sub_Sel => Add_Sub_Sel_tb,
        Jmp => Jmp_tb,
        Jmp_Add => Jmp_Add_tb
    );

    -- Stimulus process
    stimulus : process
    begin
        -- Test 1
        Ins_Bus_tb <= "100010000001";  -- Ins_Bus = 0
        Reg_Chk_Jmp_tb <= "0011";  
        wait for 10 ns;

        -- Test 2
        Ins_Bus_tb <= "001100110011";  -- Ins_Bus = 3C3
        Reg_Chk_Jmp_tb <= "0001"; 
        wait for 10 ns;

        -- Test 3
        Ins_Bus_tb <= "111011110000";  -- Ins_Bus = AF0
        Reg_Chk_Jmp_tb <= "0000"; 
        wait for 10 ns;
        
        -- Test 4 
        Ins_Bus_tb <= "110000110000";  -- Ins_Bus = AF0
        Reg_Chk_Jmp_tb <= "0011";
        wait for 10 ns;

        -- Add more tests as needed...

        wait;
    end process stimulus;

end Behavioral;

