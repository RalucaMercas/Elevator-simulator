library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_numarator_reversibil is
--  Port ( );
end tb_numarator_reversibil;

architecture Behavioral of tb_numarator_reversibil is
component numarator_reversibil is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           enable : in STD_LOGIC;
           Y_rez : in STD_LOGIC_VECTOR (12 downto 0);
           count : out STD_LOGIC_VECTOR (3 downto 0)
           );
end component;
signal clk_test: std_logic;
signal reset_test : STD_LOGIC;
signal enable_test : STD_LOGIC;
signal Y_rez_test : STD_LOGIC_VECTOR (12 downto 0);
signal count_test : STD_LOGIC_VECTOR (3 downto 0);
constant perioada: TIME := 20 ns; 

begin
    ust: numarator_reversibil port map(clk_test,reset_test,enable_test,Y_rez_test,count_test);
process
begin
    clk_test <= '0';
    wait for perioada/2;
    clk_test <= '1';
    wait for perioada/2;    
end process;

process
begin
reset_test <= '0';
enable_test <= '1';
Y_rez_test <= "0001011010100";
wait for perioada;

reset_test <= '0';
enable_test <= '0';
Y_rez_test <= "0001011010100";
wait for perioada;

reset_test <= '0';
enable_test <= '0';
Y_rez_test <= "1001011010100";
wait for perioada;

reset_test <= '0';
enable_test <= '1';
Y_rez_test <= "0000010100101";
wait for perioada;

reset_test <= '1';
enable_test <= '1';
Y_rez_test <= "1001011010100";
wait for perioada;
end process;

end Behavioral;
