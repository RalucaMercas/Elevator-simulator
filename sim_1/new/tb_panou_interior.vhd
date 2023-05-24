library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_panou_interior is
--  Port ( );
end tb_panou_interior;

architecture Behavioral of tb_panou_interior is
component panou_interior is
    Port ( enable : in STD_LOGIC;
           clk : in STD_LOGIC;
           cerere : in STD_LOGIC_VECTOR (12 downto 0);
           reset : in STD_LOGIC_VECTOR (12 downto 0);
           Y0 : out STD_LOGIC_VECTOR (12 downto 0));
end component;

signal enable_test: std_logic;
signal clk_test: std_logic;
signal cerere_test: std_logic_vector(12 downto 0);
signal reset_test: std_logic_vector(12 downto 0);
signal Y0_test: std_logic_vector(12 downto 0);

constant perioada: TIME := 20 ns;

begin

ust: panou_interior port map(enable_test, clk_test, cerere_test, reset_test,Y0_test);

process
begin
clk_test <= '0';
wait for perioada/2;

clk_test <= '1';
wait for perioada/2;
end process;

process
begin
enable_test <= '1';
cerere_test <= "0001000000000";
reset_test <=  "0000001000000";
wait for perioada;

enable_test <= '1';
cerere_test <= "0000000100000";
reset_test <=  "0000000000010";
wait for perioada;

enable_test <= '1';
cerere_test <= "0001000000000";
reset_test <=  "0001000000000";
wait for perioada;

enable_test <= '0';
cerere_test <= "0000000010000";
reset_test <=  "0000001000000";
wait for perioada;
end process;

end Behavioral;