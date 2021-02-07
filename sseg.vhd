LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
ENTITY sseg IS
    PORT (bcd : IN STD_lOGIC_VECTOR (3 downto 0) ;
        sign : IN STD_LOGIC;
        leds : OUT std_logic_vector(1 to 7) ;
        ledss : OUT STD_LOGIC_VECTOR(1 to 7));
END sseg;

ARCHITECTURE Behaviour OF sseg IS
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
        WHEN "0000" =>leds <= "1111110"; --0
        WHEN "0001" =>leds <= "0110000"; --1
        WHEN "0010" =>leds <= "1101101";
        WHEN "0011" =>leds <= "1111001";
        WHEN "0100" =>leds <= "0110011";
        WHEN "0101" =>leds <= "1011011";
        WHEN "0110" =>leds <= "1011111";
        WHEN "0111" =>leds <= "1110000";
        WHEN "1000" =>leds <= "1111111";
        WHEN "1001" =>leds <= "1110011"; --9
        WHEN "1010" =>leds <= "1110111"; --a
        WHEN "1011" =>leds <= "0011111"; 
        WHEN "1100" =>leds <= "1001110"; 
        WHEN "1101" =>leds <= "0111111"; 
        WHEN "1110" =>leds <= "1001111"; 
        WHEN "1111" =>leds <= "1000111"; --f
        WHEN OTHERS => leds <= "-------"; 
    END CASE;
END Process;
END BEHAVIOUR;