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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_Add_Sub_Unit is
--  Port ( );
end TB_Add_Sub_Unit;

architecture Behavioral of TB_Add_Sub_Unit is

COMPONENT Add_Sub_Unit
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
        B : in STD_LOGIC_VECTOR (3 downto 0);
        Sel : in STD_LOGIC;
        Sum : out STD_LOGIC_VECTOR (3 downto 0);
        C_out : out STD_LOGIC;
        Zero : out STD_LOGIC
);

END COMPONENT;
 
--Inputs
signal A : std_logic_vector(3 downto 0);
signal B : std_logic_vector(3 downto 0);
signal Sel : std_logic;
signal Zero : std_logic;
 
--Outputs
signal Sum : std_logic_vector(3 downto 0);
signal C_out : std_logic;
 
BEGIN
 
-- Instantiate the Unit Under Test (UUT)
uut: Add_Sub_Unit PORT MAP (
A => A,
B => B,
Sel => Sel,
Sum => Sum,
C_out => C_out,
Zero => Zero
);
 
-- Stimulus process
stim_proc: process
begin
-- hold reset state for 100 ns.
wait for 10 ns;
 
A <= "0011";
B <= "0100";
Sel <= '1';
 
wait for 10 ns;
 
--A <= "1010";
--B <= "0111";
--Sel <= '0';
 
wait for 10 ns;
 
--A <= "1000";
--B <= "1001";
--Sel <= '0';
 
wait;
 
end process;
 
END;
