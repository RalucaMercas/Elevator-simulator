library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity selectare_viteza is
    Port ( clk : in STD_LOGIC;
           viteza : in STD_LOGIC;
           clk_divizat : out STD_LOGIC);
end selectare_viteza;

architecture Behavioral of selectare_viteza is
component divizor_1Hz is
    Port ( clk : in STD_LOGIC;
           div_clk_1 : out STD_LOGIC);
end component;
component divizor_0_33Hz is
    Port ( clk : in STD_LOGIC;
           div_clk_0_33 : out STD_LOGIC);
end component;
component mux_2_la_1 is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           viteza : in STD_LOGIC;
           y : out STD_LOGIC);
end component;
signal div_clk_1: std_logic;
signal div_clk_0_33: std_logic;

begin

c1: divizor_1Hz port map (clk => clk, div_clk_1 => div_clk_1);
c2: divizor_0_33Hz port map (clk => clk, div_clk_0_33 => div_clk_0_33);
c3: mux_2_la_1 port map (a => div_clk_1, b => div_clk_0_33, viteza => viteza, y => clk_divizat);

end Behavioral;
