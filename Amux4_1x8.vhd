library ieee;
use ieee.std_logic_1164.all;

entity Amux4_1x8 is
port(
    A, B, C, D: in std_logic_vector(7 downto 0);
    sig: in std_logic_vector(1 downto 0);
    Y: out std_logic_vector(7 downto 0)
	);
end Amux4_1x8;

architecture mux4x8 of Amux4_1x8 is

begin
    
  y <=  A when sig = "00" else
        B when sig = "01" else   
        C when sig = "10" else
        D when sig = "11";
        
        


end mux4x8;