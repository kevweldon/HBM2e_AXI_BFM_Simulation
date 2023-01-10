	component my_sys_mgc_axi4_master_0 is
		generic (
			AXI4_ADDRESS_WIDTH          : integer := 64;
			AXI4_RDATA_WIDTH            : integer := 256;
			AXI4_WDATA_WIDTH            : integer := 256;
			AXI4_ID_WIDTH               : integer := 7;
			AXI4_USER_WIDTH             : integer := 8;
			AXI4_REGION_MAP_SIZE        : integer := 16;
			index                       : integer := 0;
			READ_ISSUING_CAPABILITY     : integer := 16;
			WRITE_ISSUING_CAPABILITY    : integer := 16;
			COMBINED_ISSUING_CAPABILITY : integer := 16;
			USE_AWID                    : integer := 1;
			USE_AWREGION                : integer := 1;
			USE_AWLEN                   : integer := 1;
			USE_AWSIZE                  : integer := 1;
			USE_AWBURST                 : integer := 1;
			USE_AWLOCK                  : integer := 1;
			USE_AWCACHE                 : integer := 0;
			USE_AWQOS                   : integer := 1;
			USE_WSTRB                   : integer := 1;
			USE_BID                     : integer := 1;
			USE_BRESP                   : integer := 1;
			USE_ARID                    : integer := 1;
			USE_ARREGION                : integer := 1;
			USE_ARLEN                   : integer := 1;
			USE_ARSIZE                  : integer := 1;
			USE_ARBURST                 : integer := 1;
			USE_ARLOCK                  : integer := 1;
			USE_ARCACHE                 : integer := 0;
			USE_ARQOS                   : integer := 1;
			USE_RID                     : integer := 1;
			USE_RRESP                   : integer := 1;
			USE_RLAST                   : integer := 1;
			USE_AWUSER                  : integer := 1;
			USE_ARUSER                  : integer := 1;
			USE_WUSER                   : integer := 1;
			USE_RUSER                   : integer := 1;
			USE_BUSER                   : integer := 0
		);
		port (
			AWVALID  : out std_logic;                                         -- awvalid
			AWPROT   : out std_logic_vector(2 downto 0);                      -- awprot
			AWREGION : out std_logic_vector(3 downto 0);                      -- awregion
			AWLEN    : out std_logic_vector(7 downto 0);                      -- awlen
			AWSIZE   : out std_logic_vector(2 downto 0);                      -- awsize
			AWBURST  : out std_logic_vector(1 downto 0);                      -- awburst
			AWLOCK   : out std_logic;                                         -- awlock
			AWQOS    : out std_logic_vector(3 downto 0);                      -- awqos
			AWREADY  : in  std_logic                      := 'X';             -- awready
			ARVALID  : out std_logic;                                         -- arvalid
			ARPROT   : out std_logic_vector(2 downto 0);                      -- arprot
			ARREGION : out std_logic_vector(3 downto 0);                      -- arregion
			ARLEN    : out std_logic_vector(7 downto 0);                      -- arlen
			ARSIZE   : out std_logic_vector(2 downto 0);                      -- arsize
			ARBURST  : out std_logic_vector(1 downto 0);                      -- arburst
			ARLOCK   : out std_logic;                                         -- arlock
			ARQOS    : out std_logic_vector(3 downto 0);                      -- arqos
			ARREADY  : in  std_logic                      := 'X';             -- arready
			RVALID   : in  std_logic                      := 'X';             -- rvalid
			RRESP    : in  std_logic_vector(1 downto 0)   := (others => 'X'); -- rresp
			RLAST    : in  std_logic                      := 'X';             -- rlast
			RREADY   : out std_logic;                                         -- rready
			WVALID   : out std_logic;                                         -- wvalid
			WLAST    : out std_logic;                                         -- wlast
			WREADY   : in  std_logic                      := 'X';             -- wready
			BVALID   : in  std_logic                      := 'X';             -- bvalid
			BRESP    : in  std_logic_vector(1 downto 0)   := (others => 'X'); -- bresp
			BREADY   : out std_logic;                                         -- bready
			AWADDR   : out std_logic_vector(63 downto 0);                     -- awaddr
			AWID     : out std_logic_vector(6 downto 0);                      -- awid
			AWUSER   : out std_logic_vector(7 downto 0);                      -- awuser
			ARADDR   : out std_logic_vector(63 downto 0);                     -- araddr
			ARID     : out std_logic_vector(6 downto 0);                      -- arid
			ARUSER   : out std_logic_vector(7 downto 0);                      -- aruser
			RUSER    : in  std_logic_vector(7 downto 0)   := (others => 'X'); -- ruser
			WUSER    : out std_logic_vector(7 downto 0);                      -- wuser
			RDATA    : in  std_logic_vector(255 downto 0) := (others => 'X'); -- rdata
			RID      : in  std_logic_vector(6 downto 0)   := (others => 'X'); -- rid
			WDATA    : out std_logic_vector(255 downto 0);                    -- wdata
			WSTRB    : out std_logic_vector(31 downto 0);                     -- wstrb
			BID      : in  std_logic_vector(6 downto 0)   := (others => 'X'); -- bid
			ACLK     : in  std_logic                      := 'X';             -- clk
			ARESETn  : in  std_logic                      := 'X'              -- reset_n
		);
	end component my_sys_mgc_axi4_master_0;

	u0 : component my_sys_mgc_axi4_master_0
		generic map (
			AXI4_ADDRESS_WIDTH          => INTEGER_VALUE_FOR_AXI4_ADDRESS_WIDTH,
			AXI4_RDATA_WIDTH            => INTEGER_VALUE_FOR_AXI4_RDATA_WIDTH,
			AXI4_WDATA_WIDTH            => INTEGER_VALUE_FOR_AXI4_WDATA_WIDTH,
			AXI4_ID_WIDTH               => INTEGER_VALUE_FOR_AXI4_ID_WIDTH,
			AXI4_USER_WIDTH             => INTEGER_VALUE_FOR_AXI4_USER_WIDTH,
			AXI4_REGION_MAP_SIZE        => INTEGER_VALUE_FOR_AXI4_REGION_MAP_SIZE,
			index                       => INTEGER_VALUE_FOR_index,
			READ_ISSUING_CAPABILITY     => INTEGER_VALUE_FOR_READ_ISSUING_CAPABILITY,
			WRITE_ISSUING_CAPABILITY    => INTEGER_VALUE_FOR_WRITE_ISSUING_CAPABILITY,
			COMBINED_ISSUING_CAPABILITY => INTEGER_VALUE_FOR_COMBINED_ISSUING_CAPABILITY,
			USE_AWID                    => INTEGER_VALUE_FOR_USE_AWID,
			USE_AWREGION                => INTEGER_VALUE_FOR_USE_AWREGION,
			USE_AWLEN                   => INTEGER_VALUE_FOR_USE_AWLEN,
			USE_AWSIZE                  => INTEGER_VALUE_FOR_USE_AWSIZE,
			USE_AWBURST                 => INTEGER_VALUE_FOR_USE_AWBURST,
			USE_AWLOCK                  => INTEGER_VALUE_FOR_USE_AWLOCK,
			USE_AWCACHE                 => INTEGER_VALUE_FOR_USE_AWCACHE,
			USE_AWQOS                   => INTEGER_VALUE_FOR_USE_AWQOS,
			USE_WSTRB                   => INTEGER_VALUE_FOR_USE_WSTRB,
			USE_BID                     => INTEGER_VALUE_FOR_USE_BID,
			USE_BRESP                   => INTEGER_VALUE_FOR_USE_BRESP,
			USE_ARID                    => INTEGER_VALUE_FOR_USE_ARID,
			USE_ARREGION                => INTEGER_VALUE_FOR_USE_ARREGION,
			USE_ARLEN                   => INTEGER_VALUE_FOR_USE_ARLEN,
			USE_ARSIZE                  => INTEGER_VALUE_FOR_USE_ARSIZE,
			USE_ARBURST                 => INTEGER_VALUE_FOR_USE_ARBURST,
			USE_ARLOCK                  => INTEGER_VALUE_FOR_USE_ARLOCK,
			USE_ARCACHE                 => INTEGER_VALUE_FOR_USE_ARCACHE,
			USE_ARQOS                   => INTEGER_VALUE_FOR_USE_ARQOS,
			USE_RID                     => INTEGER_VALUE_FOR_USE_RID,
			USE_RRESP                   => INTEGER_VALUE_FOR_USE_RRESP,
			USE_RLAST                   => INTEGER_VALUE_FOR_USE_RLAST,
			USE_AWUSER                  => INTEGER_VALUE_FOR_USE_AWUSER,
			USE_ARUSER                  => INTEGER_VALUE_FOR_USE_ARUSER,
			USE_WUSER                   => INTEGER_VALUE_FOR_USE_WUSER,
			USE_RUSER                   => INTEGER_VALUE_FOR_USE_RUSER,
			USE_BUSER                   => INTEGER_VALUE_FOR_USE_BUSER
		)
		port map (
			AWVALID  => CONNECTED_TO_AWVALID,  -- altera_axi4_master.awvalid
			AWPROT   => CONNECTED_TO_AWPROT,   --                   .awprot
			AWREGION => CONNECTED_TO_AWREGION, --                   .awregion
			AWLEN    => CONNECTED_TO_AWLEN,    --                   .awlen
			AWSIZE   => CONNECTED_TO_AWSIZE,   --                   .awsize
			AWBURST  => CONNECTED_TO_AWBURST,  --                   .awburst
			AWLOCK   => CONNECTED_TO_AWLOCK,   --                   .awlock
			AWQOS    => CONNECTED_TO_AWQOS,    --                   .awqos
			AWREADY  => CONNECTED_TO_AWREADY,  --                   .awready
			ARVALID  => CONNECTED_TO_ARVALID,  --                   .arvalid
			ARPROT   => CONNECTED_TO_ARPROT,   --                   .arprot
			ARREGION => CONNECTED_TO_ARREGION, --                   .arregion
			ARLEN    => CONNECTED_TO_ARLEN,    --                   .arlen
			ARSIZE   => CONNECTED_TO_ARSIZE,   --                   .arsize
			ARBURST  => CONNECTED_TO_ARBURST,  --                   .arburst
			ARLOCK   => CONNECTED_TO_ARLOCK,   --                   .arlock
			ARQOS    => CONNECTED_TO_ARQOS,    --                   .arqos
			ARREADY  => CONNECTED_TO_ARREADY,  --                   .arready
			RVALID   => CONNECTED_TO_RVALID,   --                   .rvalid
			RRESP    => CONNECTED_TO_RRESP,    --                   .rresp
			RLAST    => CONNECTED_TO_RLAST,    --                   .rlast
			RREADY   => CONNECTED_TO_RREADY,   --                   .rready
			WVALID   => CONNECTED_TO_WVALID,   --                   .wvalid
			WLAST    => CONNECTED_TO_WLAST,    --                   .wlast
			WREADY   => CONNECTED_TO_WREADY,   --                   .wready
			BVALID   => CONNECTED_TO_BVALID,   --                   .bvalid
			BRESP    => CONNECTED_TO_BRESP,    --                   .bresp
			BREADY   => CONNECTED_TO_BREADY,   --                   .bready
			AWADDR   => CONNECTED_TO_AWADDR,   --                   .awaddr
			AWID     => CONNECTED_TO_AWID,     --                   .awid
			AWUSER   => CONNECTED_TO_AWUSER,   --                   .awuser
			ARADDR   => CONNECTED_TO_ARADDR,   --                   .araddr
			ARID     => CONNECTED_TO_ARID,     --                   .arid
			ARUSER   => CONNECTED_TO_ARUSER,   --                   .aruser
			RUSER    => CONNECTED_TO_RUSER,    --                   .ruser
			WUSER    => CONNECTED_TO_WUSER,    --                   .wuser
			RDATA    => CONNECTED_TO_RDATA,    --                   .rdata
			RID      => CONNECTED_TO_RID,      --                   .rid
			WDATA    => CONNECTED_TO_WDATA,    --                   .wdata
			WSTRB    => CONNECTED_TO_WSTRB,    --                   .wstrb
			BID      => CONNECTED_TO_BID,      --                   .bid
			ACLK     => CONNECTED_TO_ACLK,     --         clock_sink.clk
			ARESETn  => CONNECTED_TO_ARESETn   --         reset_sink.reset_n
		);

