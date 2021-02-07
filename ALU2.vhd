library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU2 is
port( Clock : in std_logic; --input clock signal
		A,B : in unsigned(7 downto 0); --8-bit inputs from latches A and B
		student_id : in unsigned(3 downto 0); --4 bit student id from FSM
		OP : in unsigned( 15 downto 0); --16-bit selector for Operation from Decoder
		Neg: out std_logic; --is the result negative ? Set-ve bit output
		R1 : out unsigned(3 downto 0); -- lower 4-bits of 8-bit Result Output
		R2 : out unsigned(3 downto 0)); -- higher 4-bits of 8-bit Result Output
end ALU2;

architecture calculation of ALU2 is --temporary signal declarations.
signal Reg1,Reg2,Result : unsigned(7 downto 0) := (others => '0');
signal Reg4 : unsigned (0 to 7);

begin
Reg1 <= A; --temporarily store A in Reg] local variable
Reg2 <= B; --temporarily store B in Reg? local variable
process(Clock, OP)
begin
	if(rising_edge(Clock)) THEN --Do the calculation @ positive edge of clock cycle.
		case OP is
		-- Chose  Table C
			WHEN "0000000000000001" =>
				--Produce the difference between A and B
				IF Reg1>Reg2 THEN
					Result <= (Reg1-Reg2);
					Neg<='0';
				ELSE 
					Result <= (Reg2 -Reg1);
					Neg<='1';
				END IF;		

			WHEN "0000000000000010" =>
				--Produce the 2's complement of B
				Result<= (not Reg2 + 1);
				Neg<= '0';
	 
			WHEN "0000000000000100" =>
				--Swap the lower 4 bits with lower 4 bits of B
				Result <= (Reg1 and "11110000") or (Reg2 and "00001111");
				Neg<= '0';

			WHEN "0000000000001000" =>
				--Produce null on the output
				Result<= null;
				Neg<= '0';

			WHEN "0000000000010000" =>
				--Decrement B by 5
				IF Reg1>5 THEN
					Result <= (Reg2-5);
					Neg<='0';
				ELSE 
					Result <= (5-Reg2);
					Neg<='1';
				END IF;

			WHEN "0000000000100000" =>
				--Invert the bit-significance order of A
				Result<= Reg1(0) & Reg1(1) & Reg1(2) & Reg1(3) & Reg1(4) & Reg1(5) & Reg1(6) & Reg1(7);
				Neg<= '0';

			WHEN "0000000001000000" =>
				--Shift B to left by three bits, input bit = 1 (SHL)
				Result<= Reg2(4 downto 0) & "111";
				Neg<= '0';

			WHEN "0000000010000000" =>
				--Increment A by 3
				Result<= (Reg1 + 3);
				Neg<= '0';

			WHEN "0000000100000000" =>
				--Invert all bits of B
				Result<= (Reg2 xor "11111111");
				Neg<= '0';

			WHEN OTHERS => 
			--Don’t care, do nothing
		end case;
	end if;
end process;
R1 <= Result(3 downto 0); --Since the output seven segments can
R2 <= Result(7 downto 4); -- only 4-bits, split the 8-bit to two 4-bits.
end calculation;