library ieee;
use ieee.std_logic_1164.all;

entity dec is
	port( State : in std_logic_vector (3 downto 0);
		En : in std_logic;
		op : out std_logic_vector (15 downto 0));
end dec;

architecture behavior of dec is
begin
process (State, En)
begin
	if (En = '0') then
		op <= "0000000000000000";
	else
		case State is 
			when "0000" => op <= "0000000000000001"; -- 1
			when "0001" => op <= "0000000000000010"; -- 2
			when "0010" => op <= "0000000000000100"; -- 3
			when "0011" => op <= "0000000000001000"; -- 4
			when "0100" => op <= "0000000000010000"; -- 5
			when "0101" => op <= "0000000000100000"; -- 6
			when "0110" => op <= "0000000001000000"; -- 7
			when "0111" => op <= "0000000010000000"; -- 8
			when "1000" => op <= "0000000100000000"; -- 9
			when others => op <= "0000000000000000"; -- not needed
		end case;
	end if;
end process;
end behavior;