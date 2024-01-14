Library ieee;
USE IEEE.STD_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity tb_final is

begin
end tb_final;

architecture true_output of tb_final is

 CONSTANT max_time : TIME := 2000 ns;
 CONSTANT clk_p : TIME := 10 ns;


component counter is
port(clk,reset,x,y : in std_logic;
z :out std_logic
);
end component;


signal output1,clk1,reset1,x,y:std_logic;


--specs
for counter1: counter use entity work.counter(true_output);

begin

clk_process :process
variable simulation_t:time;
begin 
simulation_t:=0 ns;
while simulation_t<=max_time loop
clk1<='0';
wait for clk_p/2;
clk1<='1';
wait for clk_p/2;
simulation_t:=simulation_t+clk_p;
end loop;
wait;
end process;


counter1 :counter port map(
clk=>clk1,
reset=>reset1,
x=>x,
y=>y,
z=>output1
);



simulation : process
begin
 WAIT UNTIL clk1'event AND clk1 = '0';
        reset1 <= '1';
        WAIT UNTIL clk1'event AND clk1 = '0';
        reset1 <= '0';

        -- increment x
        WAIT UNTIL clk1'event AND clk1 = '0';
        x <= '1';
y<='0';

 -- Person enters for the first time
        WAIT UNTIL clk1'event AND clk1 = '0';
        x <= '0';

        -- decrement y
        WAIT UNTIL clk1'event AND clk1 = '0';
        y <= '1'; -- Person exits for the first time 
        WAIT UNTIL clk1'event AND clk1 = '0';
        y <= '0';

        -- go to max to see z change
        FOR i IN 1 TO 64 LOOP
            WAIT UNTIL clk1'event AND clk1 = '0';
            x <= '1';
            WAIT UNTIL clk1'event AND clk1 = '0';
            x <= '0';
        END LOOP;

       --testing the reset
        WAIT UNTIL clk1'event AND clk1= '0';
        reset1 <= '1';
        WAIT UNTIL clk1'event AND clk1= '0';
        reset1 <= '0';

        WAIT; -- End of simulation
    END PROCESS;

END true_output;


