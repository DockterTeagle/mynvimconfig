-- local cmp = require("cmp")
return {
	{
		"mrcjkb/rustaceanvim",
		-- version = "^5",
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
		config = function()
			require("neotest").setup({
				adapters = {
					require("rustaceanvim.neotest"),
					require("neotest-python"),
				},
			})
		end,
	},
}
