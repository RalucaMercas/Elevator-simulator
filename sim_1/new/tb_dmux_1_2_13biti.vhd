library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_dmux_1_2_13biti is
--  Port ( );
end tb_dmux_1_2_13biti;

architecture Behavioral of tb_dmux_1_2_13biti is
component dmux_1_2_13biti is
    Port ( D : in STD_LOGIC_VECTOR (12 downto 0);
           BI : out STD_LOGIC_VECTOR (12 downto 0);
           BE : out STD_LOGIC_VECTOR (12 downto 0);
           panou: in std_logic  --selectia
           );
end component;
signal D_test : STD_LOGIC_VECTOR (12 downto 0);
signal BI_test : STD_LOGIC_VECTOR (12 downto 0);
signal BE_test : STD_LOGIC_VECTOR (12 downto 0);
signal panou_test: std_logic;
begin
ust: dmux_1_2_13biti port map (D_test, BI_test, BE_test, panou_test);

process
begin
D_test <= "0000000000010";
panou_test <= '0';
wait for 20 ns;

D_test <= "0000100000000";
panou_test <= '1';
wait for 20 ns;

D_test <= "0100000000000";
panou_test <= '1';
wait for 20 ns;

D_test <= "0000000010000";
panou_test <= '1';
wait for 20 ns;

D_test <= "0000000000100";
panou_test <= '0';
wait for 20 ns;

end process;
end Behavioral;