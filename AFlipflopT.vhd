library ieee;
use ieee.std_logic_1164.all;

entity AFlipflopT is
port(
    CLK, Enable: in std_logic;
    T: in std_logic;
	Q: out std_logiC
	);
end AFlipflopT;

architecture flip of AFlipflopT is
signal QA: std_logic := '0'; 

begin
    
    
    
    process(CLK, Enable)
    begin
        if (CLK'event and CLK = '1') then
            if (Enable = '0') then
                QA <= QA;
            
            elsif (Enable = '1') then
                if (T = '1') then
                    QA <= not QA;
                else
                    QA <= QA;
                end if;
            end if;
        end if;
    end process;
    
    Q <= QA;
    
end flip;

