return {
	{
		"mrcjkb/rustaceanvim",
		lazy = false,
	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			"mrcjkb/rustaceanvim",
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = function()
			return require("configs.neotest").opts
		end,
		config = function()
			return require("configs.neotest").config
		end,
		keys = {},
	},
}
