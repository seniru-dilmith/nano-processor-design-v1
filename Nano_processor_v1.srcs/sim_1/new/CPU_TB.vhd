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
--           Slow_Clk_check : out STD_LOGIC;
--                      reg_0_out_check : out STD_LOGIC_VECTOR (3 downto 0);  -- **
--                      reg_1_out_check : out STD_LOGIC_VECTOR (3 downto 0);  -- **
--                      reg_2_out_check : out STD_LOGIC_VECTOR (3 downto 0);  -- **
--                      reg_3_out_check : out STD_LOGIC_VECTOR (3 downto 0);  -- **
--                      reg_4_out_check : out STD_LOGIC_VECTOR (3 downto 0);  -- **
--                      reg_5_out_check : out STD_LOGIC_VECTOR (3 downto 0);  -- **
--                      reg_6_out_check : out STD_LOGIC_VECTOR (3 downto 0);  -- **
--                      reg_7_out_check : out STD_LOGIC_VECTOR (3 downto 0);  -- **
           carry : out STD_LOGIC;
           zero : out STD_LOGIC;
           Reset : in STD_LOGIC);
end component;

-- buses for every register output
-- Signal reg_0_out_check, reg_1_out_check, reg_2_out_check, reg_3_out_check, reg_4_out_check, reg_5_out_check, reg_6_out_check, reg_7_out_check : STD_LOGIC_VECTOR(3 downto 0);  -- **

-- singanls for all the essentials
Signal Clk, Res, carry, zero : STD_LOGIC;

begin
-- port map for the CPU component
-- UUT: CPU port map(Clk, Slow_Clk_Check_TB, reg_0_out_check, reg_1_out_check, reg_2_out_check, reg_3_out_check, reg_4_out_check, reg_5_out_check, reg_6_out_check, reg_7_out_check, carry, zero, Res); -- **
UUT:CPU port map(Clk, carry, zero, Res);

-- reset switch
Process
begin
    Res <= '1';
    wait for 960 ns;
    Res <= '0';
    wait;
end process;

-- clock ticking
Clk_process : Process
begin
    Clk <= '0';
    wait for 50 ns;
    Clk <= '1';
    wait for 50 ns;
end process;

end Behavioral;

-- ** these lines are added for check purposes. if you need to check the functionalities of the registers one by one
-- uncomment those lines. if not keep it as it is.
