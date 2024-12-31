return {
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- Library paths can be absolute
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
	require("plugins.FolkePlugins.TodoCommentsMain"),
	require("plugins.FolkePlugins.flash"),
	require("plugins.FolkePlugins.noiceMain"),
	require("plugins.FolkePlugins.troubleMain"),
	require("plugins.FolkePlugins.which-key"),
	require("plugins.FolkePlugins.snacks"),
}
