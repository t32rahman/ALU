LIBRARY ieee;
USE ieee.std_logic_1164.all;
LIBRARY work;
USE work.decoder3to8_package.all;

ENTITY decoder4to16 IS
   PORT(s   : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        En1 : IN STD_LOGIC;
        OP  : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
   END decoder4to16;

ARCHITECTURE Structure OF decoder4to16 IS
   SIGNAL m: STD_LOGIC_VECTOR(0 TO 1);
	
BEGIN
   m(0) <=(NOT s(3) AND En1);
   m(1)<=(s(3) AND En1);
    Dec1: decoder3to8 PORT MAP
       (s(2 DOWNTO 0), m(0), OP(15 DOWNTO 8));
    Dec2: decoder3to8 PORT MAP
       (s(2 DOWNTO 0), m(1),OP(7 DOWNTO 0));
END STRUCTURE;