library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_poarta_sau_nu_2 is
--  Port ( );
end tb_poarta_sau_nu_2;

architecture Behavioral of tb_poarta_sau_nu_2 is

component poarta_sau_nu_2 is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           c : out STD_LOGIC);
end component;

signal a_test: std_logic;
signal b_test: std_logic;
signal c_test: std_logic;


begin
ust : poarta_sau_nu_2 port map(a_test, b_test, c_test);

process
begin
a_test <= '0';
b_test <= '0';
wait for 20 ns;

a_test <= '0';
b_test <= '1';
wait for 20 ns;

a_test <= '1';
b_test <= '0';
wait for 20 ns;

a_test <= '1';
b_test <= '1';
wait for 20 ns;

end process;

end Behavioral;