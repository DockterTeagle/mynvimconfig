local M = {}
M.lualine_opts = function()
	local icons = vim.g.icons
	vim.o.laststatus = vim.g.lualine_laststatus
	local opts = {
		options = {
			theme = "auto",
			globalstatus = vim.o.laststatus == 3,
			disabled_filetypes = {
				statusline = {
					"dashboard",
					"alpha",
					"ministarter",
					"snacks_dashboard",
				},
			},
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
					"aerial",
					sep = " ", -- separator between symbols
					sep_icon = "", -- separator between icon and symbol

					-- The number of symbols to render top-down. In order to render only 'N' last
					-- symbols, negative numbers may be supplied. For instance, 'depth = -1' can
					-- be used in order to render only current symbol.
					depth = 5,

					-- When 'dense' mode is on, icons are not rendered near their symbols. Only
					-- a single icon that represents the kind of current symbol is rendered at
					-- the beginning of status line.
					dense = false,

					-- The separator to be used to separate symbols in dense mode.
					dense_sep = ".",

					-- Color the symbol icons.
					colored = true,
				},
				{
					function()
						local icon = "" -- Icon to display when LSP is active
						local clients = vim.lsp.get_clients({ bufnr = 0 }) -- Get LSP clients for the current buffer
						if next(clients) == nil then
							return "" -- No LSP active, return empty string
						end

						local names = {}
						for _, client in ipairs(clients) do
							table.insert(names, client.name)
						end
						return icon .. " " .. table.concat(names, ", ")
					end,
					icon = "", -- No need to set the icon again; it's part of the function
					color = { fg = "#98be65", gui = "bold" }, -- Customize colors as needed
				},
				{
					function()
						local linters = require("lint").get_running()
						if #linters == 0 then
							return ""
						end
						local linter_names = {}
						for _, linter_id in ipairs(linters) do
							table.insert(linter_names, linter_id) -- Use linter_id directly or map to names
						end

						return "󱉶 " .. table.concat(linter_names, ", ")
					end,
					icon = "", -- No need to set the icon again; it's part of the function
					color = { fg = "#98be65", gui = "bold" }, -- Customize colors as needed
				},
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
			"aerial",
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
