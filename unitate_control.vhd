library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity unitate_control is
    Port ( pers_in_usa : in STD_LOGIC;
           greutate : in STD_LOGIC;
           vector_comenzi: in std_logic_vector (12 downto 0);
           en : out STD_LOGIC);
end unitate_control;

architecture Behavioral of unitate_control is
component poarta_sau_nu_2 is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           c : out STD_LOGIC);
end component;

component poarta_si_2 is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           c : out STD_LOGIC);
end component;

signal I0: std_logic;
signal orders: std_logic;

begin

orders <= vector_comenzi(0) or vector_comenzi(1) or vector_comenzi(2) or vector_comenzi(3) or vector_comenzi(4) or vector_comenzi(5) or vector_comenzi(6) or vector_comenzi(7) or vector_comenzi(8) or vector_comenzi(9) or vector_comenzi(10) or vector_comenzi(11) or vector_comenzi(12);

C1: poarta_sau_nu_2 port map(a => pers_in_usa, b => greutate, c => I0);
C2: poarta_si_2 port map(a => I0, b => orders, c => en);
end Behavioral;