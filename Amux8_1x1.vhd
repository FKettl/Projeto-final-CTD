library ieee;
use ieee.std_logic_1164.all;

entity Amux8_1x1 is
port(
    A, B, C, D, E, F, G, H: in std_logic;
    sig: in std_logic_vector(2 downto 0);
    Y: out std_logic
	);
end Amux8_1x1;

architecture mux81 of Amux8_1x1 is

begin
    
  y <=  A when sig = "000" else
        B when sig = "001" else   
        C when sig = "010" else
        D when sig = "011" else
        E when sig = "100" else
        F when sig = "101" else
        G when sig = "110" else
        H when sig = "111";
        
        


end mux81;