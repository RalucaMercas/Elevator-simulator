library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_poarta_sau_13_intrari is
--  Port ( );
end tb_poarta_sau_13_intrari;

architecture Behavioral of tb_poarta_sau_13_intrari is
component poarta_sau_13_intrari is
    Port ( a : in STD_LOGIC_VECTOR (12 downto 0);
           y : out STD_LOGIC);
end component;
signal a_test: std_logic_vector(12 downto 0);
signal y_test: std_logic;

begin
ust: poarta_sau_13_intrari port map(a_test, y_test);
process
begin
a_test <= "1000000000000";
wait for 20 ns;

a_test <= "0000001000000";
wait for 20 ns;

a_test <= "0000000000010";
wait for 20 ns;

a_test <= "0000000000000";
wait for 20 ns;
end process;

end Behavioral;