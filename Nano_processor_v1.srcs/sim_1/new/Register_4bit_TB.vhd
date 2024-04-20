----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.04.2024 00:48:04
-- Design Name: 
-- Module Name: Register_4bit_TB - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Register_4bit_TB is
end Register_4bit_TB;

architecture Behavioral of Register_4bit_TB is

    -- Component declaration for the register
    component Register_4bit is
        Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
               Res : in STD_LOGIC;
               Clk : in STD_LOGIC;
               EN : in STD_LOGIC;
               Q : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    -- Testbench signals
    signal D_in : STD_LOGIC_VECTOR(3 downto 0) := "0000";  -- Input data
    signal Res_in : STD_LOGIC := '0';  -- Reset input
    signal Clk_in : STD_LOGIC := '0';  -- Clock input
    signal EN_in : STD_LOGIC := '1';   -- Enable input
    signal Q_out : STD_LOGIC_VECTOR(3 downto 0);  -- Output Q

begin

    -- Instantiate the register
    UUT : Register_4bit port map (
        D => D_in,
        Res => Res_in,
        Clk => Clk_in,
        EN => EN_in,
        Q => Q_out
    );

    -- Clock process
    process
    begin
        Clk_in <= '0';  -- Initialize clock to '0'
        wait for 5 ns;   -- Wait for 5 ns before toggling clock
        while now < 500 ns loop  -- Continue clock toggling until 500 ns
            Clk_in <= not Clk_in;  -- Toggle the clock
            wait for 5 ns;   -- Wait for 5 ns before toggling again
        end loop;
        wait;  -- Wait indefinitely
    end process;

    -- Stimulus process
    process
    begin
        -- Reset the register
        Res_in <= '1';
        wait for 10 ns;
        Res_in <= '0';
        wait for 10 ns;

        -- Enable the register
        EN_in <= '1';

        -- Apply input data and observe output
        D_in <= "1010";  -- Input data
        wait for 20 ns;

        D_in <= "0110";  -- Input data
        wait for 20 ns;

        D_in <= "1001";  -- Input data
        wait for 20 ns;

        D_in <= "1111";  -- Input data
        wait for 20 ns;

        wait;  -- Wait indefinitely
    end process;

end Behavioral;
