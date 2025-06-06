return {
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				{ "rustaceanvim", words = { "rustaceanvim" } },
				{ "neotest", words = { "neotest" } },
				{ "snacks.nvim", words = { "Snacks" } },
				{ "lspsaga.nvim", { words = "lspsaga" } },
			},
			enabled = function(root_dir)
				return vim.g.lazydev_enabled == nil and true or vim.g.lazydev_enabled
			end,
		},
	},
}
