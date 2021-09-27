library ieee;
use ieee.std_logic_1164.all;

entity Amux2_1x3 is
port(sel: in std_logic;
    ent0, ent1: in std_logic_vector(2 downto 0);
    saida: out std_logic_vector(2 downto 0));
end Amux2_1x3;

architecture arcx3 of Amux2_1x3 is
begin
saida <= ent0 when sel = '0' else
		ent1;
end arcx3;
