---@type vim.lsp.ClientConfig
return {
	cmd = { "marksman" },
	filetypes = { "markdown", "markdown.mdx" },
	root_markers = {
		".marksman.toml",
	},
	single_file_support = true,
}
