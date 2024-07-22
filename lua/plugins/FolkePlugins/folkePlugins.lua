local todoComments = require("plugins.FolkePlugins.TodoComments.TodoCommentsMain")
local noice = require("plugins.FolkePlugins.Noice.noiceMain")
return {
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- Library paths can be absolute
				-- Or relative, which means they will be resolved from the plugin dir.
				"lazy.nvim",
				"rustaceanvim",
				-- It can also be a table with trigger words / mods
				-- Only load luvit types when the `vim.uv` word is found
				-- always load the LazyVim library
				"LazyVim",
				-- Only load the lazyvim library when the `LazyVim` global is found
				-- Load the wezterm types when the `wezterm` module is required
				-- Needs `justinsgithub/wezterm-types` to be installed
				-- Load the xmake types when opening file named `xmake.lua`
				-- Needs `LelouchHe/xmake-luals-addon` to be installed
			},
			-- always enable unless `vim.g.lazydev_enabled = false`
			-- This is the default
			enabled = function(root_dir)
				return vim.g.lazydev_enabled == nil and true or vim.g.lazydev_enabled
			end,
			-- disable when a .luarc.json file is found
			enabled = function(root_dir)
				return not vim.uv.fs_stat(root_dir .. "/.luarc.json")
			end,
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
	{ -- optional completion source for require statements and module annotations
		"hrsh7th/nvim-cmp",
		opts = function(_, opts)
			opts.sources = opts.sources or {}
			table.insert(opts.sources, {
				name = "lazydev",
				group_index = 0, -- set group index to 0 to skip loading LuaLS completions
			})
		end,
	},
	-- { "folke/neodev.nvim", enabled = false }, -- make sure to uninstall or disable neodev.nvim
	noice,
	todoComments,
	require("plugins.FolkePlugins.Trouble.troubleMain"),
	require("plugins.FolkePlugins.Which-Key.which-key"),
}
