---@type vim.lsp.ClientConfig
return {
	cmd = { "markdown-oxide" },
	filetypes = { "markdown" },
	root_markers = {
		".git",
		".obsidian",
		".moxide.toml",
	},
}
