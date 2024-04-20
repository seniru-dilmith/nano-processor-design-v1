library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Program_counter_TB is
end Program_counter_TB;

architecture TB_arch of Program_counter_TB is
    -- Component declaration for the unit under test (UUT)
    component Program_counter
        Port (
            Reset : in STD_LOGIC;
            Clk : in STD_LOGIC;
            In_Address : in STD_LOGIC_VECTOR (2 downto 0);
            Out_Address : out STD_LOGIC_VECTOR (2 downto 0)
        );
    end component;

    -- Testbench signals
    signal Reset_tb : STD_LOGIC := '0';
    signal Clk_tb : STD_LOGIC := '0';
    signal In_Address_tb : STD_LOGIC_VECTOR (2 downto 0) := "000";
    signal Out_Address_tb : STD_LOGIC_VECTOR (2 downto 0);
    
    -- Clock period definitions
    constant Clk_period : time := 10 ns;

begin
    -- Instantiate the unit under test (UUT)
    UUT : Program_counter port map (
        Reset => Reset_tb,
        Clk => Clk_tb,
        Out_Address => Out_Address_tb,
        In_Address => In_Address_tb
    );

    -- Clock process definitions
    Clk_process : process
    begin
        while now < 1000 ns loop
            Clk_tb <= '0';
            wait for Clk_period / 2;
            Clk_tb <= '1';
            wait for Clk_period / 2;
        end loop;
        wait;
    end process;

    -- Stimulus process
    Stimulus : process
    begin
        -- Reset initialization
        Reset_tb <= '1';
        wait for 20 ns;
        Reset_tb <= '0';
        
        -- Test cases
        wait for Clk_period;
        In_Address_tb <= "101"; -- Input address 1
        wait for Clk_period;
        In_Address_tb <= "011"; -- Input address 2
        wait for Clk_period;
        
                -- Reset initialization
        Reset_tb <= '1';
        wait for 20 ns;
        Reset_tb <= '0';
        
        In_Address_tb <= "011"; -- Input address 3
        wait for Clk_period;
        In_Address_tb <= "101"; -- Input address 4
        wait for Clk_period;
        In_Address_tb <= "101"; -- Input address 5
        wait for Clk_period;
        
         -- Reset initialization
        Reset_tb <= '1';
        wait for 20 ns;
        Reset_tb <= '0';
        
        -- Test cases
        wait for Clk_period;
        In_Address_tb <= "101"; -- Input address 1
        wait for Clk_period;
        In_Address_tb <= "111"; -- Input address 2
        wait for Clk_period;
        
                -- Reset initialization
        Reset_tb <= '1';
        wait for 20 ns;
        Reset_tb <= '0';
        
        In_Address_tb <= "101"; -- Input address 3
        wait for Clk_period;
        In_Address_tb <= "111"; -- Input address 4
        wait for Clk_period;
        In_Address_tb <= "100"; -- Input address 5
        wait;
               
    end process;

end TB_arch;
