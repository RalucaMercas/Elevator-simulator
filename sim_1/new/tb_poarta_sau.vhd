library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_poarta_sau is
--  Port ( );
end tb_poarta_sau;

architecture Behavioral of tb_poarta_sau is
component poarta_sau is
    Port ( y0 : in STD_LOGIC_VECTOR (12 downto 0);
           y1 : in STD_LOGIC_VECTOR (12 downto 0);
           y_rez : out STD_LOGIC_VECTOR (12 downto 0));
end component;

signal y0_test: std_logic_vector(12 downto 0);
signal y1_test: std_logic_vector(12 downto 0);
signal y_rez_test: std_logic_vector(12 downto 0);

begin
ust: poarta_sau port map(y0_test, y1_test, y_rez_test);

process
begin
y0_test <= "0010001001000";
y1_test <= "0010101000001";
wait for 20 ns;

y0_test <= "0010011101001";
y1_test <= "1000101001001";
wait for 20 ns;

end process;

end Behavioral;