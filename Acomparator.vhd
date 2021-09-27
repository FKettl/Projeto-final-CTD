library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Acomparator is
port( Toup, SW: in std_logic_vector(7 downto 0);
      comp_score: out std_logic
	   );
end Acomparator;

architecture contadorTop of Acomparator is

begin
    
comp_score <= '1' when (Toup = SW) and (Toup /= "00000000") else
              '0';

end contadorTop;