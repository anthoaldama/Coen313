library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;


entity mux is
port(in1, in2 , clk:in std_logic;
occupency: in std_logic_vector (5 downto 0);
next_occupency : out std_logic_vector ( 5 downto 0));
end mux;

architecture true_output of mux is


begin





    process(clk)
    begin 
        if rising_edge(clk) then  -- Ensure synchronous operation
            if in1= '1' and in2 = '0' then
                -- Increment occupancy
                if occupency < "111111" then  -- Check for maximum limit
                    next_occupency<= occupency + 1;
                else
                    next_occupency <= occupency;  -- No change if at max
                end if;
            elsif in1= '0' and in2 = '1' then
                -- Decrement occupancy
                if occupency > "000000" then  -- Check for minimum limit
                    next_occupency <= occupency - 1;
                else
                    next_occupency <= occupency;  -- No change if at min
                end if;
            else
                -- Keep occupancy the same
                next_occupency<= occupency;
            end if;
        end if;
    end process;
end true_output;
