	component uib_clkref is
		port (
			in_clk  : in  std_logic := 'X'; -- clk
			out_clk : out std_logic         -- clk
		);
	end component uib_clkref;

	u0 : component uib_clkref
		port map (
			in_clk  => CONNECTED_TO_in_clk,  --  in_clk.clk
			out_clk => CONNECTED_TO_out_clk  -- out_clk.clk
		);

