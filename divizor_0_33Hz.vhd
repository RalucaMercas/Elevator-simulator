library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity divizor_0_33Hz is
    Port ( clk : in STD_LOGIC;
           div_clk_0_33 : out STD_LOGIC);
end divizor_0_33Hz;

architecture Behavioral of divizor_0_33Hz is
signal tmp: integer := 1;
begin
    process(clk)
    begin
    if (rising_edge(clk)) then
        if(tmp = 300000000) then tmp <= 1;
        elsif(tmp <= 150000000) then 
              tmp <= tmp + 1;
              div_clk_0_33 <= '0';
        else  div_clk_0_33 <= '1';
              tmp <= tmp + 1;
        end if;
    end if;
    end process;
end Behavioral;