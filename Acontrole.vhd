library ieee;
use ieee.std_logic_1164.all;

entity Acontrole is
port(CLK_500hz, enter, reset, end_game, end_round: in std_logic;
     R1: out std_logic;
     state: out std_logic_Vector(1 downto 0)
	);
end Acontrole;

architecture controlador of Acontrole is

    type STATES is (START, SETUP, PLAY, NEXT_ROUND, final);
    signal EAtual, PEstado: STATES;

begin
    
    process(CLK_500hz, reset)
    begin
        if (reset = '1') then
            EAtual <= START;
            
            
        elsif (CLK_500hz'event and CLK_500hz = '1') then
            EAtual <= PEstado;
            
        end if;
    end process;
    
    process(EAtual, enter, end_round, end_game)
    begin
        case EAtual is
            when START =>
                state <= "00";
                R1 <= '1';
                PEstado <= SETUP;
                    
            when SETUP =>
                R1 <= '0';
                state <= "00"; 
                if enter = '1' then
                    PEstado <= PLAY;
                else
                    PEstado <= SETUP;
                end if;
                
            when PLAY =>
                R1 <= '0';
                state <= "01";
                if end_round = '1' then
                    PEstado <= NEXT_ROUND;
                elsif end_game = '1' then
                    PEstado <= final;
                else
                    PEstado <= PLAY;
                end if;
                
            when NEXT_ROUND =>
                state <= "10";
                R1 <= '0';
                if enter ='1' then
                    PEstado <= PLAY;
                else
                    PEstado <= NEXT_ROUND;
                end if;   
                    
            when final =>
                state <= "11";
                R1 <= '0';
                PEstado <= final;
                
                
        end case;
    end process;
        
end controlador;                       