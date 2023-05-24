library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_2_la_1 is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           viteza : in STD_LOGIC;
           y : out STD_LOGIC);
end mux_2_la_1;

architecture Behavioral of mux_2_la_1 is

begin
    process(a, b, viteza)
    begin
        if viteza = '0' then
            y <= a;
        else
            y <= b;
        end if;
    end process;
end Behavioral;