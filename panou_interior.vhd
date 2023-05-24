library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity panou_interior is
    Port ( enable : in STD_LOGIC;
           clk : in STD_LOGIC;
           BI : in STD_LOGIC_VECTOR (12 downto 0);
           reset : in STD_LOGIC_VECTOR (12 downto 0);
           Y0 : out STD_LOGIC_VECTOR (12 downto 0));
end panou_interior;

architecture Behavioral of panou_interior is

component bistabil_JK is
    Port ( J : in STD_LOGIC;
           K : in STD_LOGIC;
           clk : in STD_LOGIC;
           enable : in STD_LOGIC;
           reset: in std_logic;
           Q : out STD_LOGIC);
end component;

begin
    C0: bistabil_JK port map(j => BI(0), k => '0', reset => reset(0), clk => clk, enable => enable, q => Y0(0));
    C1: bistabil_JK port map(j => BI(1), k => '0', reset => reset(1), clk => clk, enable => enable, q => Y0(1));
    C2: bistabil_JK port map(j => BI(2), k => '0', reset => reset(2), clk => clk, enable => enable, q => Y0(2));
    C3: bistabil_JK port map(j => BI(3), k => '0', reset => reset(3), clk => clk, enable => enable, q => Y0(3));
    C4: bistabil_JK port map(j => BI(4), k => '0', reset => reset(4), clk => clk, enable => enable, q => Y0(4));
    C5: bistabil_JK port map(j => BI(5), k => '0', reset => reset(5), clk => clk, enable => enable, q => Y0(5));
    C6: bistabil_JK port map(j => BI(6), k => '0', reset => reset(6), clk => clk, enable => enable, q => Y0(6));
    C7: bistabil_JK port map(j => BI(7), k => '0', reset => reset(7), clk => clk, enable => enable, q => Y0(7));
    C8: bistabil_JK port map(j => BI(8), k => '0', reset => reset(8), clk => clk, enable => enable, q => Y0(8));
    C9: bistabil_JK port map(j => BI(9), k => '0', reset => reset(9), clk => clk, enable => enable, q => Y0(9));
   C10: bistabil_JK port map(j => BI(10), k => '0', reset => reset(10), clk => clk, enable => enable, q => Y0(10));
   C12: bistabil_JK port map(j => BI(12), k => '0', reset => reset(12), clk => clk, enable => enable, q => Y0(12));

end Behavioral;