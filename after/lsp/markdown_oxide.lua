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
	root_markers = {
		".git",
		".obsidian",
		".moxide.toml",
	},
}
