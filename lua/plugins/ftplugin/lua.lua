return {
	{
		"Bilal2453/luvit-meta", -- optional `vim.uv` typings
	},
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				{ "rustaceanvim", words = { "rustaceanvim" } },
				{ "neotest", words = { "neotest" } },
				{ "luvit-meta", words = { "vim%.uv" } },
				"lazy.nvim",
				{ "lazydev.nvim", words = { "lazydev" } },
				{ "snacks.nvim", words = { "snacks" } },
				{ "lspsaga.nvim", { words = "lspsaga" } },
			},
			enabled = function(root_dir)
				return vim.g.lazydev_enabled == nil and true or vim.g.lazydev_enabled
			end,
		},
	},
	-- {
	-- 	"neovim/nvim-lspconfig",
	-- 	opts = {
	-- 		servers = {
	-- 			lua_ls = {
	-- 				settings = {
	-- 					Lua = {
	-- 						codelens = {
	-- 							enable = true,
	-- 							properties = { enable = true },
	-- 						},
	-- 						runtime = {
	-- 							version = "LuaJIT",
	-- 						},
	-- 						telemetry = {
	-- 							enable = false,
	-- 						},
	-- 						workspace = {
	-- 							maxPreload = 100000,
	-- 							preloadFileSize = 10000,
	-- 						},
	-- 					},
	-- 				},
	-- 			},
	-- 		},
	-- 	},
	-- },
}
