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
	{
		"saecki/crates.nvim",
		dependencies = {
			"hrsh7th/nvim-cmp",
		},
		ft = { "rust", "toml" },
		-- config = function(_, opts)
		-- 	local crates = require("crates")
		-- 	crates.setup(opts)
		-- 	require("cmp").setup.buffer({
		-- 		sources = { { name = "crates" } },
		-- 	})
		-- 	crates.show()
		-- end,
		-- vim.keymap.set("n", "<leader>rcu", function()
		-- 	require("crates").upgrade_all_crates()
		-- end, { desc = "update crates" })
	},
	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	},
}
