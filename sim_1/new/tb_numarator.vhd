library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_numarator is
--  Port ( );
end tb_numarator;

architecture Behavioral of tb_numarator is
component numarator IS
  PORT (		
		clk: in std_logic;
  		count_enable: in std_logic;
  	    dir : in std_logic;
  		etaj_cu_cerere: in std_logic_vector (3 downto 0);
  		iesire: out std_logic_vector (3 downto 0));
end component;
signal clk_test: std_logic;
signal count_enable_test: std_logic;
signal dir_test: std_logic;
signal etaj_cu_cerere_test: std_logic_vector(3 downto 0);
signal iesire_test: std_logic_vector (3 downto 0);
constant perioada: TIME := 20 ns;
begin

ust: numarator port map(clk_test, count_enable_test, dir_test, etaj_cu_cerere_test, iesire_test);

process
begin
clk_test <= '0';
wait for perioada/2;
clk_test <= '1';
wait for perioada/2;
end process;

process
begin

--reset_test <= '0';
--wait for 10 ns;

--reset_test <='1';
--wait for 10 ns;

count_enable_test <= '0';
dir_test <= '1'; -- numara cerscator pana la 6
etaj_cu_cerere_test <= "0110";  
wait for perioada*10;

count_enable_test <= '0';
dir_test <= '0'; -- numara descerscator de la 6 pana la 2
etaj_cu_cerere_test <= "0010";    
wait for perioada*10;


end process;

end Behavioral;
