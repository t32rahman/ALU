LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
ENTITY ssegModified3 IS
    PORT (bcd : IN STD_lOGIC_VECTOR (3 downto 0) ;
        sign : IN STD_LOGIC;
        leds : OUT std_logic_vector(1 to 7) ;
        ledss : OUT STD_LOGIC_VECTOR(1 to 7));
END ssegModified3;

ARCHITECTURE Behaviour OF ssegModified3 IS
BEGIN
    PROCESS (bcd,sign)
    BEGIN

    if(sign = '1') then
        ledss <= "0000001";
    elsif(sign = '0') then
        ledss <= "0000000";
    end if;

    CASE bcd IS
	 -- abcdefg
        WHEN "0000" =>leds <= "1110110"; --n
        WHEN "0001" =>leds <= "0111011"; --y
        WHEN OTHERS => leds <= "-------"; 
    END CASE;
END Process;
END BEHAVIOUR;