library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder_bcd_7seg is
    Port ( hex_in : in STD_LOGIC_VECTOR (3 downto 0);
           abcdefg : out STD_LOGIC_VECTOR (6 downto 0);
           an: out std_logic_vector(3 downto 0);
           clk: in std_logic );
end decoder_bcd_7seg;

architecture Behavioral of decoder_bcd_7seg is
signal anod: std_logic_vector(3 downto 0);
begin

    process (hex_in)
        begin
            an <= "1110";
            case hex_in is
                when "0000" => abcdefg <= "0000001"; --0
                when "0001" => abcdefg <= "1001111"; --1
                when "0010" => abcdefg <= "0010010"; --2
                when "0011" => abcdefg <= "0000110"; --3
                when "0100" => abcdefg <= "1001100"; --4
                when "0101" => abcdefg <= "0100100"; --5
                when "0110" => abcdefg <= "0100000"; --6
                when "0111" => abcdefg <= "0001111"; --7
                when "1000" => abcdefg <= "0000000"; --8
                when "1001" => abcdefg <= "0000100"; --9
                when "1010" => abcdefg <= "0001000"; --10
                when "1011" => abcdefg <= "1100000"; --11
                when "1100" => abcdefg <= "0110001"; --12
                when others => abcdefg <= "0000000"; -- default case
            end case;
    end process;

end Behavioral;