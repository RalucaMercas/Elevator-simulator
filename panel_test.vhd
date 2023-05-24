library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity panel_test is
    Port ( enable : in STD_LOGIC;
           clk : in STD_LOGIC;
           BIn : in STD_LOGIC;
           rst : in STD_LOGIC;
           Y : out STD_LOGIC);
end panel_test;

architecture Behavioral of panel_test is

component panou_interior is
    Port ( enable : in STD_LOGIC;
           clk : in STD_LOGIC;
           BI : in STD_LOGIC_VECTOR (12 downto 0);
           reset : in STD_LOGIC_VECTOR (12 downto 0);
           Y0 : out STD_LOGIC_VECTOR (12 downto 0));
end component;

begin

l1: panou_interior port map (enable => enable, clk => clk, bi(0) => bin, bi(12 downto 1) => x"000", reset(0) => rst, reset(12 downto 1) => x"000", y0(0) => y, y0(12 downto 1) => x"000");


end Behavioral;
