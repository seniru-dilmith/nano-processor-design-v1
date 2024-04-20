----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2024 07:39:55 PM
-- Design Name: 
-- Module Name: Two_way_3_bit_Mux_Tb - Behavioral
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

entity Two_way_3_bit_Mux_Tb is
--  Port ( );
end Two_way_3_bit_Mux_Tb;


architecture Behavioral of Two_way_3_bit_Mux_Tb is

component Two_way_3_bit_MuX is
    Port ( In0 : in STD_LOGIC_VECTOR (2 downto 0);
           In1 : in STD_LOGIC_VECTOR (2 downto 0);
           Sel : in STD_LOGIC;
           Output : out STD_LOGIC_VECTOR (2 downto 0));
end component;
    signal In0,In1,Output : std_logic_vector (2 downto 0);
    signal Sel : std_logic;

begin
UUT : Two_way_3_bit_MuX port map (In0,In1,Sel,Output);
process 
begin
    In0<= "111";
    In1<="101";
    sel<= '0';
    wait for 100ns;

    In0<= "000";
    In1<="100";
    sel<= '1';
    wait for 100ns;

end process;
end Behavioral;
