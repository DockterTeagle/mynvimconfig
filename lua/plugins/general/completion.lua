return {
	{
		"saghen/blink.cmp",

		lazy = false, -- lazy loading handled internally
		-- optional: provides snippets for the snippet source
		dependencies = {
			{ "disrupted/blink-cmp-conventional-commits" },
			{
				"xzbdmw/colorful-menu.nvim",
			},
			{
				"kristijanhusak/vim-dadbod-completion",
				dependencies = {
					"tpope/vim-dadbod",
					{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
				},
				cmd = {
					"DBUI",
					"DBUIToggle",
					"DBUIAddConnection",
					"DBUIFindBuffer",
				},
				init = function()
					-- Your DBUI configuration
					vim.g.db_ui_use_nerd_fonts = 1
				end,
			},
			{
				"L3MON4D3/LuaSnip",
				lazy = false,
				version = "v2.*",
				build = "make install_jsregexp",
				config = function()
					local ls = require("luasnip")
					local opts = require("configs.luasnip")
					ls.config.set_config(opts)
				end,
			},
		},

		build = "nix run .#build-plugin",

		opts = require("configs.blink-cmp"),
		-- allows extending the providers array elsewhere in your config
		-- without having to redefine it
		opts_extend = { "sources.default" },
	},
	{
		"danymat/neogen",
		cmd = "Neogen",

		opts = {
			snippet_engine = "luasnip",
		},
		-- Uncomment next line if you want to follow only stable versions
		-- version = "*"
	},
	-- snippet editing
	{
		"chrisgrieser/nvim-scissors",
		dependencies = "nvim-telescope/telescope.nvim",
		opts = {
			snippetDir = vim.g.luasnippets_path,
		},
	},
}
