library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_lift is
--  Port ( );
end tb_lift;

architecture Behavioral of tb_lift is
component lift is
    Port ( clk: in std_logic;
           etaj : in STD_LOGIC_VECTOR (3 downto 0);
           panou : in STD_LOGIC;
           ok : in STD_LOGIC;
           greutate : in STD_LOGIC;
           pers_in_usa : in STD_LOGIC;
           viteza : in STD_LOGIC;
           usa_d : out STD_LOGIC;
           greutate_d : out STD_LOGIC;
           afisor : out STD_LOGIC_VECTOR (6 downto 0));
end component;
signal clk_test: std_logic;
signal etaj_test : STD_LOGIC_VECTOR (3 downto 0);
signal panou_test : STD_LOGIC;
signal ok_test : STD_LOGIC;
signal greutate_test : STD_LOGIC;
signal pers_in_usa_test : STD_LOGIC;
signal viteza_test : STD_LOGIC;
signal usa_d_test : STD_LOGIC;
signal greutate_d_test : STD_LOGIC;
signal afisor_test : STD_LOGIC_VECTOR (6 downto 0);
constant perioada: TIME := 10 ns;
begin
ust: lift port map (clk_test, etaj_test, panou_test, ok_test, greutate_test, pers_in_usa_test, viteza_test, usa_d_test, greutate_d_test, afisor_test);

process
begin
clk_test <= '0';
wait for perioada/2;
clk_test <= '1';
wait for perioada/2;
end process;


process
begin

etaj_test <= "0000";  --parter
panou_test <= '0';
ok_test <= '1';
greutate_test <= '0';
pers_in_usa_test <= '0';
viteza_test <= '1';
wait for perioada*2;

etaj_test <= "0011";  --3
panou_test <= '0';
ok_test <= '1';
greutate_test <= '1';
pers_in_usa_test <= '0';
viteza_test <= '1';
wait for perioada*2;

etaj_test <= "0010";  --2
panou_test <= '0';
ok_test <= '1';
greutate_test <= '1';
pers_in_usa_test <= '0';
viteza_test <= '1';
wait for perioada*2;

etaj_test <= "0101";  --5
panou_test <= '1';
ok_test <= '1';
greutate_test <= '1';
pers_in_usa_test <= '0';
viteza_test <= '1';
wait for perioada*2;

etaj_test <= "1000";  --8
panou_test <= '1';
ok_test <= '1';
greutate_test <= '1';
pers_in_usa_test <= '0';
viteza_test <= '1';
wait for perioada*2;

etaj_test <= "0110";  --6
panou_test <= '1';
ok_test <= '1';
greutate_test <= '1';
pers_in_usa_test <= '0';
viteza_test <= '1';
wait for perioada*2;  

end process;
--de incercat de rulat primele simulari cu wait for perioada
end Behavioral;
