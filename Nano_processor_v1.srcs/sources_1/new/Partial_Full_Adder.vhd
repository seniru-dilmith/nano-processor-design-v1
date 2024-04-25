----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/16/2024 11:47:05 AM
-- Design Name: 
-- Module Name: Partial_Full_Adder - Behavioral
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

entity Partial_Full_Adder is
    --  Port ( );
    Port ( A : in STD_LOGIC;  -- input bit 1
    B : in STD_LOGIC;  -- input bit 2
    Cin : in STD_LOGIC;  -- carry bit in
    S : out STD_LOGIC;  -- result sum bit
    P : out STD_LOGIC;  -- 
    G : out STD_LOGIC);
end Partial_Full_Adder;

architecture Behavioral of Partial_Full_Adder is

begin

    S <= A xor B xor Cin;
    P <= A xor B;
    G <= A and B;

end Behavioral;
