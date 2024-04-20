----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2024 08:02:29 PM
-- Design Name: 
-- Module Name: Eight_way_4_bit_Mux_Tb - Behavioral
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

entity Eight_way_4_bit_Mux_Tb is
--  Port ( );
end Eight_way_4_bit_Mux_Tb;

architecture Behavioral of Eight_way_4_bit_Mux_Tb is

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

    signal Sel : std_logic_vector (2 downto 0);
    signal In0,In1,In2,In3,In4,In5,In6,In7,output : std_logic_vector (3 downto 0);
    
    
begin
UUT : Eight_way_4_bit_Mux port map (Sel,In0,In1,In2,In3,In4,In5,In6,In7,output);

process 
begin

In0 <= "0000";
In1 <= "0001";
In2 <= "0010";
In3 <= "0100";
In4 <= "1000";
In5 <= "0011";
In6 <= "0111";
In7 <= "1111";
sel <= "000";
wait for 100ns;

In0 <= "0100";
In1 <= "0101";
In2 <= "1010";
In3 <= "0100";
In4 <= "1010";
In5 <= "0011";
In6 <= "0111";
In7 <= "1111";
sel <= "101";
wait for 100ns;

In0 <= "0010";
In1 <= "1001";
In2 <= "0010";
In3 <= "0101";
In4 <= "1000";
In5 <= "1011";
In6 <= "0111";
In7 <= "1111";
sel <= "011";
wait for 100ns;

In0 <= "0100";
In1 <= "1001";
In2 <= "0010";
In3 <= "0100";
In4 <= "1010";
In5 <= "1011";
In6 <= "0111";
In7 <= "1111";
sel <= "011";
wait for 100ns;

In0 <= "0100";
In1 <= "0001";
In2 <= "0010";
In3 <= "0100";
In4 <= "1000";
In5 <= "1011";
In6 <= "0111";
In7 <= "1111";
sel <= "100";
wait for 100ns;

In0 <= "0000";
In1 <= "0001";
In2 <= "0010";
In3 <= "0100";
In4 <= "1000";
In5 <= "0011";
In6 <= "0111";
In7 <= "1111";
sel <= "101";
wait for 100ns;

In0 <= "0100";
In1 <= "0001";
In2 <= "1010";
In3 <= "0100";
In4 <= "1010";
In5 <= "0011";
In6 <= "0111";
In7 <= "1011";
sel <= "110";
wait for 100ns;

In0 <= "0110";
In1 <= "0001";
In2 <= "0010";
In3 <= "0101";
In4 <= "1000";
In5 <= "1011";
In6 <= "0111";
In7 <= "1111";
sel <= "111";
wait for 100ns;

end process;
end Behavioral;
