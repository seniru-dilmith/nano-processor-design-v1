----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2024 07:03:19 PM
-- Design Name: 
-- Module Name: Two_way_3_bit_MuX - Behavioral
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

entity Two_way_3_bit_Mux is
    Port ( In0 : in STD_LOGIC_VECTOR (2 downto 0);
           In1 : in STD_LOGIC_VECTOR (2 downto 0);
           Sel : in STD_LOGIC;
           Output : out STD_LOGIC_VECTOR (2 downto 0));
end Two_way_3_bit_Mux;

architecture Behavioral of Two_way_3_bit_Mux is

begin

process(In0,In1,sel)
    begin
        if Sel = '0'then
            output <= In0;
            
        else
            output <= In1;
            
        end if;    
end process;

end Behavioral;
