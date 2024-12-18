local noice = require("plugins.FolkePlugins.noiceMain")
local todoComments = require("plugins.FolkePlugins.TodoCommentsMain")
local trouble = require("plugins.FolkePlugins.troubleMain")
local wk = require("plugins.FolkePlugins.which-key")
return {
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- Library paths can be absolute
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				-- Or relative, which means they will be resolved from the plugin dir.
				"lazy.nvim",
				-- Only load the lazyvim library when the `LazyVim` global is found
				-- Load the wezterm types when the `wezterm` module is required
				-- Needs `justinsgithub/wezterm-types` to be installed
				-- Load the xmake types when opening file named `xmake.lua`
				-- Needs `LelouchHe/xmake-luals-addon` to be installed
			},
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
	wk,
	todoComments,
	trouble,
	require("plugins.FolkePlugins.flash"),
}
