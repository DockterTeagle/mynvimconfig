local M = {}
M.lualine_opts = function()
	local icons = vim.g.icons
	vim.o.laststatus = vim.g.lualine_laststatus
	local opts = {
		options = {
			theme = "auto",
			globalstatus = vim.o.laststatus == 3,
		},
		icons_enabled = true,
		theme = "tokyonight",
		globalstatus = true,
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch" },
			lualine_x = {
				{
					"diff",
					symbols = {
						added = icons.git.added,
						modified = icons.git.modified,
						removed = icons.git.removed,
					},
					source = function()
						local gitsigns = vim.b.gitsigns_status_dict
						if gitsigns then
							return {
								added = gitsigns.added,
								modified = gitsigns.changed,
								removed = gitsigns.removed,
							}
						end
					end,
				},
			},
			lualine_c = {
				{
					"diagnostics",
					symbols = {
						error = icons.diagnostics.Error,
						warn = icons.diagnostics.Warn,
						info = icons.diagnostics.Info,
						hint = icons.diagnostics.Hint,
					},
				},
				{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
			},
		},
		extensions = {
			"trouble",
			"toggleterm",
			"quickfix",
			"overseer",
			"nvim-dap-ui",
			"symbols-outline",
			"lazy",
		},
	}
	return opts
end
return M
