---@type vim.lsp.ClientConfig
return {
	cmd = { "neocmakelsp", "--stdio" },
	filetypes = { "cmake" },
}
