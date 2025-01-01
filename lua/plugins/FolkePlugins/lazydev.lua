return {
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- Library paths can be absolute
				{ "neotest", words = { "neotest" } },
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				-- Or relative, which means they will be resolved from the plugin dir.(not vim.uv.fs_stat(root_dir .. "/.luarc.json"))
				"lazy.nvim",
				{ "snacks.nvim", words = { "snacks" } },
			},
			enabled = function(root_dir)
				return vim.g.lazydev_enabled == nil and true or vim.g.lazydev_enabled
			end,
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
}
