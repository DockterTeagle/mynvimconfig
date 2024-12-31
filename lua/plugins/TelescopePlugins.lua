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
			return require("configs.telescope")
		end,
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
	-- {
	-- 	"debugloop/telescope-undo.nvim",
	-- 	config = function()
	-- 		require("telescope").load_extension("")
	-- 	end,
	-- },
	{
		"nvim-telescope/telescope-bibtex.nvim",
		config = function()
			require("telescope").load_extension("bibtex")
		end,
	},
	{
		"nvim-telescope/telescope-dap.nvim",
		cmd = { "DapContinue" },
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
