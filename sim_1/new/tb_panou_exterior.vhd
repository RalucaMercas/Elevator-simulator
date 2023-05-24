library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_panou_exterior is
--  Port ( );
end tb_panou_exterior;

architecture Behavioral of tb_panou_exterior is
component panou_exterior is
    Port ( enable : in STD_LOGIC;
           clk : in STD_LOGIC;
           BE : in STD_LOGIC_VECTOR (12 downto 0);
           reset : in STD_LOGIC_VECTOR (12 downto 0);
           Y1 : out STD_LOGIC_VECTOR (12 downto 0));
end component;

signal enable_test: std_logic;
signal clk_test: std_logic;
signal BE_test: std_logic_vector(12 downto 0);
signal reset_test: std_logic_vector(12 downto 0);
signal Y1_test: std_logic_vector(12 downto 0);

constant perioada: TIME := 20 ns;

begin

ust: panou_exterior port map(enable_test, clk_test, BE_test, reset_test,Y1_test);

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
BE_test <= "0001000000000";
reset_test <=  "0000001000000";
wait for perioada;

enable_test <= '1';
BE_test <= "0000000100000";
reset_test <=  "0000000000010";
wait for perioada;

enable_test <= '1';
BE_test <= "0001000000000";
reset_test <=  "0001000000000";
wait for perioada;

enable_test <= '0';
BE_test <= "0000000010000";
reset_test <=  "0000001000000";
wait for perioada;
end process;

end Behavioral;