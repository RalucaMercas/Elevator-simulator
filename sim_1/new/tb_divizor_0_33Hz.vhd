library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_divizor_0_33Hz is
--  Port ( );
end tb_divizor_0_33Hz;

architecture Behavioral of tb_divizor_0_33Hz is
component divizor_0_33Hz is
    Port ( clk : in STD_LOGIC;
           div_clk_0_33: out STD_LOGIC);
end component;
signal clk_test: std_logic;
signal div_clk_0_33_test: std_logic;
constant perioada: TIME := 10 ns;
begin

ust: divizor_0_33Hz port map (clk_test, div_clk_0_33_test);

process
begin
clk_test <= '0';
wait for perioada/2;

clk_test <='1';
wait for perioada/2;
end process;

end Behavioral;