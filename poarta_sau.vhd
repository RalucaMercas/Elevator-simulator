library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity poarta_sau is
    Port ( y0 : in STD_LOGIC_VECTOR (12 downto 0);
           y1 : in STD_LOGIC_VECTOR (12 downto 0);
           y_rez : out STD_LOGIC_VECTOR (12 downto 0));
end poarta_sau;

architecture Behavioral of poarta_sau is

begin
    y_rez <= y0 or y1;
end Behavioral;