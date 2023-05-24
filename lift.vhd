library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lift is
    Port ( clk: in std_logic;
           etaj : in STD_LOGIC_VECTOR (3 downto 0);
           panou : in STD_LOGIC;
           ok : in STD_LOGIC;
           greutate : in STD_LOGIC;
           pers_in_usa : in STD_LOGIC;
           viteza : in STD_LOGIC;
           usa_d : out STD_LOGIC;
           greutate_d : out STD_LOGIC;
           state: out std_logic_vector (12 downto 0);
           afisor : out STD_LOGIC_VECTOR (6 downto 0);
           an: out STD_LOGIC_VECTOR(3 downto 0));
end lift;

architecture automat of lift is
component unitate_control is
    Port ( pers_in_usa : in STD_LOGIC;
           greutate : in STD_LOGIC;
           vector_comenzi: in std_logic_vector (12 downto 0);
           en : out STD_LOGIC);
end component;

component decoder_4_la_13 is
    Port ( etaj : in STD_LOGIC_VECTOR (3 downto 0);
           D : out STD_LOGIC_VECTOR (12 downto 0));
end component;

component dmux_1_2_13biti is
    Port ( D : in STD_LOGIC_VECTOR (12 downto 0);
           BI : out STD_LOGIC_VECTOR (12 downto 0);
           BE : out STD_LOGIC_VECTOR (12 downto 0);
           panou: in std_logic  --selectia
          );
end component;

component panou_interior is
    Port ( enable : in STD_LOGIC;
           clk : in STD_LOGIC;
           BI : in STD_LOGIC_VECTOR (12 downto 0);
           reset : in STD_LOGIC_VECTOR (12 downto 0);
           Y0 : out STD_LOGIC_VECTOR (12 downto 0));
end component;

component panou_exterior is
    Port ( enable : in STD_LOGIC;
           clk : in STD_LOGIC;
           BE : in STD_LOGIC_VECTOR (12 downto 0);
           reset : in STD_LOGIC_VECTOR (12 downto 0);
           Y1 : out STD_LOGIC_VECTOR (12 downto 0));
end component;

component poarta_sau is
    Port ( y0 : in STD_LOGIC_VECTOR (12 downto 0);
           y1 : in STD_LOGIC_VECTOR (12 downto 0);
           y_rez : out STD_LOGIC_VECTOR (12 downto 0));
end component;

component decoder_bcd_7seg is
    Port ( hex_in : in STD_LOGIC_VECTOR (3 downto 0);
           abcdefg : out STD_LOGIC_VECTOR (6 downto 0);
           an: out std_logic_vector(3 downto 0);
           clk: in std_logic);
end component;

component selectare_viteza is
    Port ( clk : in STD_LOGIC;
           viteza : in STD_LOGIC;
           clk_divizat : out STD_LOGIC);
end component;

component decoder_4_la_13_2 is
    Port ( etaj : in STD_LOGIC_VECTOR (3 downto 0);
           D : out STD_LOGIC_VECTOR (12 downto 0));
end component;

component unitate_de_decizie is
    Port ( clk: in std_logic;
           Y_rez : in STD_LOGIC_VECTOR (12 downto 0);
           en : in STD_LOGIC;
           count : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component debouncer is
    Port ( btn : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           enable : out  STD_LOGIC);
end component debouncer;

component reset_delay is
    Port ( clk: in std_logic;
           D : in STD_LOGIC_VECTOR (12 downto 0);
           Q : out STD_LOGIC_VECTOR (12 downto 0));
end component reset_delay;

component falling_edge_detector is
    Port ( input : in STD_LOGIC;
           clk : in STD_LOGIC;
           pulse : out STD_LOGIC);
end component falling_edge_detector;

component door_open_timer is
    Port ( start : in STD_LOGIC;
           clk : in STD_LOGIC;
           active : out STD_LOGIC);
end component door_open_timer;


signal dcd_dmux: std_logic_vector (12 downto 0); 
signal inter_bus: std_logic_vector (12 downto 0);
signal en: STD_LOGIC;
signal ibtn: std_logic; 
signal BI : STD_LOGIC_VECTOR (12 downto 0);  --leaga prima iesire de la dmux de panoul interior 
signal BE : STD_LOGIC_VECTOR (12 downto 0);  --leaga a doua iesire de la dmux de panoul exterior
signal reset_panou_i: std_logic_vector (12 downto 0);  --pentru panoul interior
signal reset_panou_e: std_logic_vector (12 downto 0);  --pentru panoul exterior
signal Y0: std_logic_vector (12 downto 0);  --iesire a panoului interior si intrare a portii sau
signal Y1: std_logic_vector (12 downto 0);  --iesire a panoului exterior si intarre a portii sau
signal Y_rez: std_logic_vector (12 downto 0);  --iesire a portii sau si intrare a unitatii de decizie
signal count: std_logic_vector (3 downto 0); --intrare a decodificatorului bcd 7 segmente
signal clk_divizat: std_logic; --iesire de la componenta "selectare_viteza" si intrare de clk pt numarator
signal interr_sig: std_logic;
signal ce: std_logic;
signal enable: std_logic;

begin
    c0: debouncer port map(btn => ok, clk => clk, enable => ibtn);
    c1: unitate_control port map (pers_in_usa => pers_in_usa, greutate => greutate, vector_comenzi => Y_rez, en => en);
    c2: decoder_4_la_13 port map (etaj => etaj, D => dcd_dmux);
    c3: dmux_1_2_13biti port map (D => dcd_dmux, BI => BI, BE => BE, panou => panou);
    c4: panou_interior port map (enable => ibtn, clk => clk, BI => BI, reset => reset_panou_i, Y0 => Y0);
    c5: panou_exterior port map (enable => ibtn, clk => clk, BE => BE, reset => reset_panou_i, Y1 => Y1);
    c6: poarta_sau port map (y0 => Y0, y1 => Y1, y_rez => Y_rez);
    c7: unitate_de_decizie port map (clk => clk_divizat, Y_rez => Y_rez, en => enable, count => count);
    c8: decoder_bcd_7seg port map (hex_in => count, abcdefg => afisor, an => an, clk => clk);
    c9: selectare_viteza port map (clk => clk, viteza => viteza, clk_divizat => clk_divizat);
    c10: decoder_4_la_13_2 port map (etaj => count, D => reset_panou_i);
    c11: for i in 0 to 12 generate
        c12: falling_edge_detector port map(input => Y_rez(i), clk => clk, pulse => inter_bus(i));
    end generate;
    enable <= (not ce) and en;
    c13: door_open_timer port map(start => interr_sig, clk => clk_divizat, active => ce);
    interr_sig <= inter_bus(0) or inter_bus(1) or inter_bus(2) or inter_bus(3) or inter_bus(4) or inter_bus(5) or inter_bus(6) or inter_bus(7) or inter_bus(8) or inter_bus(9) or inter_bus(10) or inter_bus(11) or inter_bus(12);
    usa_d <= pers_in_usa;
    greutate_d <= greutate;
    state <= y_rez;
end automat;