----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.04.2024 00:33:39
-- Design Name: 
-- Module Name: Register_4bit - Behavioral
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

-- 4 bit register
entity Register_4bit is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           EN : in STD_logic;
           Q : out STD_LOGIC_VECTOR (3 downto 0)
           );
end Register_4bit;

architecture Behavioral of Register_4bit is

    component D_FF is  -- D flip flop
        port( D : in std_logic;
              Res : in std_logic;
              Clk : in std_logic;
              Q : out std_logic;
              Qbar: out std_logic);
    end component;

    signal Q0, Q1, Q2, Q3 : std_logic; 
    signal D0, D1, D2, D3 : std_logic;
    signal result : std_logic_vector (3 downto 0);

begin

D0 <= (D(0) AND EN) OR (Q0 AND (NOT EN));
D1 <= (D(1) AND EN) OR (Q1 AND (NOT EN));
D2 <= (D(2) AND EN) OR (Q2 AND (NOT EN));
D3 <= (D(3) AND EN) OR (Q3 AND (NOT EN));

    -- Instantiate D flip-flops for each bit
    DFF_0: D_FF port map (
        D => D0,
        Res => Res,
        Clk => Clk,
        Q => Q0
    );

    DFF_1: D_FF port map (
        D => D1,
        Res => Res,
        Clk => Clk,
        Q => Q1
    );

    DFF_2: D_FF port map (
        D => D2,
        Res => Res,
        Clk => Clk,
        Q => Q2
    );

    DFF_3: D_FF port map (
        D => D3,
        Res => Res,
        Clk => Clk,
        Q => Q3
    );

    -- Process for updating register values only at rising edge of clock
--    process (Clk)
--    begin
--        if rising_edge(Clk) then
----             Update register values only at rising edge of clock
--            if Res = '1' then
--                Q0 <= '0';
--                Q1 <= '0';
--                Q2 <= '0';
--                Q3 <= '0';
--            else
--                Q0 <= D(0);
--                Q1 <= D(1);
--                Q2 <= D(2);
--                Q3 <= D(3);
--            end if;
--        end if;
--    end process;

    -- Output Q 
    result(0) <= Q0;
    result(1) <= Q1;
    result(2) <= Q2;
    result(3) <= Q3;
    
    Q <= result;
end Behavioral;
