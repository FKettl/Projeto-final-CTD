library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity AcountToupeira is
port( PACE, STATE_01, STATE_10, R1: in std_logic;
      Trial2_0: out std_logic_vector(2 downto 0);
      TC7: out std_logic
	   );
end AcountToupeira;

architecture contadorTop of AcountToupeira is

    signal cnt: std_logic_vector(2 downto 0) := "000";
    signal enable, Reset: std_logic;
    
begin
    
    enable <= STATE_01;
    Trial2_0 <= cnt;
    Reset <= (STATE_10 or R1);
    
    TC7 <= '1' when cnt = "111" else 
           '0';
    
    process(PACE, Reset)
    begin
        if (Reset = '1') then
            cnt <= "000";
        end if;
        
        if(PACE'event and PACE = '1') then
            if (enable = '1') then
                cnt <= cnt + '1';
            end if;
        end if;
    
    end process;

end contadorTop;