library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity AcountTrial is
port( CLK, STATE_10, btn, Reset: in std_logic;
      Trial4_3: out std_logic_vector(1 downto 0);
      TCN3: out std_logic
	   );
end AcountTrial;

architecture contadorT of AcountTrial is

    signal cnt: std_logic_vector(1 downto 0) := "00";
    signal enable: std_logic;
    
begin
    
    enable <= (STATE_10 and btn);
    Trial4_3 <= cnt;
    TCN3 <= '1' when cnt < "11" else
            '0';
    
    process(CLK, Reset)
    begin
        if (Reset = '1') then
            cnt <= "00";
        end if;
        if(CLK'event and CLK = '1') then
            if (enable = '1') then
                cnt <= cnt + '1';
            end if;
        end if;
    
    end process;
    



end contadorT;