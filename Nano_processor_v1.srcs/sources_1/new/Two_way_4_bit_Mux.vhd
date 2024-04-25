----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2024 07:21:34 PM
-- Design Name: 
-- Module Name: Two_way_4_bit_Mux - Behavioral
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

entity Two_way_4_bit_Mux is
    Port ( In0 : in STD_LOGIC_VECTOR (3 downto 0);
           In1 : in STD_LOGIC_VECTOR (3 downto 0);
           output : out STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC);
end Two_way_4_bit_Mux;

architecture Behavioral of Two_way_4_bit_Mux is

begin

-- logics for the outputs of the multiplexer
output(0) <= (In0(0) AND (NOT Sel)) OR (In1(0) AND Sel);
output(1) <= (In0(1) AND (NOT Sel)) OR (In1(1) AND Sel);
output(2) <= (In0(2) AND (NOT Sel)) OR (In1(2) AND Sel);
output(3) <= (In0(3) AND (NOT Sel)) OR (In1(3) AND Sel);


end Behavioral;
