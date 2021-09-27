-- Multiplexador 2x1 de 7 bit.

library ieee;
use ieee.std_logic_1164.all;

entity Amux2_1x7 is
port(sel: in std_logic;
    ent0, ent1: in std_logic_vector(6 downto 0);
    saida: out std_logic_vector(6 downto 0));
end Amux2_1x7;

architecture arc of Amux2_1x7 is
begin
saida <= ent0 when sel = '0' else
		ent1;
end arc;