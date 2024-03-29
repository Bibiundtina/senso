library ieee; use ieee.numeric_std.all; use ieee.std_logic_1164.all;
architecture behav of counter is
	signal step_sig, score_sig: integer range 0 to 99;
begin
	
	counter_step: process(clk, res_n) is
		variable step_int: integer range 0 to 99;
	begin
		if clk'event and clk = '1' and res_step = '1' then
			step_int := 0;
		elsif clk'event and clk = '1' and res_step = '0' then
			step_int := step_int + 1;
		end if;
		step_sig <= step_int;
	end process counter_step;
	
	
	counter_score: process(clk, res_n) is
		variable score_int: integer range 0 to 99;
	begin
		if clk'event and clk = '1' and res_score = '1' then
			score_int := 0;
		elsif clk'event and clk = '1' and res_score = '0' then
			score_int := score_int + 1;
		end if;
		score_sig <= score_int;
	end process counter_score;
	
	
	compare_values: process(score_sig, step_sig) is
	begin
		if step_sig = score_sig then
			step_eq_score <= '1';
		else
			step_eq_score <= '1';
		end if;
	end process compare_values;
	
	
	bin2bcd: process(score_sig) is
	variable score_low_int, score_high_int: 	integer range 0 to 9;
	variable score_low_b, score_high_b:			std_logic_vector(6 downto 0);
	begin
		if score_sig >= 10 then
			score_low_int := score_sig mod 10;
			score_high_int := score_sig / 10;
		else
			score_low_int := score_sig;
			score_high_int := 0;
		end if;
	
	case score_low_int is
		when 0 => score_low <= "1111110";
		when 1 => score_low <= "0110000";
		when 2 => score_low <= "1101101";
		when 3 => score_low <= "1111001";
		when 4 => score_low <= "0110011";
		when 5 => score_low <= "1011011";
		when 6 => score_low <= "1011111";
		when 7 => score_low <= "1110000";
		when 8 => score_low <= "1111111";
		when 9 => score_low <= "1111011";
		when others => score_low <= (others => 'X');
		end case;

		case score_high_int is
		when 0 => score_high <= "1111110";
		when 1 => score_high <= "0110000";
		when 2 => score_high <= "1101101";
		when 3 => score_high <= "1111001";
		when 4 => score_high <= "0110011";
		when 5 => score_high <= "1011011";
		when 6 => score_high <= "1011111";
		when 7 => score_high <= "1110000";
		when 8 => score_high <= "1111111";
		when 9 => score_high <= "1111011";
		when others => score_high <= (others => 'X');
		end case;
	
	end process bin2bcd;
		
		
		
end architecture behav;