return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = {
			"BurntSushi/ripgrep",
			"nvim-lua/plenary.nvim",
			"sharkdp/fd",
			"nvim-treesitter/nvim-treesitter",
			"echasnovski/mini.icons",
		},
		opts = function()
			require("configs.telescope")
		end,
		config = function(opts)
			local telescope = require("telescope")
			telescope.setup(opts)
			telescope.load_extension("frecency")
		end,
	},
	{
		"nvim-telescope/telescope-frecency.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		opts = {
			default_workspace = "CWD",
		},
	},
	{
		"nvim-telescope/telescope-bibtex.nvim",
		config = function()
			require("telescope").load_extension("bibtex")
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("telescope").load_extension("fzf")
		end,
	},
}
