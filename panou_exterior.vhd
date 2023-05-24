library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity panou_exterior is
    Port ( enable : in STD_LOGIC;
           clk : in STD_LOGIC;
           BE : in STD_LOGIC_VECTOR (12 downto 0);
           reset : in STD_LOGIC_VECTOR (12 downto 0);
           Y1 : out STD_LOGIC_VECTOR (12 downto 0));
end panou_exterior;

architecture Behavioral of panou_exterior is

component bistabil_JK is
    Port ( J : in STD_LOGIC;
           K : in STD_LOGIC;
           clk : in STD_LOGIC;
           enable : in STD_LOGIC;
           reset: in std_logic;
           Q : out STD_LOGIC);
end component;

begin
    C0: bistabil_JK port map(j => BE(0), k => '0', reset => reset(0), clk => clk, enable => enable, q => Y1(0));
    C1: bistabil_JK port map(j => BE(1), k => '0', reset => reset(1), clk => clk, enable => enable, q => Y1(1));
    C2: bistabil_JK port map(j => BE(2), k => '0', reset => reset(2), clk => clk, enable => enable, q => Y1(2));
    C3: bistabil_JK port map(j => BE(3), k => '0', reset => reset(3), clk => clk, enable => enable, q => Y1(3));
    C4: bistabil_JK port map(j => BE(4), k => '0', reset => reset(4), clk => clk, enable => enable, q => Y1(4));
    C5: bistabil_JK port map(j => BE(5), k => '0', reset => reset(5), clk => clk, enable => enable, q => Y1(5));
    C6: bistabil_JK port map(j => BE(6), k => '0', reset => reset(6), clk => clk, enable => enable, q => Y1(6));
    C7: bistabil_JK port map(j => BE(7), k => '0', reset => reset(7), clk => clk, enable => enable, q => Y1(7));
    C8: bistabil_JK port map(j => BE(8), k => '0', reset => reset(8), clk => clk, enable => enable, q => Y1(8));
    C9: bistabil_JK port map(j => BE(9), k => '0', reset => reset(9), clk => clk, enable => enable, q => Y1(9));
   C10: bistabil_JK port map(j => BE(10), k => '0', reset => reset(10), clk => clk, enable => enable, q => Y1(10));
   C12: bistabil_JK port map(j => BE(12), k => '0', reset => reset(12), clk => clk, enable => enable, q => Y1(12));

end Behavioral;