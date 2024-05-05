----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/21/2024 08:33:49 PM
-- Design Name: 
-- Module Name: AU_7_seg - Behavioral
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

entity AU_7_seg is
    Port ( Inuput_7_seg : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           S_LED : out STD_LOGIC_VECTOR (3 downto 0);
           S_7Seg : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0));
end AU_7_seg;

architecture Behavioral of AU_7_seg is



component LUT_16_7 is
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end component;

signal output : STD_LOGIC_VECTOR (3 downto 0);
signal counter : integer := 0;
signal temp : integer := 0;
signal myOut : std_logic_vector (6 downto 0);


begin
-- process for counting
    process(Clk) begin
        if rising_edge(Clk) then
            temp <= temp + 1;
            if temp = 400000 then
                counter <= counter + 1;
                temp <= 0;
            end if;
            if counter = 4 then
                counter <= 0;
            end if;
        end if;
    end process;

    
    S_LED <= Inuput_7_seg;
    
    LUT_16_7_0 : LUT_16_7 Port Map(
        address => Inuput_7_seg,
        data => myOut
    );
    
    -- process for lighting up only one digit of the seven segment display
    process(counter,myOut) begin
        case counter is 
            when 0 =>
                an <= "1110";
                S_7seg <= myOut;
            when others =>
                S_7seg <= "1111111";
        end case;
    end process;

end Behavioral;
