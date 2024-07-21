return {
	{
		"mrcjkb/rustaceanvim",
		-- config = {
		-- 	tools = {
		-- 		inlay_hints = {
		-- 			enable = true,
		-- 		},
		-- 	},
		-- 	server = {
		-- 		on_attach = function(client, bufnr) end,
		-- 		settings = {
		-- 			["rust-analyzer"] = {},
		-- 		},
		-- 	},
		-- 	dap = {},
		-- },
		lazy = false,
	},
	{
		"saecki/crates.nvim",
		dependencies = {
			"hrsh7th/nvim-cmp",
		},
		ft = { "rust", "toml" },
		config = function(_, opts)
			local crates = require("crates")
			crates.setup(opts)
			require("cmp").setup.buffer({
				sources = { { name = "crates" } },
			})
			crates.show()
		end,
	},
	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	},
}
