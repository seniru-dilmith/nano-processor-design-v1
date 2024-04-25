----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.04.2024 23:18:09
-- Design Name: 
-- Module Name: Register_Bank - Behavioral
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

entity Register_Bank is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);  -- Input data for all registers
           Res : in STD_LOGIC;  -- Reset signal for all registers
           Clk : in STD_LOGIC;  -- Clock signal for all registers
           Register_Select : in STD_LOGIC_VECTOR (2 downto 0); -- Selects which register to load data into
           R_0_val : out STD_LOGIC_VECTOR (3 downto 0);  -- current regsister values
           R_1_val : out STD_LOGIC_VECTOR (3 downto 0);  -- current regsister values
           R_2_val : out STD_LOGIC_VECTOR (3 downto 0);  -- current regsister values
           R_3_val : out STD_LOGIC_VECTOR (3 downto 0);  -- current regsister values
           R_4_val : out STD_LOGIC_VECTOR (3 downto 0);  -- current regsister values
           R_5_val : out STD_LOGIC_VECTOR (3 downto 0);  -- current regsister values
           R_6_val : out STD_LOGIC_VECTOR (3 downto 0);  -- current regsister values
           R_7_val : out STD_LOGIC_VECTOR (3 downto 0)   -- current regsister values
           );
end Register_Bank;

architecture Behavioral of Register_Bank is
    -- Component declaration for a single register
    -- 4 bit register
    component Register_4bit is
        Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
               Res : in STD_LOGIC;
               Clk : in STD_LOGIC;
               EN : in STD_logic;
               Q : out STD_LOGIC_VECTOR (3 downto 0)
               );
    end component;
    
    -- 3 to 9 decoder component
    component Decoder_3_to_8 is
        Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
               EN : in STD_LOGIC;
               Y : out STD_LOGIC_VECTOR (7 downto 0)
               );
    end component;

    -- signal to store the decoder output
    signal dec_out : std_logic_vector(7 downto 0);

begin
    
    -- decoder to select a register based on the register select input
    decoder: Decoder_3_to_8 port map(
        I => Register_Select,
        EN => '1',
        Y => dec_out
        );
    
    -- Instantiate each register
    R0: Register_4bit port map (
        D => D,
        Res => Res,
        Clk => Clk,
        EN => dec_out(0),
        Q => R_0_val
    );
    
    -- Instantiate each register
    R1: Register_4bit port map (
        D => D,
        Res => Res,
        Clk => Clk,
        EN => dec_out(1),
        Q => R_1_val
    );
    
    -- Instantiate each register
    R2: Register_4bit port map (
        D => D,
        Res => Res,
        Clk => Clk,
        EN => dec_out(2),
        Q => R_2_val
    );
    
    -- Instantiate each register
    R3: Register_4bit port map (
        D => D,
        Res => Res,
        Clk => Clk,
        EN => dec_out(3),
        Q => R_3_val
    );
    
    -- Instantiate each register
    R4: Register_4bit port map (
        D => D,
        Res => Res,
        Clk => Clk,
        EN => dec_out(4),
        Q => R_4_val
    );
    
    -- Instantiate each register
    R5: Register_4bit port map (
        D => D,
        Res => Res,
        Clk => Clk,
        EN => dec_out(5),
        Q => R_5_val
    );
    
    -- Instantiate each register
    R6: Register_4bit port map (
        D => D,
        Res => Res,
        Clk => Clk,
        EN => dec_out(6),
        Q => R_6_val
    );
    
    -- Instantiate each register
    R7: Register_4bit port map (
        D => D,
        Res => Res,
        Clk => Clk,
        EN => dec_out(7),
        Q => R_7_val
    );


end Behavioral;

