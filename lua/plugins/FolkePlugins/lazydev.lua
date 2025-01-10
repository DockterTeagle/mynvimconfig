return {
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- Library paths can be absolute
				{ "LazyVim", words = { "LazyVim" } },
				{ "neotest", words = { "neotest" } },
				{ "luvit-meta", words = { "vim%.uv" } },
				-- Or relative, which means they will be resolved from the plugin dir.(not vim.uv.fs_stat(root_dir .. "/.luarc.json"))
				"lazy.nvim",
				{ "lazydev.nvim", words = { "lazydev" } },
				{ "snacks.nvim", words = { "snacks" } },
			},
			enabled = function(root_dir)
				return vim.g.lazydev_enabled == nil and true or vim.g.lazydev_enabled
			end,
		},
	},
	"Bilal2453/luvit-meta", -- optional `vim.uv` typings
}
