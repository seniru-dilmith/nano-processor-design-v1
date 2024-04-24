----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.04.2024 15:20:52
-- Design Name: 
-- Module Name: Decoder_3_to_8_TB - Behavioral
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

entity Decoder_3_to_8_TB is
end Decoder_3_to_8_TB;

architecture Behavioral of Decoder_3_to_8_TB is
    -- Component declaration for the decoder
    component Decoder_3_to_8 is
        Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
               EN : in STD_LOGIC;
               Y : out STD_LOGIC_VECTOR (7 downto 0));
    end component;

    -- Testbench signals
    signal I_in : STD_LOGIC_VECTOR(2 downto 0);
    signal EN_in : STD_LOGIC := '1';   -- Enable input
    signal Y_out : STD_LOGIC_VECTOR(7 downto 0);  -- Output Y

begin

    -- Instantiate the decoder
    UUT : Decoder_3_to_8 port map (
        I => I_in,
        EN => EN_in,
        Y => Y_out
    );

    -- Stimulus process
    process
    begin
        -- Test with different inputs
    
        I_in <= "001";
        wait for 10 ns;
        
        I_in <= "111";
        wait for 10 ns;
        
        I_in <= "010";
        wait for 10 ns;
        
        I_in <= "110";
        wait for 10 ns;
        
        I_in <= "011";
        wait for 10 ns;
        
        I_in <= "101";
        wait for 10 ns;

        wait;  -- Wait indefinitely
    end process;

end Behavioral;
