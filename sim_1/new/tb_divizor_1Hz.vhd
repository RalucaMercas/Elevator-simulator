library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_divizor_1Hz is
--  Port ( );
end tb_divizor_1Hz;

architecture Behavioral of tb_divizor_1Hz is
component divizor_1Hz is
    Port ( clk : in STD_LOGIC;
           div_clk_1 : out STD_LOGIC);
end component;

signal clk_test: std_logic;
signal div_clk_1_test: std_logic;
constant perioada: TIME := 10 ns;
begin
ust: divizor_1Hz port map(clk_test, div_clk_1_test);

process
begin
clk_test <= '0';
wait for perioada/2;
clk_test <= '1';
wait for perioada/2;
end process;

end Behavioral;