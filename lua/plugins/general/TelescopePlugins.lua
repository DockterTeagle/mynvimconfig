return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = { "Telescope" },
		dependencies = {
			"BurntSushi/ripgrep",
			"nvim-lua/plenary.nvim",
			"sharkdp/fd",
			"nvim-treesitter/nvim-treesitter",
			"echasnovski/mini.icons",
		},
		opts = function()
			return require("configs.telescope")
		end,
		config = function(_, opts)
			local telescope = require("telescope")
			telescope.setup(opts)
			for _, ext in ipairs(opts.extensions_list or {}) do
				telescope.load_extension(ext)
			end
		end,
	},
	{
		"nvim-telescope/telescope-frecency.nvim",
		lazy = false,
		opts = {
			---@type FrecencyOpts
			default_workspace = "CWD",
		},
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
}
