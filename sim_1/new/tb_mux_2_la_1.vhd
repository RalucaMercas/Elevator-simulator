library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_mux_2_la_1 is
--  Port ( );
end tb_mux_2_la_1;

architecture Behavioral of tb_mux_2_la_1 is
component mux_2_la_1 is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           viteza : in STD_LOGIC;
           y : out STD_LOGIC);
end component;

signal a_test: std_logic;
signal b_test: std_logic;
signal viteza_test: std_logic;
signal y_test: std_logic;

begin

ust: mux_2_la_1 port map(a_test, b_test, viteza_test, y_test);

process
begin
a_test <= '1';
b_test <= '0';
viteza_test <= '0';
wait for 20 ns;

a_test <= '1';
b_test <= '0';
viteza_test <= '1';
wait for 20 ns;
end process;

end Behavioral;