library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity poarta_sau_nu_2 is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           c : out STD_LOGIC);
end poarta_sau_nu_2;

architecture Behavioral of poarta_sau_nu_2 is

begin

c <= a nor b;

end Behavioral;