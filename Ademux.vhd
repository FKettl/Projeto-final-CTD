library ieee;
use ieee.std_logic_1164.all;

entity Ademux is
port(ent, sel: in std_logic;
    out0, out1: out std_logic
);
end Ademux;

architecture arc of Ademux is
begin

	out0 <= (ent and not sel);
	out1 <= (ent and sel);

end arc;
