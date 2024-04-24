----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.04.2024 23:04:52
-- Design Name: 
-- Module Name: Processor - Behavioral
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

entity Processor is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           LED : out STD_LOGIC_VECTOR (3 downto 0);
           LED1 : out STD_LOGIC_VECTOR (3 downto 0);
           LED2 : out STD_LOGIC_VECTOR (3 downto 0);
           LED3: out STD_LOGIC_VECTOR (3 downto 0);
           LED4 : out STD_LOGIC_VECTOR (3 downto 0);
           LED5 : out STD_LOGIC_VECTOR (3 downto 0);
           LED6 : out STD_LOGIC_VECTOR (3 downto 0);
           LED7 : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC);
end Processor;

architecture Behavioral of Processor is

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
            Port ( 
                In0 : in STD_LOGIC_VECTOR (3 downto 0);
                In1 : in STD_LOGIC_VECTOR (3 downto 0);
                Sel : in STD_LOGIC;
                Output : out STD_LOGIC_VECTOR (3 downto 0));
     end component;
     
     component Instruction_Decoder is
             Port ( 
                Ins_Bus : in STD_LOGIC_VECTOR (11 downto 0);
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
      
      component Three_Bit_Adder
              port (
                  A    : in  std_logic_vector(2 downto 0);
                  B    : in  std_logic_vector(2 downto 0);
                  Cin  : in  std_logic;
                  S    : out std_logic_vector(2 downto 0);
                  Cout : out std_logic
              );
          end component;
          
       component Two_way_3_bit_MuX is
              Port ( In0 : in STD_LOGIC_VECTOR (2 downto 0);
                     In1 : in STD_LOGIC_VECTOR (2 downto 0);
                     Sel : in STD_LOGIC;
                     Output : out STD_LOGIC_VECTOR (2 downto 0));
          end component;
          
       component Program_ROM
              Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
                     data : out STD_LOGIC_VECTOR (11 downto 0));
          end component;
          
       component Program_counter
                  Port (
                      Reset : in STD_LOGIC;
                      Clk : in STD_LOGIC;
                      In_Address : in STD_LOGIC_VECTOR (2 downto 0);
                      Out_Address : out STD_LOGIC_VECTOR (2 downto 0)
                  );
              end component; 
    
    --Control Signals
    Signal RegSel, AU_in_1_sel, AU_in_2_sel, JumpAddress, MemSel, PC_plus_1, PC_in : STD_LOGIC_VECTOR(2 downto 0);
    Signal Substract, LoadSel, JumpFlag, PC_Cout : STD_LOGIC;
    
    --Data Signals
        --RegisterBank
        Signal DataToLoad, Reg_0_Data, Reg_1_Data, Reg_2_Data, Reg_3_Data, Reg_4_Data, Reg_5_Data, Reg_6_Data, Reg_7_Data : STD_LOGIC_VECTOR(3 downto 0);
    
        --AU
        Signal AU_in_1, AU_in_2, AU_out : STD_LOGIC_VECTOR(3 downto 0);
        Signal NegPos: STD_LOGIC;
    
        --Instruction Decoder
        Signal imd_value : STD_LOGIC_VECTOR(3 downto 0);
        Signal I : STD_LOGIC_VECTOR(11 downto 0);

begin
RegBank : Register_Bank
    port map(DataToLoad, Reset, Clk, RegSel, Reg_0_Data, Reg_1_Data, Reg_2_Data, Reg_3_Data, Reg_4_Data, Reg_5_Data, Reg_6_Data, Reg_7_Data);
    
AUinput_1_selector : Eight_way_4_bit_Mux
    port map(AU_in_1_sel, Reg_0_Data, Reg_1_Data, Reg_2_Data, Reg_3_Data, Reg_4_Data, Reg_5_Data, Reg_6_Data, Reg_7_Data, AU_in_1);

AUinput_2_selector : Eight_way_4_bit_Mux
    port map(AU_in_2_sel, Reg_0_Data, Reg_1_Data, Reg_2_Data, Reg_3_Data, Reg_4_Data, Reg_5_Data, Reg_6_Data, Reg_7_Data, AU_in_2);
    
AU : Add_Sub_Unit
    port map(AU_in_1, AU_in_2, Substract, AU_out, Overflow, NegPos, Zero);
    
LoadSelector : Two_way_4_bit_Mux
    port map(imd_value, AU_out, LoadSel, DataToLoad);
    
InsDecoder : Instruction_Decoder
    port map(I, AU_in_1, RegSel, LoadSel, imd_value, AU_in_1_sel, AU_in_2_sel, Substract, JumpFlag, JumpAddress);
    
PC_increaser : Three_Bit_Adder
    port map(MemSel, "001", '0', PC_plus_1, PC_Cout);
    
PC_value_selector : Two_way_3_bit_MuX
    port map(PC_plus_1, JumpAddress, JumpFlag, PC_in);
   
PROM : Program_ROM
    port map(MemSel, I);
    
PC : Program_counter
    port map(Reset, Clk, PC_in, MemSel);
    
    LED <= Reg_0_Data;
    LED1 <= Reg_1_Data;
    LED2 <= Reg_2_Data;
    LED3 <= Reg_3_Data;
    LED4 <= Reg_4_Data;
    LED5 <= Reg_5_Data;
    LED6 <= Reg_6_Data;
    LED7 <= Reg_7_Data;

end Behavioral;
