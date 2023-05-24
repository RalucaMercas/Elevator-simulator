library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_poarta_si_13biti is
--  Port ( );
end tb_poarta_si_13biti;

architecture Behavioral of tb_poarta_si_13biti is
component poarta_si_13biti is
    Port ( a : in STD_LOGIC_VECTOR (12 downto 0);
           b : in STD_LOGIC_VECTOR (12 downto 0);
           y : out STD_LOGIC_VECTOR (12 downto 0));
end component;
signal a_test: std_logic_vector (12 downto 0);
signal b_test: std_logic_vector (12 downto 0);
signal y_test: std_logic_vector (12 downto 0);
begin

ust: poarta_si_13biti port map (a_test, b_test, y_test);

process
begin
a_test <= "0010101011101";
b_test <= "1011001010001";
wait for 20 ns;

a_test <= "0101111000100";
b_test <= "1011001001001";
wait for 20 ns;

end process;

end Behavioral;