return {
	{
		"mrcjkb/rustaceanvim",
		lazy = false,
	},
	{
		"Saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		opts = {
			completion = {
				crates = {
					enabled = true,
				},
			},
			lsp = {
				enabled = true,
				actions = true,
				completion = true,
				hover = true,
			},
		},
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
					-- require("neotest-plenary"),
					require("rustaceanvim.neotest"),
					-- require("neotest-vim-test")({
					-- 	ignore_file_types = { "python", "vim", "lua" },
					-- }),
					-- require("neotest-python")({
					-- 	dap = {
					-- 		justMyCode = false,
					-- 	},
					-- }),
				},
			})
		end,
	},
}
