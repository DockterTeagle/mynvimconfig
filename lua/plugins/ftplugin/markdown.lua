return {

	{
		"OXY2DEV/markview.nvim",
		lazy = false,
		branch = "dev",
		opts = {
			icon_provider = "mini",
			preview = {
				filetypes = {
					"markdown",
					"rmd",
					"quarto",
					-- "tex",
					"rmd",
					"typst",
				},
			},
			latex = {
				enable = false,
			},
		},
		-- dependencies = {
		-- 	"saghen/blink.cmp",
		-- },
	},
	{
		"jmbuhr/otter.nvim",
		ft = {
			"markdown",
			"nix",
		},
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			-- verbose = {
			-- 	no_code_found = true,
			-- },
		},
	},
	{
		"obsidian-nvim/obsidian.nvim",
		event = {
			"BufReadPre /home/cdockter/Documents/main/*.md",
			"BufNewFile /home/cdockter/Documents/main/*.md",
		},
		dependencies = {
			-- Required.
			"nvim-lua/plenary.nvim",
			"folke/snacks.nvim",
			-- see above for full list of optional dependencies ☝️
			"nvim-treesitter/nvim-treesitter",
			"OXY2DEV/markview.nvim",
		},
		---@module 'obsidian'
		---@type obsidian.config.ClientOpts
		opts = {
			picker = {
				name = "snacks.pick",
			},
			use_advanced_uri = true,
			completion = {
				nvim_cmp = false,
				blink = true,
			},
			workspaces = {
				{ name = "main", path = "~/Documents/main" },
			},
		},
	},
}
