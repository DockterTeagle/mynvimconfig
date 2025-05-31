return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		version = false,
		dependencies = {
			"OXY2DEV/markview.nvim",
		},
		build = ":TSUpdate",
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		event = "VeryLazy",
		branch = "main",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},
}
