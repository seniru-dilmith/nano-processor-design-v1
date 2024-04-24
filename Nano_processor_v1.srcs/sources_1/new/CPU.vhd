----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/20/2024 07:05:27 PM
-- Design Name: 
-- Module Name: CPU - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CPU is
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
end CPU;

architecture Behavioral of CPU is

component Register_Bank is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);  -- Input data for all registers
           Res : in STD_LOGIC;  -- Reset signal for all registers
           Clk : in STD_LOGIC;  -- Clock signal for all registers
           Register_Select : in STD_LOGIC_VECTOR (2 downto 0); -- Selects which register to load data into
           R_0_val : out STD_LOGIC_VECTOR (3 downto 0);
           R_1_val : out STD_LOGIC_VECTOR (3 downto 0);
           R_2_val : out STD_LOGIC_VECTOR (3 downto 0);
           R_3_val : out STD_LOGIC_VECTOR (3 downto 0);
           R_4_val : out STD_LOGIC_VECTOR (3 downto 0);
           R_5_val : out STD_LOGIC_VECTOR (3 downto 0);
           R_6_val : out STD_LOGIC_VECTOR (3 downto 0);
           R_7_val : out STD_LOGIC_VECTOR (3 downto 0)
           );  -- Output data from selected register
end component;

component Eight_way_4_bit_Mux is
    Port ( Sel : in STD_LOGIC_VECTOR (2 downto 0);
           In0 : in STD_LOGIC_VECTOR (3 downto 0);
           In1 : in STD_LOGIC_VECTOR (3 downto 0);
           In2 : in STD_LOGIC_VECTOR (3 downto 0);
           In3 : in STD_LOGIC_VECTOR (3 downto 0);
           In4 : in STD_LOGIC_VECTOR (3 downto 0);
           In5 : in STD_LOGIC_VECTOR (3 downto 0);
           In6 : in STD_LOGIC_VECTOR (3 downto 0);
           In7 : in STD_LOGIC_VECTOR (3 downto 0);
           Output : out STD_LOGIC_VECTOR (3 downto 0));
end component;

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

component Two_way_4_bit_Mux is
    Port ( In0 : in STD_LOGIC_VECTOR (3 downto 0);
           In1 : in STD_LOGIC_VECTOR (3 downto 0);
           output : out STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC);
end component;

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

component Three_Bit_Adder is
    Port (
        A    : in  STD_LOGIC_VECTOR (2 downto 0);
        B    : in  STD_LOGIC_VECTOR (2 downto 0);
        Cin  : in  STD_LOGIC;
        S    : out STD_LOGIC_VECTOR (2 downto 0);
        Cout : out STD_LOGIC
    );
end component;

component Program_ROM is
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (11 downto 0));
end component;

component Two_way_3_bit_Mux is
    Port ( In0 : in STD_LOGIC_VECTOR (2 downto 0);
           In1 : in STD_LOGIC_VECTOR (2 downto 0);
           Sel : in STD_LOGIC;
           Output : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component Program_counter is
    Port ( Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           In_Address : in STD_LOGIC_VECTOR (2 downto 0);
           Out_Address : out STD_LOGIC_VECTOR (2 downto 0)
           );
end component;

--component Slow_Clk is
--    Port ( Clk_in : in STD_LOGIC;
--           Clk_out : out STD_LOGIC);
--end component;

signal Load_Sel :  STD_LOGIC;  --Load Selector
signal Global_Clk :  STD_LOGIC;  --Clock for every component
signal D :  STD_LOGIC_VECTOR(3 downto 0);  --Resgister Memory Input Bus
signal I :  STD_LOGIC_VECTOR(11 downto 0); --Instruction Bus
signal M :  STD_LOGIC_VECTOR(3 downto 0);  --Add_Sub_Unit Output Bus
signal R :  STD_LOGIC_VECTOR(3 downto 0);  --Immediate Value Bus
signal Reg_EN :  STD_LOGIC_VECTOR(2 downto 0);  --Register Selector Bus
signal R_0_out, R_1_out, R_2_out, R_3_out, R_4_out, R_5_out, R_6_out, R_7_out :  STD_LOGIC_VECTOR(3 downto 0);  --Register Memory Output Bus
signal Eight_way_mux0_out, Eight_way_mux1_out :  STD_LOGIC_VECTOR(3 downto 0);  -- 8 Way 4 Bit Mux Output Bus
signal Address_to_Execute :  STD_LOGIC_VECTOR(2 downto 0);  -- Address of the Next Instruction
signal Eight_way_mux0_Sel, Eight_way_mux1_Sel :  STD_LOGIC_VECTOR(2 downto 0);  -- 8 Way 4 Bit Mux Line Selector
signal Memory_Selector :  STD_LOGIC_VECTOR(2 downto 0);  -- Memory Selector for PROM
signal Ins_Address_frm_Adder :  STD_LOGIC_VECTOR(2 downto 0);  -- Current Address Incremented by 1 bus
signal Ins_Address_frm_Pgram :  STD_LOGIC_VECTOR(2 downto 0);  -- Current Address Incremented by 1 bus
signal Add_Sub_Sel : STD_LOGIC; --  Add/Sub Selector for Add/Sub Unit
signal Ins_Jmp : STD_LOGIC; --  Jump Instruction is Detected or Not


begin

reg_0_out_check <= R_0_out;
reg_1_out_check <= R_1_out;
reg_2_out_check <= R_2_out;
reg_3_out_check <= R_3_out;
reg_4_out_check <= R_4_out;
reg_5_out_check <= R_5_out;
reg_6_out_check <= R_6_out;
reg_7_out_check <= R_7_out;

regSel <= Reg_EN;
regData <= D;
InsId <= Memory_Selector;
Ins <= I;
ImValue <= R;
AUout <= M;
DataSel <= Load_sel;

--slw_clk : Slow_Clk port map(
--             Clk_in => Clk,
--             Clk_out => Global_Clk
--            ); 



reg_bank : Register_Bank port map( 
           D => D, 
           Res => Reset, 
           Clk => Clk, 
           Register_Select => Reg_EN, 
           R_0_val => R_0_out, 
           R_1_val => R_1_out, 
           R_2_val => R_2_out, 
           R_3_val => R_3_out, 
           R_4_val => R_4_out, 
           R_5_val => R_5_out, 
           R_6_val => R_6_out, 
           R_7_val => R_7_out
           );
        

mux_8_way_4bit_0 : Eight_way_4_bit_Mux port map(
           Sel => Eight_way_mux0_Sel,
           In0 => R_0_out,
           In1 => R_1_out,
           In2 => R_2_out,
           In3 => R_3_out,
           In4 => R_4_out,
           In5 => R_5_out,
           In6 => R_6_out,
           In7 => R_7_out,
           Output => Eight_way_mux0_out
           );
           
mux_8_way_4bit_1 : Eight_way_4_bit_Mux port map(
           Sel => Eight_way_mux1_Sel,
           In0 => R_0_out,
           In1 => R_1_out,
           In2 => R_2_out,
           In3 => R_3_out,
           In4 => R_4_out,
           In5 => R_5_out,
           In6 => R_6_out,
           In7 => R_7_out,
           Output => Eight_way_mux1_out
          );

add_sub_unit_4bit : Add_Sub_Unit port map(
           A => Eight_way_mux0_out,
           B => Eight_way_mux1_out,
           Sel => Add_Sub_Sel,
           Sum => M,
           C_out => OverFlow,
           Zero => Zero 
           );
           


mux_2_way_4bit : Two_way_4_bit_Mux port map(
           In0 => M,
           In1 => R,
           output => D,
           Sel => Load_Sel
           );

Ins_dec : Instruction_Decoder port map(
           Ins_Bus => I, 
           Reg_Chk_Jmp => Eight_way_mux0_out , 
           Reg_En => Reg_EN, 
           Load_Sel => Load_Sel , 
           Imm_Val => R, 
           Reg_Sel1 => Eight_way_mux0_Sel , 
           Reg_Sel2 => Eight_way_mux1_Sel , 
           Add_Sub_Sel => Add_Sub_Sel,
           Jmp => Ins_Jmp, 
           Jmp_Add => Ins_Address_frm_Pgram 
           );

adder_3bit : Three_Bit_Adder port map(
           A => Memory_Selector, 
           B => "001", 
           Cin => '0', 
           S => Ins_Address_frm_Adder
           );

PROM : Program_ROM port map(
           address => Memory_Selector, 
           data => I 
           );

mux_2_way_3bit : Two_way_3_bit_Mux port map(
           In0 => Ins_Address_frm_Adder, 
           In1 => Ins_Address_frm_Pgram, 
           Sel => Ins_Jmp, 
           Output => Address_to_Execute 
           );

PC : Program_counter port map(
           Reset => Reset,
           Clk => Clk, 
           In_Address => Address_to_Execute, 
           Out_Address => Memory_Selector
           );

end Behavioral;
