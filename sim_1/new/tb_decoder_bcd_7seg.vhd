library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_decoder_bcd_7seg is
--  Port ( );
end tb_decoder_bcd_7seg;

architecture Behavioral of tb_decoder_bcd_7seg is
component decoder_bcd_7seg is
    Port ( hex_in : in STD_LOGIC_VECTOR (3 downto 0);
           abcdefg : out STD_LOGIC_VECTOR (6 downto 0));
end component;

signal hex_in_test: std_logic_vector(3 downto 0);
signal abcdefg_test: std_logic_vector(6 downto 0);

begin
    ust: decoder_bcd_7seg port map(hex_in_test, abcdefg_test);
    
    process
    begin
    hex_in_test <= "0000";
    wait for 20 ns;
    
    hex_in_test <= "0001";
    wait for 20 ns;
    
    hex_in_test <= "0010";
    wait for 20 ns;
    
    hex_in_test <= "0011";
    wait for 20 ns;
    
    hex_in_test <= "0100";
    wait for 20 ns; 
    
    hex_in_test <= "0101";
    wait for 20 ns;    
    
    hex_in_test <= "0110";
    wait for 20 ns;
    
    hex_in_test <= "0111";
    wait for 20 ns;
    
    hex_in_test <= "1000";
    wait for 20 ns;
    
    hex_in_test <= "1001";
    wait for 20 ns;

    hex_in_test <= "1010";
    wait for 20 ns;
    
    hex_in_test <= "1011";
    wait for 20 ns;
    
    hex_in_test <= "1100";
    wait for 20 ns;      
    end process;

end Behavioral;