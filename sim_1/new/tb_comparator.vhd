
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_comparator is
--  Port ( );
end tb_comparator;

architecture Behavioral of tb_comparator is
component comparator is
    Port ( etaj_curent : in STD_LOGIC_VECTOR (3 downto 0);
           etaj_cu_cerere : in STD_LOGIC_VECTOR (3 downto 0);
           greater : out STD_LOGIC);
end component;
signal etaj_curent_test : STD_LOGIC_VECTOR (3 downto 0);
signal etaj_cu_cerere_test : STD_LOGIC_VECTOR (3 downto 0);
signal greater_test : STD_LOGIC;
begin

ust: comparator port map (etaj_curent_test, etaj_cu_cerere_test, greater_test);

process
begin

etaj_curent_test <= "0101"; --5
etaj_cu_cerere_test <= "0111";  --7 greater = '1'
wait for 20 ns;

etaj_curent_test <= "1010";  --10
etaj_cu_cerere_test <= "0011"; --3 greater = '0'
wait for 20 ns;

end process;


end Behavioral;
