library ieee;
use ieee.std_logic_1164.all;

entity Atoupeira is
port(KEY: in std_logic_vector(3 downto 0); 
     SW: in std_logic_vector(7 downto 0);
     CLK: in std_logic; 
     HEX0, HEX1, HEX2: out std_logic_vector(6 downto 0);
     LED: out std_logic_vector(7 downto 0)
     );
end Atoupeira;

architecture jogo of Atoupeira is

signal btn0, btn1, btn2, btn3, R1, end_game, end_round: std_logic;
signal state: std_logic_vector(1 downto 0);

component AButtonSync is
	port
	(
		KEY0, KEY1, KEY2, KEY3, CLK: in std_logic;
		BTN0, BTN1, BTN2, BTN3: out std_logic
	);
end component;

component Adatapath is 
port (btn3, btn2, btn1, CLK_500Hz, r1: in std_logic;
      state: in std_logic_vector(1 downto 0);
      sw_entra: in std_logic_vector(7 downto 0);
      h0, h1, h2: out std_logic_vector(6 downto 0);
      led_out: out std_logic_vector (7 downto 0);
      end_game, end_round: out std_logic);
end component;

component Acontrole is
port(CLK_500hz, enter, reset, end_game, end_round: in std_logic;
     R1: out std_logic;
     state: out std_logic_Vector(1 downto 0)
	);
end component;

begin

-- button sync
bttsnc: AButtonSync port map (KEY(0), KEY(1), KEY(2), KEY(3), CLK, btn0, btn1, btn2, btn3);

-- jogo
datapath1: Adatapath port map (btn3, btn2, btn1, CLK, R1, state, SW, HEX0, HEX1, HEX2, LED, end_game, end_round);
controle1: Acontrole port map(CLK, btn3, btn0, end_game, end_round, R1, state);


end jogo;