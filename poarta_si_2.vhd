library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity poarta_si_2 is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           c : out STD_LOGIC);
end poarta_si_2;

architecture Behavioral of poarta_si_2 is

begin
    c <= a and b;

end Behavioral;