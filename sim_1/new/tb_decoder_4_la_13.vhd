library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_decoder_4_la_13 is
--  Port ( );
end tb_decoder_4_la_13;

architecture Behavioral of tb_decoder_4_la_13 is
component decoder_4_la_13 is
    Port ( etaj : in STD_LOGIC_VECTOR (3 downto 0);
           D : out STD_LOGIC_VECTOR (12 downto 0));
end component;

signal etaj_test: std_logic_vector(3 downto 0);
signal D_test: std_logic_vector(12 downto 0);
begin

ust: decoder_4_la_13 port map(etaj_test, D_test);

process
begin
etaj_test <= "0000";
wait for 20 ns;

etaj_test <= "0001";
wait for 20 ns;

etaj_test <= "0010";
wait for 20 ns;

etaj_test <= "0011";
wait for 20 ns;

etaj_test <= "0100";
wait for 20 ns;

etaj_test <= "0101";
wait for 20 ns;

etaj_test <= "0110";
wait for 20 ns;

etaj_test <= "0111";
wait for 20 ns;

etaj_test <= "1000";
wait for 20 ns;

etaj_test <= "1001";
wait for 20 ns;

etaj_test <= "1010";
wait for 20 ns;

etaj_test <= "1011";
wait for 20 ns;

etaj_test <= "1100";
wait for 20 ns;

end process;

end Behavioral;