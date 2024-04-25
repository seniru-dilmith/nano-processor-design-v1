----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2024 08:06:46 PM
-- Design Name: 
-- Module Name: Add_Sub_Unit - Behavioral
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

entity Add_Sub_Unit is
    Port ( 
        A : in STD_LOGIC_VECTOR (3 downto 0);  -- line 1
        B : in STD_LOGIC_VECTOR (3 downto 0);  -- line 2
        Sel : in STD_LOGIC; -- line selector bit
        Sum : out STD_LOGIC_VECTOR (3 downto 0);  -- output of the add-sub-unit
        C_out : out STD_LOGIC;  -- carry of the result 
        Pos_or_Neg : out STD_LOGIC;  -- result is negative or positive
        Zero : out STD_LOGIC  -- zero flag
    );
end Add_Sub_Unit;

architecture Behavioral of Add_Sub_Unit is

-- previously created full adder
component FA
     port (
         A: in std_logic;
         B: in std_logic;
         C_in: in std_logic;
         S: out std_logic;
         C_out: out std_logic);
 end component;

 SIGNAL FA0_S, FA0_C, FA1_S, FA1_C, FA2_S, FA2_C, FA3_S, FA3_C  : std_logic; -- carry of the each full adder
 SIGNAL B0, B1, B2, B3  : std_logic; -- second input for the full adders
 SIGNAL C_out_1  : std_logic; -- final carry bit
 SIGNAL S_out  : std_logic_vector (3 downto 0);  -- final sum 

begin

    B0 <= B(0) XOR Sel; 
    B1 <= B(1) XOR Sel; 
    B2 <= B(2) XOR Sel; 
    B3 <= B(3) XOR Sel; 
    
    FA_0 : FA
        port map (
            A => A(0),
            B => B0,
            C_in => Sel, 
            S => Sum(0),
            C_Out => FA0_C);
     FA_1 : FA
        port map (
            A => A(1),
            B => B1,
            C_in => FA0_C,
            S => Sum(1),
            C_Out => FA1_C);
     FA_2 : FA
        port map (
            A => A(2),
            B => B2,
            C_in => FA1_C,
            S => Sum(2),
            C_Out => FA2_C);
     FA_3 : FA
        port map (
            A => A(3),
            B => B3,
            C_in => FA2_C,
            S => Sum(3),
            C_Out => C_out);

            C_out_1 <= (FA2_C AND (A(3) XOR B3)) OR (A(3) AND B3);
            
            S_out(0) <= A(0) XOR B0 XOR Sel;
            S_out(1) <= A(1) XOR B1 XOR FA0_C;
            S_out(2) <= A(2) XOR B2 XOR FA1_C;
            S_out(3) <= A(3) XOR B3 XOR FA2_C;
        
    -- positive or negative result calculation
    Pos_or_Neg <= (NOT C_out_1) AND Sel; 
    -- zero flag calculation
    Zero <= (NOT S_out(0)) AND (NOT S_out(1)) AND (NOT S_out(2)) AND (NOT S_out(3)) AND (NOT C_out_1);

end Behavioral;
