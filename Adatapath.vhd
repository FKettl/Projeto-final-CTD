library ieee;
use ieee.std_logic_1164.all;

entity Adatapath is 
port (btn3, btn2, btn1, CLK_500Hz, r1: in std_logic;
      state: in std_logic_vector(1 downto 0);
      sw_entra: in std_logic_vector(7 downto 0);
      h0, h1, h2: out std_logic_vector(6 downto 0);
      led_out: out std_logic_vector (7 downto 0);
      end_game, end_round: out std_logic);
end Adatapath;

architecture arqdata of Adatapath is
signal toup, score, Oseq1, Oseq2, Oseq3, Oseq4: std_logic_vector(7 downto 0);
signal sai_h2s0, sai_h2s2, sai_h1s2, sai_h1s3, d7seg: std_logic_vector(6 downto 0);
signal trial: std_logic_vector(4 downto 0);
signal entra_h00e0, entra_h00e1, entra_h02e1, sai_h0s0, sai_h0s2, sai_h0s3, sai_m0: std_logic_vector(3 downto 0);
signal seq, nivel: std_logic_vector(1 downto 0);
signal pace, setup_sel, out0, out1, comp_score, STATE_01, STATE_10, TC7, TCN3, acerto, resetclock: std_logic;
signal CLK_0_25Hz, CLK_0_5Hz, CLK_0_75Hz, CLK_1Hz, CLK_1_25Hz, CLK_1_5Hz, CLK_2Hz : std_logic;
signal ckproc_sel, clk_sel: std_logic_vector(2 downto 0);

component AFlipflopT is
port(
    CLK, Enable: in std_logic;
    T: in std_logic;
	Q: out std_logiC
	);
end component;

component AcountScore is
port(CLK, acerto, STATE_01, Reset: in std_logic;
      Trial4_3: in std_logic_vector(1 downto 0);
      Score: out std_logic_vector(7 downto 0)
	   );
end component;

component AComparatorSync is
	port
	(
		entrada, CLK: in std_logic;
		saida: out std_logic
	);
end component;

component Acomparator is
port( Toup, SW: in std_logic_vector(7 downto 0);
      comp_score: out std_logic
	   );
end component;

component Aseq1 is
  port ( address : in std_logic_vector(4 downto 0);
         data : out std_logic_vector(7 downto 0) );
end component;

component Aseq2 is
  port ( address : in std_logic_vector(4 downto 0);
         data : out std_logic_vector(7 downto 0) );
end component;

component Aseq3 is
  port ( address : in std_logic_vector(4 downto 0);
         data : out std_logic_vector(7 downto 0) );
end component;

component Aseq4 is
  port ( address : in std_logic_vector(4 downto 0);
         data : out std_logic_vector(7 downto 0) );
end component;

component Amux4_1x8 is
port(
    A, B, C, D: in std_logic_vector(7 downto 0);
    sig: in std_logic_vector(1 downto 0);
    Y: out std_logic_vector(7 downto 0)
	);
end component;

component AcountToupeira is
port( PACE, STATE_01, STATE_10, R1: in std_logic;
      Trial2_0: out std_logic_vector(2 downto 0);
      TC7: out std_logic
	   );
end component;

component AcountTrial is
port( CLK, STATE_10, btn, Reset: in std_logic;
      Trial4_3: out std_logic_vector(1 downto 0);
      TCN3: out std_logic
	   );
end component;

component Adecod4_7 is
port(
	A: in std_logic_vector(3 downto 0);
	S: out std_logic_vector(6 downto 0)
	);
end component;

component Ademux is
port(ent, sel: in std_logic;
    out0, out1: out std_logic
);
end component;

component Acount4 is
port( CLK, enable: in std_logic;
      Y: out std_logic_vector(1 downto 0)
	   );
end component;

component Amux2_1x4 is
port(sel: in std_logic;
    ent0, ent1: in std_logic_vector(3 downto 0);
    saida: out std_logic_vector(3 downto 0));
end component;

component Amux2_1x7 is
port(sel: in std_logic;
    ent0, ent1: in std_logic_vector(6 downto 0);
    saida: out std_logic_vector(6 downto 0));
end component;

component Amux2_1x8 is
port(sel: in std_logic;
    ent0, ent1: in std_logic_vector(7 downto 0);
    saida: out std_logic_vector(7 downto 0));
end component;

component Amux4_1x4 is
port(
	sel: in std_logic_vector(1 downto 0);
    ent0, ent1, ent2, ent3: in std_logic_vector(3 downto 0);
    ss: out std_logic_vector(3 downto 0)
);
end component;

component Amux4_1x7 is
port(
	sel: in std_logic_vector(1 downto 0);
    ent0, ent1, ent2, ent3: in std_logic_vector(6 downto 0);
    ss: out std_logic_vector(6 downto 0)
);
end component;

component AFSM_clock is
	port (	clk_500Hz: in std_logic;
				reset: in std_logic;
				CLK_0_25Hz, CLK_0_5Hz, CLK_0_75Hz, CLK_1Hz, CLK_1_25Hz, CLK_1_5Hz, CLK_2Hz: out std_logic
			);
end component;

component Amux8_1x1 is
port(
    A, B, C, D, E, F, G, H: in std_logic;
    sig: in std_logic_vector(2 downto 0);
    Y: out std_logic
	);
end component;

component Amux2_1x3 is
port(sel: in std_logic;
    ent0, ent1: in std_logic_vector(2 downto 0);
    saida: out std_logic_vector(2 downto 0));
end component;

component Alogica_trial is
port(N, T: in std_logic_vector(1 downto 0); 
     clk_sel: out std_logic_vector(2 downto 0));
end component;

begin

--states

STATE_01 <= ((not state(1)) and state(0));
STATE_10 <= ((not state(0)) and state(1));


-- Pace


logictrial: Alogica_trial port map(nivel ,Trial(4 downto 3), CLK_SEL);
muxpaceselet: Amux2_1x3 port map (state(1), CLK_SEL, "001", ckproc_sel); -- selestor pro mux de 8 

resetclock <= (R1 or btn3); -- reset do fsm clock
fsmclock: AFSM_clock port map(CLK_500Hz, resetclock, CLK_0_25Hz, CLK_0_5Hz, CLK_0_75Hz, CLK_1Hz, CLK_1_25Hz, CLK_1_5Hz, CLK_2Hz); -- clocks
muxpace: Amux8_1x1 port map(CLK_0_25Hz, CLK_0_5Hz, CLK_0_75Hz, CLK_1Hz, CLK_1_25Hz, CLK_1_5Hz, CLK_2Hz, CLK_2Hz, ckproc_sel, PACE); -- define o pace


-- Score

comp1: Acomparator port map(toup, sw_entra, comp_score); --Compara entrada da sw com as toupeiras
compsync1: AComparatorSync port map(comp_score, CLK_500Hz, acerto);
countscore1: AcountScore port map (CLK_500Hz, acerto, STATE_01, R1, Trial(4 downto 3), score); -- conta o score

--Topeiras/Rounds (Play)

counttop: AcountToupeira port map (PACE, STATE_01, STATE_10, R1, Trial(2 downto 0), TC7); -- contador de topeira
countround: AcountTrial port map (CLK_500Hz, STATE_10, btn3, R1, Trial(4 downto 3), TCN3); -- contador de rounds

seq1: Aseq1 port map(Trial, Oseq1); --Sequencias
seq2: Aseq2 port map(Trial, Oseq2);
seq3: Aseq3 port map(Trial, Oseq3);
seq4: Aseq4 port map(Trial, Oseq4);

m418: Amux4_1x8 port map(Oseq1, Oseq2, Oseq3, Oseq4, seq, toup);
m218: Amux2_1x8 port map(STATE_01, "00000000", toup, led_out);

end_game <= ((not TCN3) and TC7);
end_round <= ((TCN3 and TC7) and (not PACE));

--SETUP

flip: AFlipflopT port map(CLK_500Hz, btn1, '1', setup_sel);
demux: Ademux port map(btn2, setup_sel, out0, out1);
count_nivel: Acount4 port map(CLK_500Hz, out0, nivel);
count_seq: Acount4 port map(CLK_500Hz, out1, seq);

-- HEX2 
m20: Amux2_1x7 port map( setup_sel, "1000111", "1110001", sai_h2s0); --L, J -- de cima
m22: Amux2_1x7 port map( pace, "0001100", "0000110", sai_h2s2); --P, E -- de baixo
hs2: Amux4_1x7 port map( state, sai_h2s0, "0001100", sai_h2s2, sai_h2s2, h2); --P

-- HEX1

dec7seg2: Adecod4_7 port map(score(7 downto 4), d7seg);
m12: Amux2_1x7 port map( pace, d7seg, "1000000", sai_h1s2); --apagado
m13: Amux2_1x7 port map( pace, d7seg, "0101011", sai_h1s3); --n

hs1: Amux4_1x7 port map( state,"1111111", d7seg, sai_h1s2, sai_h1s3, h1); --apagado

-- HEX0
entra_h00e0 <= "00" & nivel;
entra_h00e1 <= "00" & seq;
entra_h02e1 <= "00" & trial(4 downto 3);

m00: Amux2_1x4 port map( setup_sel, entra_h00e0, entra_h00e1, sai_h0s0);
m02: Amux2_1x4 port map( pace, score(3 downto 0), entra_h02e1, sai_h0s2);
m03: Amux2_1x4 port map( pace, score(3 downto 0), "1101", sai_h0s3);

m0: Amux4_1x4 port map(state, sai_h0s0, score(3 downto 0), sai_h0s2, sai_h0s3, sai_m0);
dec7seg: Adecod4_7 port map(sai_m0, h0);


end arqdata;
