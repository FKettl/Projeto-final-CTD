library ieee;
use ieee.std_logic_1164.all;

entity Adecod4_7 is
port(
	A: in std_logic_vector(3 downto 0);
	S: out std_logic_vector(6 downto 0)
	);
end Adecod4_7 ;

architecture decod of Adecod4_7 is
begin

S <= "1000000" when A = "0000" else -- 0
     "1111001" when A = "0001" else -- 1
     "0100100" when A = "0010" else -- 2
     "0110000" when A = "0011" else -- 3
     "0011001" when A = "0100" else -- 4
     "0010010" when A = "0101" else -- 5
     "0000010" when A = "0110" else -- 6
     "1111000" when A = "0111" else -- 7
     "0000000" when A = "1000" else -- 8
     "0010000" when A = "1001" else -- 9
     "0001000" when A = "1010" else -- A(10)
     "0000011" when A = "1011" else -- B(11)
     "1000110" when A = "1100" else -- C(12)
     "0100001" when A = "1101" else -- D(13)
     "0000110" when A = "1110" else -- E(14)
     "0001110" when A = "1111"; --     F(15)
     
end decod;