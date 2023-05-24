LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

ENTITY numarator IS
  PORT ( clk: in std_logic;
  		 count_enable: in std_logic;
  		 dir: in std_logic;
  		 etaj_cu_cerere: in std_logic_vector (3 downto 0);
  		 iesire: out std_logic_vector (3 downto 0));
END numarator;


ARCHITECTURE arch OF numarator IS
signal V: std_logic_vector(3 downto 0) := "0000";
BEGIN

    process (clk, count_enable, dir, etaj_cu_cerere)
    begin
        if(count_enable = '1') then 
            if(clk = '1' and clk'event) then
                if(dir = '1')then  --urca
                    if(V < etaj_cu_cerere) then V <= V + 1;
                    end if;
               else    --coboara
                    if(V > etaj_cu_cerere) then V <= V - 1;
                    end if;
               end if;
            end if;
        end if;
    end process;
    iesire <= V;

end arch;