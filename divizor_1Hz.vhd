library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity divizor_1Hz is
    Port ( clk : in STD_LOGIC;
           div_clk_1 : out STD_LOGIC);
end divizor_1Hz;

architecture Behavioral of divizor_1Hz is
signal tmp: integer := 1;
begin
    process(clk)
    begin
    if (rising_edge(clk)) then
        if(tmp = 100000000) then tmp <= 1;
        elsif(tmp <= 50000000) then 
              tmp <= tmp + 1;
              div_clk_1 <= '0';
        else  div_clk_1 <= '1';
              tmp <= tmp + 1;
        end if;
    end if;
    end process;
end Behavioral;