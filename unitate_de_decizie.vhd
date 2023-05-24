library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity unitate_de_decizie is
    Port ( clk: in std_logic;
           Y_rez : in STD_LOGIC_VECTOR (12 downto 0);
           en : in STD_LOGIC;
           count : out STD_LOGIC_VECTOR (3 downto 0));
end unitate_de_decizie;

architecture Behavioral of unitate_de_decizie is

component numarator IS
  PORT (clk: in std_logic;
  		count_enable: in std_logic;
  		dir: in std_logic;
  		etaj_cu_cerere: in std_logic_vector (3 downto 0);
  		iesire: out std_logic_vector (3 downto 0));
END component;

component comparator is
    Port ( etaj_curent : in STD_LOGIC_VECTOR (3 downto 0);
           etaj_cu_cerere : in STD_LOGIC_VECTOR (3 downto 0);
           greater : out STD_LOGIC);
end component;

component priority_encoder is
    Port ( Y_rez : in STD_LOGIC_VECTOR (12 downto 0);
           etaj_cu_comanda : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal et_cu_cerere: std_logic_vector(3 downto 0);
signal directie: std_logic;
signal et_curent: std_logic_vector (3 downto 0);
begin
c1: priority_encoder port map (Y_rez => Y_rez, etaj_cu_comanda => et_cu_cerere);
c2: comparator port map (etaj_curent => et_curent, etaj_cu_cerere => et_cu_cerere, greater => directie);
c3: numarator port map (clk => clk, count_enable => en, dir => directie, etaj_cu_cerere => et_cu_cerere, iesire => et_curent);
count <= et_curent;
end Behavioral;
