library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Acount4 is
port( CLK, enable: in std_logic;
      Y: out std_logic_vector(1 downto 0)
	   );
end Acount4;

architecture contador of Acount4 is

    signal cnt: std_logic_vector(1 downto 0) := "00";
    
begin

    process(CLK)
    begin
        if(CLK'event and CLK = '1') then
            if (enable = '1') then
                cnt <= cnt + '1';
            end if;
        end if;
    
    end process;
    Y <= cnt;



end contador;