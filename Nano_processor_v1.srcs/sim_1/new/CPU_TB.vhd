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

-- component of the CPU for simulation
component CPU
    Port ( Clk : in STD_LOGIC;
           Slow_Clk_check : out STD_LOGIC;
                      reg_0_out_check : out STD_LOGIC_VECTOR (3 downto 0);  -- **
                      reg_1_out_check : out STD_LOGIC_VECTOR (3 downto 0);  -- **
                      reg_2_out_check : out STD_LOGIC_VECTOR (3 downto 0);  -- **
                      reg_3_out_check : out STD_LOGIC_VECTOR (3 downto 0);  -- **
                      reg_4_out_check : out STD_LOGIC_VECTOR (3 downto 0);  -- **
                      reg_5_out_check : out STD_LOGIC_VECTOR (3 downto 0);  -- **
                      reg_6_out_check : out STD_LOGIC_VECTOR (3 downto 0);  -- **
                      reg_7_out_check : out STD_LOGIC_VECTOR (3 downto 0);  -- **
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           Reset : in STD_LOGIC);
end component;

-- 
Signal reg_0_out_check, reg_1_out_check, reg_2_out_check, reg_3_out_check, reg_4_out_check, reg_5_out_check, reg_6_out_check, reg_7_out_check : STD_LOGIC_VECTOR(3 downto 0);  -- **

Signal Clk, Res, Overflow, Zero, Slow_Clk_Check_TB : STD_LOGIC;

begin
UUT:CPU port map(Clk, Slow_Clk_Check_TB, reg_0_out_check, reg_1_out_check, reg_2_out_check, reg_3_out_check, reg_4_out_check, reg_5_out_check, reg_6_out_check, reg_7_out_check, Overflow, Zero, Res); -- **
--UUT:CPU port map(Clk, Slow_Clk_Check_TB, Overflow, Zero, Res);

-- reset switch
Process
begin
    Res <= '1';
    wait for 1000 ns;
    Res <= '0';
    wait;
end process;

-- clock ticking
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
