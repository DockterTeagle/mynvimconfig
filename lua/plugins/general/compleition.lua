return {

	{
		"saghen/blink.cmp",

		lazy = false, -- lazy loading handled internally
		-- optional: provides snippets for the snippet source
		dependencies = {
			"mikavilpas/blink-ripgrep.nvim",
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
	{
		"chrisgrieser/nvim-scissors",
		dependencies = "nvim-telescope/telescope.nvim",
		opts = {
			snippetDir = vim.g.luasnippets_path,
		},
	},
	{
		"xzbdmw/colorful-menu.nvim",
	},
}
