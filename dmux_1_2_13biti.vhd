library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dmux_1_2_13biti is
    Port ( D : in STD_LOGIC_VECTOR (12 downto 0);
           BI : out STD_LOGIC_VECTOR (12 downto 0);
           BE : out STD_LOGIC_VECTOR (12 downto 0);
           panou: in std_logic  --selectia
           );
end dmux_1_2_13biti;

architecture Behavioral of dmux_1_2_13biti is
begin
    process (panou)
    begin
         if (panou = '0') then
               BI <= D;
               BE <= "0000000000000";
         elsif (panou = '1') then
               BE <= D;
               BI <= "0000000000000";
         end if;
    end process;
end Behavioral;