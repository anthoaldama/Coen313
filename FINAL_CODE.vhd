library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity counter is
port(clk,reset,x,y : in std_logic;
z :out std_logic
);
end counter;


architecture true_output of counter is

component mux is
port(in1, in2 , clk:in std_logic;
occupency: in std_logic_vector (5 downto 0);
next_occupency : out std_logic_vector ( 5 downto 0)
);
end component;


component registers is
port
(clk,reset : in std_logic;
input: in std_logic_vector(5 downto 0);
output: out std_logic_vector (5 downto 0)
);
end component;


component max_comparateur is
port (clk : in std_logic;
max_occupency,occupency: in std_logic_vector(5 downto 0);
z:out std_logic);
end component;



signal occupencyy:std_logic_vector(5 downto 0):="000000";
signal next_occupencyy: std_logic_vector(5 downto 0):="000000";
signal max_occupencyy: std_logic_vector(5 downto 0):="111111";
signal max_registerr: std_logic_vector(5 downto 0) :="000000";



 for all: registers use entity work.registers(true_output);
    for mux1 : mux use entity work.mux(true_output);
    for max_comparateur1 : max_comparateur use entity work.max_comparateur(true_output);

begin

register_current_occupency : registers port map(
clk=>clk,
reset=>reset,
input=>next_occupencyy,
output=>occupencyy
);


register_max_occ :registers port map(
clk=>clk,
reset=>reset,
input=>max_occupencyy,
output=>max_registerr);


mux1: mux port map(
clk=>clk,

in1=>x,
in2=>y,
next_occupency=>next_occupencyy,
occupency=>occupencyy
);

max_comparateur1: max_comparateur port map (
clk=>clk,
occupency=>occupencyy,
max_occupency=>max_occupencyy,
z=>z
);

end true_output;

