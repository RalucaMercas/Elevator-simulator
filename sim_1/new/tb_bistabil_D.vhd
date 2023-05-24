library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_bistabil_D is
--  Port ( );
end tb_bistabil_D;

architecture Behavioral of tb_bistabil_D is
component bistabil_D is
    Port ( clk: in std_logic;
           D: in std_logic;
           Q: out std_logic);
end component;

signal clk_test: std_logic;
signal D_test: std_logic;
signal Q_test: std_logic;
constant perioada: TIME := 20 ns;
begin

ust: bistabil_D port map (clk_test, D_test, Q_test);

process
begin
    clk_test <= '0';
    wait for perioada/2;
    
    clk_test <= '1';
    wait for perioada/2;
end process;

process
begin
    D_test <= '0';
    wait for perioada;
    
    D_test <= '1';
    wait for perioada;
end process;
end Behavioral;
