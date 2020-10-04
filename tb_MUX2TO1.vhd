library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY tb_MUX2TO1 IS
END tb_MUX2TO1;

ARCHITECTURE behavior OF tb_MUX2TO1 IS

-- Component Declaration for the UUT

   COMPONENT MUX2TO1 is
   port ( in1     : in  std_logic_vector(15 downto 0);
          in2     : in  std_logic_vector(15 downto 0);
          s       : in  std_logic;
          mux_out : out std_logic_vector(15 downto 0) 
         );
   end COMPONENT;   

	
    signal   s                : std_logic ;
    signal   in1,in2, mux_out : std_logic_vector(15 downto 0);
    constant time_delay       : time := 20 ns;
    
    
    BEGIN
    -- Instantiate the Unit Under Test (UUT)
    
    uut: MUX2TO1 port map ( 
	        in1     => in1,
           in2     => in2,
           s       => s,
           mux_out => mux_out 
          );
 
            
    -- Stimulus process 
      stim_process: process 
      begin
		  assert false report "MUX2TO1 testbench started"; 
		  wait for time_delay;
		  in1 <= X"0000"; in2 <= X"0000"; 
        wait for time_delay;
		  s <= '0'; 
		  wait for time_delay;
		  in1 <= X"0005"; in2 <= X"1010"; 
        wait for time_delay;
		  in1 <= "1010"; in2 <= "0101"; 
        wait for time_delay;
		  s <= '1'; 
		  wait for time_delay;
		  in1 <= "0101"; in2 <= "1010"; 
        wait for time_delay;
		  s <= '0'; 
		  wait for 10*time_delay; 
		  assert false report "MUX2TO1 testbench completed"; 
        wait;	  

	   end process;  
 
END;
