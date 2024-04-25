----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.04.2024 13:21:05
-- Design Name: 
-- Module Name: CPU_TB - Behavioral
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

entity CPU_TB is
--  Port ( );
end CPU_TB;

architecture Behavioral of CPU_TB is

component CPU
    Port ( Clk : in STD_LOGIC;
           Slow_Clk_check : out STD_LOGIC;
                      LED : out STD_LOGIC_VECTOR (3 downto 0);
                      LED1 : out STD_LOGIC_VECTOR (3 downto 0);
                      LED2 : out STD_LOGIC_VECTOR (3 downto 0);
                      LED3 : out STD_LOGIC_VECTOR (3 downto 0);
                      LED4 : out STD_LOGIC_VECTOR (3 downto 0);
                      LED5 : out STD_LOGIC_VECTOR (3 downto 0);
                      LED6 : out STD_LOGIC_VECTOR (3 downto 0);
                      LED7 : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           Reset : in STD_LOGIC);
end component;

Signal LED0, LED1, LED2, LED3, LED4, LED5, LED6, LED7 : STD_LOGIC_VECTOR(3 downto 0);

Signal Clk, Res, Overflow, Zero, Slow_Clk_Check_TB : STD_LOGIC;

--Signal pc, RegEn : STD_LOGIC_VECTOR(2 downto 0);
--Signal I : STD_LOGIC_VECTOR (11 downto 0);
--Signal LoadSel : STD_LOGIC;
--Signal RegData, LED1 : STD_LOGIC_VECTOR(3 downto 0);

begin
UUT:CPU port map(Clk, Slow_Clk_Check_TB, LED0, LED1,  LED2, LED3, LED4, LED5, LED6, LED7, Overflow, Zero, Res);
--UUT:CPU port map(Clk, Slow_Clk_Check_TB, Overflow, Zero, Res);

Process
begin
    Res <= '1';
    wait for 1000 ns;
    Res <= '0';
    wait;
end process;

--Res <= '0';

Clk_process : Process
begin
    Clk <= '0';
    wait for 50ns;
    Clk <= '1';
    wait for 50ns;
end process;

end Behavioral;

-- these lines are added for check purposes. if you need to check the functionalities of the registers one by one
-- uncomment those lines. if not keep it as it is.
