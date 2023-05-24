library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_bistabil_JK is
--  Port ( );
end tb_bistabil_JK;

architecture Behavioral of tb_bistabil_JK is
component bistabil_JK is
    Port ( J : in STD_LOGIC;
           K : in STD_LOGIC;
           clk : in STD_LOGIC;
           enable : in STD_LOGIC;
           Q : out STD_LOGIC);
end component;
signal J_test: std_logic;
signal K_test: std_logic;
signal clk_test: std_logic;
signal enable_test: std_logic;
signal Q_test: std_logic;
constant perioada: TIME := 20 ns;
begin

ust: bistabil_JK port map (J_test, K_test, clk_test, enable_test, Q_test);
process
begin
clk_test <= '0';
wait for perioada/2;

clk_test <= '1';
wait for perioada/2;
end process;

process
begin
J_test <= '0';
K_test <= '0';
enable_test <= '1';
wait for perioada;

J_test <= '0';
K_test <= '1';
enable_test <= '1';
wait for perioada;

J_test <= '1';
K_test <= '0';
enable_test <= '1';
wait for perioada;

J_test <= '1';
K_test <= '1';
enable_test <= '1';
wait for perioada;

J_test <= '1';
K_test <= '0';
enable_test <= '0';
wait;
end process;

end Behavioral;