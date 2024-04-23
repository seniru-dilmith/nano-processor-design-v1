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

entity Register_Bank is
    Port (
        D : in STD_LOGIC_VECTOR (3 downto 0);  -- Input data for all registers
        Res : in STD_LOGIC;  -- Reset signal for all registers
        Clk : in STD_LOGIC;  -- Clock signal for all registers
        Register_Select : in STD_LOGIC_VECTOR (2 downto 0); -- Selects which register to load data into
        R_0_val : out STD_LOGIC_VECTOR (3 downto 0);
        R_1_val : out STD_LOGIC_VECTOR (3 downto 0);
        R_2_val : out STD_LOGIC_VECTOR (3 downto 0);
        R_3_val : out STD_LOGIC_VECTOR (3 downto 0);
        R_4_val : out STD_LOGIC_VECTOR (3 downto 0);
        R_5_val : out STD_LOGIC_VECTOR (3 downto 0);
        R_6_val : out STD_LOGIC_VECTOR (3 downto 0);
        R_7_val : out STD_LOGIC_VECTOR (3 downto 0)
    );  -- Output data from selected register
end Register_Bank;

architecture Behavioral of Register_Bank is
    -- Component declaration for a single register
    -- 4 bit register
    component Register_4bit is
        Port (
            D : in STD_LOGIC_VECTOR (3 downto 0);
            Res : in STD_LOGIC;
            Clk : in STD_LOGIC;
            EN : in STD_LOGIC;
            Q : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;
    
    component Decoder_3_to_8 is
        Port (
            I : in STD_LOGIC_VECTOR (2 downto 0);
            EN : in STD_LOGIC;
            Y : out STD_LOGIC_VECTOR (7 downto 0)
        );
    end component;

    -- Signals for each register's input data
    signal D_0, D_1, D_2, D_3, D_4, D_5, D_6, D_7 : STD_LOGIC_VECTOR (3 downto 0);

    signal dec_out : STD_LOGIC_VECTOR(7 downto 0);

begin

    decoder : Decoder_3_to_8 port map (
        I => Register_Select,
        EN => '1',
        Y => dec_out
    );
    
    -- Instantiate each register
    R0 : Register_4bit port map (
        D => D_0,
        Res => Res,
        Clk => Clk,
        EN => dec_out(0),
        Q => R_0_val
    );
    
    R1 : Register_4bit port map (
        D => D_1,
        Res => Res,
        Clk => Clk,
        EN => dec_out(1),
        Q => R_1_val
    );
    
    R2 : Register_4bit port map (
        D => D_2,
        Res => Res,
        Clk => Clk,
        EN => dec_out(2),
        Q => R_2_val
    );
    
    R3 : Register_4bit port map (
        D => D_3,
        Res => Res,
        Clk => Clk,
        EN => dec_out(3),
        Q => R_3_val
    );
    
    R4 : Register_4bit port map (
        D => D_4,
        Res => Res,
        Clk => Clk,
        EN => dec_out(4),
        Q => R_4_val
    );
    
    R5 : Register_4bit port map (
        D => D_5,
        Res => Res,
        Clk => Clk,
        EN => dec_out(5),
        Q => R_5_val
    );
    
    R6 : Register_4bit port map (
        D => D_6,
        Res => Res,
        Clk => Clk,
        EN => dec_out(6),
        Q => R_6_val
    );
    
    R7 : Register_4bit port map (
        D => D_7,
        Res => Res,
        Clk => Clk,
        EN => dec_out(7),
        Q => R_7_val
    );

    -- Assign input data signals based on register select
    process (Register_Select, D)
    begin
        D_0 <= (others => '0');
        D_1 <= (others => '0');
        D_2 <= (others => '0');
        D_3 <= (others => '0');
        D_4 <= (others => '0');
        D_5 <= (others => '0');
        D_6 <= (others => '0');
        D_7 <= (others => '0');
        
        case Register_Select is
            when "000" =>
                D_0 <= D;
            when "001" =>
                D_1 <= D;
            when "010" =>
                D_2 <= D;
            when "011" =>
                D_3 <= D;
            when "100" =>
                D_4 <= D;
            when "101" =>
                D_5 <= D;
            when "110" =>
                D_6 <= D;
            when "111" =>
                D_7 <= D;
            when others =>
                null;
        end case;
    end process;

end Behavioral;


