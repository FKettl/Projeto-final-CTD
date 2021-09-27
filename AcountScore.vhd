library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity AcountScore is
port(CLK, acerto, STATE_01, Reset: in std_logic;
      Trial4_3: in std_logic_vector(1 downto 0);
      Score: out std_logic_vector(7 downto 0)
	   );
end AcountScore;

architecture contadorT of AcountScore is

    signal cnt: std_logic_vector(7 downto 0) := "00000000";
    signal enable: std_logic;
    
begin
    
    enable <= (STATE_01 and acerto);
    Score <= cnt;
    
    process(CLK, Reset)
    begin
        if (Reset = '1') then
            cnt <= "00000000";
        end if;
        if(CLK'event and CLK = '1') then
            if (enable = '1') then
                cnt <= cnt + '1' + Trial4_3;
            end if;
        end if;
    
    end process;
    



end contadorT;