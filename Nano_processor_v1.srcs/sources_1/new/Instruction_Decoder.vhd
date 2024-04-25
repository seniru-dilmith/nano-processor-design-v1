----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.04.2024 19:30:50
-- Design Name: 
-- Module Name: Instruction_Decoder - Behavioral
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

entity Instruction_Decoder is
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
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is

begin
    process (Ins_Bus, Reg_Chk_Jmp) begin
        Reg_En <= Ins_Bus(9 downto 7);  -- register enable signal
        case Ins_Bus(11 downto 10) is
            -- connectiong to different lines based o the instruction type
            when "00" =>
                Load_Sel <= '1';
                Reg_Sel1 <= Ins_Bus(9 downto 7);
                Reg_Sel2 <= Ins_Bus(6 downto 4);
                Add_Sub_Sel <= '0';
                Jmp <= '0';
                
            when "01" =>
                Load_Sel <= '1';
                Reg_Sel1 <= "000";
                Add_Sub_Sel <= '1';
                Reg_Sel2 <= Ins_Bus(9 downto 7);
                Jmp <= '0';
                Add_Sub_Sel <= '1';
                
            when "10" =>
                Load_Sel <= '0';
                Imm_Val <= Ins_Bus(3 downto 0);
                Jmp <= '0';
            
            when "11" =>
                Load_Sel <= '0';
                Reg_Sel1 <= Ins_Bus(9 downto 7);
                Imm_Val <= Reg_Chk_Jmp;
                if (Reg_Chk_Jmp = "0000") then
                    Jmp <= '1';
                    Jmp_Add <= Ins_Bus(2 downto 0);
                else
                    Jmp <= '0';
                end if;
            when others =>
                -- all the possible cases are mentioned sbove
        end case;
    end process;

    
end Behavioral;


