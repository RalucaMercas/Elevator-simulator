library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_control_de_hold is
--  Port ( );
end tb_control_de_hold;

architecture Behavioral of tb_control_de_hold is
component control_de_hold is
    Port ( v1 : in STD_LOGIC_VECTOR (12 downto 0);
           v2 : in STD_LOGIC_VECTOR (12 downto 0);
           c_out : out STD_LOGIC
           );
end component;
signal v1_test : STD_LOGIC_VECTOR (12 downto 0);
signal v2_test : STD_LOGIC_VECTOR (12 downto 0);
signal c_out_test : STD_LOGIC;
begin
ust: control_de_hold port map(v1_test, v2_test, c_out_test);

process
begin
v1_test <= "0100000000000";
v2_test <= "0100100001000";
wait for 20 ns;

v1_test <= "0000100000000";
v2_test <= "0100100001001";
wait for 20 ns;

v1_test <= "0000000000000";
v2_test <= "0000100001000";
wait for 20 ns;

v1_test <= "0000001000000";
v2_test <= "0100100001000";
wait for 20 ns;
end process;

end Behavioral;