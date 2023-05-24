library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity numarator_reversibil is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           enable : in STD_LOGIC;  --enable = 0 => numara; enable = 1 => se face hold
           Y_rez : in STD_LOGIC_VECTOR (12 downto 0);
           count : out STD_LOGIC_VECTOR (3 downto 0)
           );
end numarator_reversibil;

architecture Behavioral of numarator_reversibil is
signal etaj_curent : STD_LOGIC_VECTOR (3 downto 0) := "0000"; --porneste de la parter
signal sens: std_logic := '0'; -- initial urca,  1-coboara
signal et : integer := 0; 
signal fara_cerere : integer := 0;  --numarul etajelor superioare/inferioare la care nu exista cerere la urcarea/coborarea liftului
signal etaje_superioare : integer := 0;  --folosit cand sensul este de urcare
signal etaje_inferioare : integer := 0;  --folosit cand sensul este de coborare

begin
process (clk, reset, enable)
begin
    if(clk = '1' and clk'event) then 
        if(reset = '1') then etaj_curent <= "0000"; 
                             fara_cerere <= 0;
        elsif (enable = '1') then  -- se face hold
                  etaj_curent <= etaj_curent;
        elsif (enable = '0') then  --se numara
                  et <= to_integer(unsigned(etaj_curent));  -- etajul curent, ca intreg
                  if(sens = '0') then  -- sens de urcare => se numara crescator 
                         etaje_superioare <= 12 - et;
                         for i in Y_rez'low to Y_rez'high loop  --se parcurge vectorul cu cereri
                                 if(i > et) then                --luam in considerare doar etajele superioare lui et (etajul curent)
                                            if(Y_rez(i) = '1') then  -- i = primul etaj superior la care exista cerere
                                                         if(etaj_curent < "1100") then   --daca liftul nu a ajuns la etajul 12 
                                                                 etaj_curent <= etaj_curent + 1;   --urca in continuare
                                                                 etaje_superioare <= etaje_superioare - 1;  --se decrementeaza nr etajelor superioare ramase
                                                         else  
                                                                 sens <= '1';  --liftul a ajuns la etajul 12 => incepe sa coboare
                                                         end if; 
                                            else 
                                                         fara_cerere <= fara_cerere + 1;  --retinem numarul de etaje superioare la care nu am gasit cerere
                                            end if;
                                 end if;
                         end loop;  
                         if(fara_cerere = etaje_superioare) then  --daca nu exista nici o cerere la etaje superioare, sensul de mers se schimba => incepe sa coboare
                                 sens <= '1';
                                 fara_cerere <= 0;
                         end if;
                  elsif (sens = '1') then  -- sens de coborare => se numara descrescator 
                         etaje_inferioare <= et; --se parcurge vectorul cu cereri
                         for i in Y_rez'low to Y_rez'high loop
                                if(i < et) then --luam in considerare doar etajele inferioare lui et (etajul curent)
                                           if(Y_rez(i) = '1') then  -- i = primul etaj inferior la care exista cerere 
                                                         if(etaj_curent > "0000") then   --daca liftul nu a ajuns la parter
                                                                 etaj_curent <= etaj_curent - 1;  --coboara in continuare
                                                                 etaje_inferioare <= etaje_inferioare - 1; --se decrementeaza nr etajelor inferioare ramase
                                                         else
                                                                 sens <= '0';  --liftul a ajuns la parter => incepe sa urce 
                                                         end if; 
                                            else 
                                                         fara_cerere <= fara_cerere + 1; --retinem numarul de etaje inferioare la care nu am gasit cerere
                                            end if;
                                 end if;       
                         end loop;
                         if(fara_cerere = etaje_inferioare) then --daca nu exista nici o cerere la etaje inferioare, sensul de mers se schimba => incepe sa urce
                                 sens <= '0';
                                 fara_cerere <= 0;
                         end if;
                  end if;
        end if;
    end if;
count <= etaj_curent; 
end process;
end Behavioral;
