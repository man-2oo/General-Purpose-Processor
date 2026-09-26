LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY alu1 IS
	PORT (Clock : IN STD_LOGIC ;
		A ,B : IN UNSIGNED(7 DOWNTO 0);
		Student_id: IN UNSIGNED(3 DOWNTO 0);
		OP: IN UNSIGNED(15 downto 0);
		neg: OUT STD_LOGIC;
		R1: OUT UNSIGNED(3 DOWNTO 0);  --lower 4bits of 8bits Result
		R2: OUT UNSIGNED(3 DOWNTO 0)); --higher 4bits of 8bits Result
END alu1;

ARCHITECTURE Behavior OF alu1 IS
	SIGNAL Reg1, Reg2, Result, Temp: UNSIGNED(7 DOWNTO 0) := (OTHERS => '0');
	SIGNAL Reg4: UNSIGNED(0 TO 7);
	SIGNAL Sum : UNSIGNED(8 DOWNTO 0);
	SIGNAL compReg2: UNSIGNED(7 DOWNTO 0);
		BEGIN
		Reg1 <= A;
		Reg2 <= B;
			PROCESS (Clock, OP)
			BEGIN
				IF (rising_edge(Clock)) THEN      -- assigned modification h)
					CASE OP IS
						WHEN "0000000000000001" =>  --function 1 - ROR A 4 bits
							neg <= '0';
							Temp(7) <= Reg1(3);
							Temp(6) <= Reg1(2);
							Temp(5) <= Reg1(1);
							Temp(4) <= Reg1(0);
							Temp(3) <= Reg1(7);
							Temp(2) <= Reg1(6);
							Temp(1) <= Reg1(5);
							Temp(0) <= Reg1(4);
							result <= Temp;
						WHEN "0000000000000010" =>  --function 2 - A XOR B
							neg <= '0';
							result <= Reg1 XOR Reg2;
						WHEN "0000000000000100" =>  --Function 3 - Invert B bit order
							neg <= '0';
							Temp(0) <= Reg2(7);
							Temp(1) <= Reg2(6);
							Temp(2) <= Reg2(5);
							Temp(3) <= Reg2(4);
							Temp(4) <= Reg2(3);
							Temp(5) <= Reg2(2);
							Temp(6) <= Reg2(1);
							Temp(7) <= Reg2(0);
							result <= Temp;
						WHEN "0000000000001000" =>  --Function 4 - A + B - 2
							neg <= '0';
							Result <= Reg1 + Reg2 - "10";
						WHEN "0000000000010000" =>  --Function 5 - ROL B 2 bits
							neg <= '0';
							Temp(0) <= Reg2(2);
							Temp(1) <= Reg2(3);
							Temp(2) <= Reg2(4);
							Temp(3) <= Reg2(5);
							Temp(4) <= Reg2(6);
							Temp(5) <= Reg2(7);
							Temp(6) <= Reg2(0);
							Temp(7) <= Reg2(1);
							result <= Temp;
						WHEN "0000000000100000" =>  --Function 6 - Invert even bits of B
							neg <= '0';
							Temp <= Reg2;
							Temp(1) <= NOT Reg2(1);
							Temp(3) <= NOT Reg2(3);
							Temp(5) <= NOT Reg2(5);
							Temp(7) <= NOT Reg2(7);
							Temp(0) <= Reg2(0);
							Temp(2) <= Reg2(2);
							Temp(4) <= Reg2(4);
							Temp(6) <= Reg2(6);
							result <= Temp;
						WHEN "0000000001000000" =>  --Function 7 - Swap B and A lower 4 bits, and put new B
							neg <= '0';
							Temp(4) <= Reg2(4);
							Temp(5) <= Reg2(5);
							Temp(6) <= Reg2(6);
							Temp(7) <= Reg2(7);
							Temp(0) <= Reg1(0);
							Temp(1) <= Reg1(1);
							Temp(2) <= Reg1(2);
							Temp(3) <= Reg1(3);
							result <= Temp;
						WHEN "0000000010000000" =>  --Function 8 - Shift B by 2 bits to right
							neg <= '0';
							Result <= "00" & Reg2(7 DOWNTO 2);
						WHEN "0000000100000000" =>  --Function 9 - Invert lower 4 bits of A
							neg <= '0';
							Temp(3) <= NOT Reg1(3);
							Temp(2) <= NOT Reg1(2);
							Temp(1) <= NOT Reg1(1);
							Temp(0) <= NOT Reg1(0);
							Temp(4) <= Reg1(4);
							Temp(5) <= Reg1(5);
							Temp(6) <= Reg1(6);
							Temp(7) <= Reg1(7);
							Result <= Temp;
						WHEN OTHERS =>              -- Don't care
					END CASE;
				END IF;
		END PROCESS;
	R1 <= Result(3 DOWNTO 0);
	R2 <= Result(7 DOWNTO 4);

END Behavior;