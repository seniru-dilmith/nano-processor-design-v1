----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2024 07:29:20 PM
-- Design Name: 
-- Module Name: Eight_way_4_bit_Mux - Behavioral
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

entity Eight_way_4_bit_Mux is
    Port ( Sel : in STD_LOGIC_VECTOR (2 downto 0);  -- register select
           In0 : in STD_LOGIC_VECTOR (3 downto 0);  -- line 0
           In1 : in STD_LOGIC_VECTOR (3 downto 0);  -- line 1
           In2 : in STD_LOGIC_VECTOR (3 downto 0);  -- line 2
           In3 : in STD_LOGIC_VECTOR (3 downto 0);  -- line 3
           In4 : in STD_LOGIC_VECTOR (3 downto 0);  -- line 4
           In5 : in STD_LOGIC_VECTOR (3 downto 0);  -- line 5
           In6 : in STD_LOGIC_VECTOR (3 downto 0);  -- line 6
           In7 : in STD_LOGIC_VECTOR (3 downto 0);  -- line 7
           Output : out STD_LOGIC_VECTOR (3 downto 0));
end Eight_way_4_bit_Mux;

architecture Behavioral of Eight_way_4_bit_Mux is

begin
process(In0,In1,In2,In3,In4,In5,In6,In7,sel)
    --output data lines based on the select line
    begin
        if Sel = "000" then
            Output <= In0;
            
        elsif Sel = "001" then
            Output <= In1;
                
        elsif Sel = "010" then
            Output <= In2; 
                    
        elsif Sel = "011" then
            Output <= In3;
                        
        elsif Sel = "100" then
            Output <= In4;
                            
        elsif Sel = "101" then
            Output <= In5;
                                
        elsif Sel = "110" then
            Output <= In6;                                                                                                   
        else 
            Output <= In7;
       end if;     
    end process;

end Behavioral;
