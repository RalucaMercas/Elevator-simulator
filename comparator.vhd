library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity comparator is
    Port ( etaj_curent : in STD_LOGIC_VECTOR (3 downto 0);
           etaj_cu_cerere : in STD_LOGIC_VECTOR (3 downto 0);
           greater : out STD_LOGIC);
end comparator;

architecture Behavioral of comparator is

begin

    greater <= '1' when (etaj_cu_cerere > etaj_curent) else '0';

end Behavioral;
