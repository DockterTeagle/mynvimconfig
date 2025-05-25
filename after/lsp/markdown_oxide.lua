---@type vim.lsp.ClientConfig
return {
	cmd = { "markdown-oxide" },
	filetypes = { "markdown" },
	capabilities = {
		textDocument = {
			foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = false,
			},
		},
	},
	on_attach = function()
		vim.api.nvim_buf_create_user_command(0, "LspToday", function()
			vim.lsp.buf.execute_command({ command = "jump", arguments = { "today" } })
		end, {
			desc = "Open today's daily note",
		})
		vim.api.nvim_buf_create_user_command(0, "LspTomorrow", function()
			vim.lsp.buf.execute_command({ command = "jump", arguments = { "tomorrow" } })
		end, {
			desc = "Open tomorrow's daily note",
		})
		vim.api.nvim_buf_create_user_command(0, "LspYesterday", function()
			vim.lsp.buf.execute_command({ command = "jump", arguments = { "yesterday" } })
		end, {
			desc = "Open yesterday's daily note",
		})
	end,
	root_markers = {
		".git",
		".obsidian",
		".moxide.toml",
	},
}
