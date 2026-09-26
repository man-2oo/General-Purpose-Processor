LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY reg IS
    PORT ( 
        D : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        Resetn, Clock : IN STD_LOGIC;
        Q : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END reg;

ARCHITECTURE Behavior OF reg IS
BEGIN
    PROCESS (Clock, Resetn)
    BEGIN
        IF Resetn = '0' THEN
            Q <= "00000000";
        ELSIF Clock'EVENT and Clock = '1' THEN
            Q <= D;
        END IF;
    END PROCESS;
END Behavior;
