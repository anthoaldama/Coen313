library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity max_comparateur is
port (clk : in std_logic;
max_occupency,occupency: in std_logic_vector(5 downto 0);
z:out std_logic);
---declare port

end entity max_comparateur;

architecture true_output of max_comparateur is
begin
process(clk)
begin
if rising_edge(clk) then 
if occupency>=max_occupency then
z<='1';
else 
z<='0';
end if;
end if;
end process;
end architecture true_output;
