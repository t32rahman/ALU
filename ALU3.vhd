library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU3 is
port( Clock : in std_logic; --input clock signal
		A,B : in unsigned(7 downto 0); --8-bit inputs from latches A and B
		student_id : in unsigned(3 downto 0); --4 bit student id from FSM
		OP : in unsigned( 15 downto 0); --16-bit selector for Operation from Decoder
		Neg: out std_logic; --is the result negative ? Set-ve bit output
		R1 : out unsigned(3 downto 0); -- lower 4-bits of 8-bit Result Output
		R2 : out unsigned(3 downto 0)); -- higher 4-bits of 8-bit Result Output
end ALU3;

architecture calculation of ALU3 is --temporary signal declarations.
signal Reg1,Reg2,Result : unsigned(7 downto 0) := (others => '0');
signal Reg4 : unsigned (0 to 7);

begin
Reg1 <= A; --temporarily store A in Reg1 local variable
Reg2 <= B; --temporarily store B in Reg2 local variable
process(Clock, OP)
begin
	if(rising_edge(Clock)) THEN --Do the calculation @ positive edge of clock cycle.
		case OP is
			WHEN OTHERS =>
			-- y if odd student_id, n otherwise
				IF (student_id mod 2) = 0 THEN
					Result <= "00000000"; -- display n
				ELSE
					Result <= "00000001"; -- display y
				END IF;
				Neg<= '0';
		end case;
	end if;
end process;
R1 <= Result(3 downto 0); --Since the output seven segments can
R2 <= Result(7 downto 4); -- only 4-bits, split the 8-bit to two 4-bits.
end calculation;