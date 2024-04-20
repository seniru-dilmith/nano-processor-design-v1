----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2024 11:06:02 PM
-- Design Name: 
-- Module Name: Program_counter - Behavioral
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

entity Program_counter is
    Port ( Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           In_Address : in STD_LOGIC_VECTOR (2 downto 0);
           Out_Address : out STD_LOGIC_VECTOR (2 downto 0)
           );
end Program_counter;

architecture Behavioral of Program_counter is

component D_FF is
    Port ( D : in STD_LOGIC;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC;
           Qbar : out STD_LOGIC);
end component;

begin
        
D_FF0 : D_FF port map(
        D => In_Address(0),
        Res => Reset,
        Clk => Clk,
        Q => Out_Address(0));

D_FF1 : D_FF port map(
        D => In_Address(1),
        Res => Reset,
        Clk => Clk,
        Q => Out_Address(1));        

D_FF2 : D_FF port map(
        D => In_Address(2),
        Res => Reset,
        Clk => Clk,
        Q => Out_Address(2));        
 

end Behavioral;