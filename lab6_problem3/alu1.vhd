LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY alu1 IS
	PORT (Clock : IN STD_LOGIC ;
		A ,B : IN UNSIGNED(7 DOWNTO 0);
		ID: IN UNSIGNED(3 DOWNTO 0);
		OP: IN UNSIGNED(15 downto 0);
		neg: OUT STD_LOGIC;
		Rout: OUT UNSIGNED(3 DOWNTO 0));
END alu1;

ARCHITECTURE Behavior OF alu1 IS
	SIGNAL Result: UNSIGNED(3 DOWNTO 0) := (OTHERS => '0');
	SIGNAL RS, LS: UNSIGNED(3 DOWNTO 0);
		BEGIN
		RS <= B(3 DOWNTO 0);
		LS <= B(7 DOWNTO 4);
			PROCESS (Clock, OP, A, B)
			BEGIN
				IF (rising_edge(Clock)) THEN
					CASE OP IS
						WHEN "0000000000000001" =>  --function 1 - addition
						IF ((RS > ID) OR (LS > ID)) THEN
							Result <= "1111";
						ELSE
						   Result <= "0000";
						END IF;
						WHEN "0000000000000010" =>  --function 2 - subtraction
						IF ((RS > ID) OR (LS > ID)) THEN
							Result <= "1111";
						ELSE
						   Result <= "0000";
						END IF;
						WHEN "0000000000000100" =>  --Function 3 - NOT
						IF ((RS > ID) OR (LS > ID)) THEN
							Result <= "1111";
						ELSE
						   Result <= "0000";
						END IF;
						WHEN "0000000000001000" =>  --Function 4 -NAND
						IF ((RS > ID) OR (LS > ID)) THEN
							Result <= "1111";
						ELSE
						   Result <= "0000";
						END IF;
						WHEN "0000000000010000" =>  --Function 5 -NOR
						IF ((RS > ID) OR (LS > ID)) THEN
							Result <= "1111";
						ELSE
						   Result <= "0000";
						END IF;
						WHEN "0000000000100000" =>  --Function 6 -AND
						IF ((RS > ID) OR (LS > ID)) THEN
							Result <= "1111";
						ELSE
						   Result <= "0000";
						END IF;
						WHEN "0000000001000000" =>  --Function 7 -XOR
						IF ((RS > ID) OR (LS > ID)) THEN
							Result <= "1111";
						ELSE
						   Result <= "0000";
						END IF;
						WHEN "0000000010000000" =>  --Function 8 -OR
						IF ((RS > ID) OR (LS > ID)) THEN
							Result <= "1111";
						ELSE
						   Result <= "0000";
						END IF;
						WHEN "0000000100000000" =>  --Function 9 -XNOR
						IF ((RS > ID) OR (LS > ID)) THEN
							Result <= "1111";
						ELSE
						   Result <= "0000";
						END IF;
						WHEN OTHERS =>              -- Don't care
					END CASE;
				END IF;
		END PROCESS;
	Rout <= Result;
END Behavior;