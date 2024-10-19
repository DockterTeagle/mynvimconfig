return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"BurntSushi/ripgrep",
			"nvim-lua/plenary.nvim",
			"sharkdp/fd",
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
				},
			},
		},
	},
	{
		"nvim-telescope/telescope-frecency.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("telescope").load_extension("frecency")
		end,
	},
	{
		"debugloop/telescope-undo.nvim",
		config = function()
			require("telescope").load_extension("")
		end,
	},
	{
		"nvim-telescope/telescope-bibtex.nvim",
		config = function()
			require("telescope").load_extension("bibtex")
		end,
	},
	{
		"nvim-telescope/telescope-dap.nvim",
		lazy = false,
		config = function()
			require("telescope").load_extension("dap")
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
