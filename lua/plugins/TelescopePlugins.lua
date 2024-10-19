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
			extensions_list = {
				"fzf",
				"noice",
				"frecency",
				"bibtex",
				"file_browser",
				"dap",
				"i23",
			},
		},
	},
	{
		"nvim-telescope/telescope-frecency.nvim",
		config = function()
			require("telescope").load_extension("frecency")
		end,
	},
	{
		"debugloop/telescope-undo.nvim",
	},
	{
		"nvim-telescope/telescope-bibtex.nvim",
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"nvim-telescope/telescope-dap.nvim",
		config = function()
			require("telescope").load_extension("dap")
		end,
	},
	{
		"HUAHUAI23/telescope-dapzzzz",
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
}
