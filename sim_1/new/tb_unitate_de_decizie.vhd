library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_unitate_de_decizie is
--  Port ( );
end tb_unitate_de_decizie;

architecture Behavioral of tb_unitate_de_decizie is
component unitate_de_decizie is
    Port ( clk: in std_logic;
           Y_rez : in STD_LOGIC_VECTOR (12 downto 0);
           en : in STD_LOGIC;
           count : out STD_LOGIC_VECTOR (3 downto 0));
end component;
signal clk_test: std_logic;
signal Y_rez_test: std_logic_vector (12 downto 0);
signal en_test: std_logic;
signal count_test: std_logic_vector (3 downto 0);
constant perioada: TIME := 20 ns;
begin

ust: unitate_de_decizie port map(clk_test, Y_rez_test, en_test, count_test);

process
begin
clk_test <= '0';
wait for perioada/2;
clk_test <= '1';
wait for perioada/2;
end process;

process
begin

Y_rez_test <= "1010010010001";  -- 12, 10, 7, 4, 0
--en_test <= '1';
--Y_rez_test <= "0010010010001";
en_test <= '1';
wait for perioada*170;

Y_rez_test <= "0000100100100";  --8, 5, 2
en_test <= '1';
wait for perioada*170;

Y_rez_test <= "0011000110010";  --10
en_test <= '0';
wait for perioada*170;

end process;

end Behavioral;
