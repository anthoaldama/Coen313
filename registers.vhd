library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity registers is
port
(clk,reset : in std_logic;
input: in std_logic_vector(5 downto 0);
output: out std_logic_vector (5 downto 0)
);

end registers;

architecture true_output of registers is
signal reg :std_logic_vector(5 downto 0);
begin
process (clk,reset)
begin
if reset='1' then 
reg<=(others=>'0');
elsif rising_edge(clk) then

reg<=input;

end if;
end process;
output<=reg; 
end true_output;
