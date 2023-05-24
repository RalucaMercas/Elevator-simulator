library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_unitate_control is
--  Port ( );
end tb_unitate_control;

architecture Behavioral of tb_unitate_control is
component unitate_control is
    Port ( pers_in_usa : in STD_LOGIC;
           greutate : in STD_LOGIC;
           ok : in STD_LOGIC;
           en : out STD_LOGIC);
end component;

signal pers_in_usa_test: std_logic;
signal greutate_test: std_logic;
signal ok_test: std_logic;
signal en_test: std_logic;

begin
ust : unitate_control port map(pers_in_usa_test, greutate_test, ok_test, en_test);

process
begin

pers_in_usa_test <= '0';
greutate_test <= '0';
ok_test <= '0';
wait for 20 ns;

pers_in_usa_test <= '0';
greutate_test <= '0';
ok_test <= '1';
wait for 20 ns;

pers_in_usa_test <= '0';
greutate_test <= '1';
ok_test <= '0';
wait for 20 ns;

pers_in_usa_test <= '0';
greutate_test <= '1';
ok_test <= '1';
wait for 20 ns;

pers_in_usa_test <= '1';
greutate_test <= '0';
ok_test <= '0';
wait for 20 ns;

pers_in_usa_test <= '1';
greutate_test <= '0';
ok_test <= '1';
wait for 20 ns;

pers_in_usa_test <= '1';
greutate_test <= '1';
ok_test <= '0';
wait for 20 ns;

pers_in_usa_test <= '1';
greutate_test <= '1';
ok_test <= '1';
wait for 20 ns;

end process;

end Behavioral;