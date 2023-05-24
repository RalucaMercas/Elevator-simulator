library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dmux_test is
 Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
        BI : out STD_LOGIC_VECTOR (2 downto 0);
        BE : out STD_LOGIC_VECTOR (2 downto 0);
        panou: in std_logic  --selectia
       );
 end dmux_test;

architecture Behavioral of dmux_test is
component dmux_1_2_13biti is
    Port ( D : in STD_LOGIC_VECTOR (12 downto 0);
           BI : out STD_LOGIC_VECTOR (12 downto 0);
           BE : out STD_LOGIC_VECTOR (12 downto 0);
           panou: in std_logic  --selectia
           );
end component dmux_1_2_13biti;
begin

l1: dmux_1_2_13biti port map (D (2 downto 0)=> D, D(12 downto 3) => "0000000000", BI (2 downto 0)=> BI, BI(12 downto 3) => "0000000000", BE (2 downto 0)=> BE, BE(12 downto 3) => "0000000000", panou => panou);

end Behavioral;
