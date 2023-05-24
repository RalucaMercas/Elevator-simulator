library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bistabil_JK is
    Port ( J : in STD_LOGIC;
           K : in STD_LOGIC;
           clk : in STD_LOGIC;
           enable : in STD_LOGIC;
           reset: in std_logic;
           Q : out STD_LOGIC);
end bistabil_JK;


architecture Behavioral of bistabil_JK is
signal tmp: std_logic := '0';
begin
    process(clk, reset)
    begin
        if reset = '1' then
            tmp <= '0';
        elsif (clk = '1' and clk'event)then
             if(enable = '1') then
                 if (J = '0' and K = '0') then tmp <= tmp;
                 elsif (J = '0' and K = '1') then tmp <= '0';
                 elsif (J = '1' and K = '0') then tmp <= '1';
                 elsif (J = '1' and K = '1') then tmp <= not tmp;
                 end if;    
             else
                tmp <= tmp;
             end if;
        end if;      
    end process;
    Q <= tmp;
end Behavioral;