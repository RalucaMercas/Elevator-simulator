

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_priority_encoder is
--  Port ( );
end tb_priority_encoder;

architecture Behavioral of tb_priority_encoder is
component priority_encoder is
    Port ( Y_rez : in STD_LOGIC_VECTOR (12 downto 0);
           etaj_cu_comanda : out STD_LOGIC_VECTOR (3 downto 0));
end component;
signal Y_rez_test: STD_LOGIC_VECTOR (12 downto 0);
signal etaj_cu_comanda_test: STD_LOGIC_VECTOR (3 downto 0);
begin

ust: priority_encoder port map (Y_rez_test, etaj_cu_comanda_test);

process
begin

Y_rez_test <= "0001011001001"; --9
wait for 20 ns;

Y_rez_test <= "0000000101001";  --5
wait for 20 ns;
end process;

end Behavioral;
