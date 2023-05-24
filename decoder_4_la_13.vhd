library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder_4_la_13 is
    Port ( etaj : in STD_LOGIC_VECTOR (3 downto 0);
           D : out STD_LOGIC_VECTOR (12 downto 0));
end decoder_4_la_13;

architecture Behavioral of decoder_4_la_13 is

begin
    process(etaj)
    begin
    D <= "0000000000000";
        case etaj is
            when "0000" => D(0) <= '1';
            when "0001" => D(1) <= '1';
            when "0010" => D(2) <= '1';
            when "0011" => D(3) <= '1';
            when "0100" => D(4) <= '1';
            when "0101" => D(5) <= '1';
            when "0110" => D(6) <= '1';
            when "0111" => D(7) <= '1';
            when "1000" => D(8) <= '1';
            when "1001" => D(9) <= '1';
            when "1010" => D(10) <= '1';
            when "1011" => D(11) <= '1';
            when "1100" => D(12) <= '1';
            when others => null;
        end case;
    end process;
end Behavioral;