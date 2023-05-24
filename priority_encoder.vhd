library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity priority_encoder is
    Port ( Y_rez : in STD_LOGIC_VECTOR (12 downto 0);
           etaj_cu_comanda : out STD_LOGIC_VECTOR (3 downto 0));
end priority_encoder;

architecture Behavioral of priority_encoder is

begin
    
    process (Y_rez)
    begin
        if(Y_rez(12) = '1') then etaj_cu_comanda <= "1100";
        elsif (Y_rez(11) = '1') then etaj_cu_comanda <= "1011";
        elsif (Y_rez(10) = '1') then etaj_cu_comanda <= "1010";
        elsif (Y_rez(9) = '1') then etaj_cu_comanda <= "1001";
        elsif (Y_rez(8) = '1') then etaj_cu_comanda <= "1000";
        elsif (Y_rez(7) = '1') then etaj_cu_comanda <= "0111";
        elsif (Y_rez(6) = '1') then etaj_cu_comanda <= "0110";
        elsif (Y_rez(5) = '1') then etaj_cu_comanda <= "0101";
        elsif (Y_rez(4) = '1') then etaj_cu_comanda <= "0100";
        elsif (Y_rez(3) = '1') then etaj_cu_comanda <= "0011";
        elsif (Y_rez(2) = '1') then etaj_cu_comanda <= "0010";
        elsif (Y_rez(1) = '1') then etaj_cu_comanda <= "0001";
        elsif (Y_rez(0) = '1') then etaj_cu_comanda <= "0000";
        else etaj_cu_comanda <= "1111"; 
        end if;
    end process;

end Behavioral;
