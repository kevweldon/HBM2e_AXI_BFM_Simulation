	component my_sys_intel_noc_clock_ctrl_0 is
		port (
			refclk     : in  std_logic := 'X'; -- clk
			pll_lock_o : out std_logic         -- pll_lock_o
		);
	end component my_sys_intel_noc_clock_ctrl_0;

	u0 : component my_sys_intel_noc_clock_ctrl_0
		port map (
			refclk     => CONNECTED_TO_refclk,     --     refclk.clk
			pll_lock_o => CONNECTED_TO_pll_lock_o  -- pll_lock_o.pll_lock_o
		);

