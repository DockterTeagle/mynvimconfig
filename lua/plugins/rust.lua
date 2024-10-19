local cmp = require("cmp")
return {
	{
		"mrcjkb/rustaceanvim",
		lazy = false,
		version = "^5",
	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter",
			"mrcjkb/rustaceanvim",
		},
		opts = {
			adapters = {
				-- require("rustaceanvim.neotest"),
			},
		},
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
	},
	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		opts = function()
			local M = require("nvchad.configs.cmp")
			M.completion.completeopt = "menu,menuone,noselect"
			M.mapping["<CR>"] = cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Insert,
				select = false,
			})
			table.insert(M.sources, { name = "crates" })
			return M
		end,
	},
}
