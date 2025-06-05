---@type vim.lsp.ClientConfig
return {
	cmd = {
		"clangd",
		"--background-index",
		"--clang-tidy",
		"--header-insertion=iwyu",
		"--completion-style=detailed",
		"--function-arg-placeholders",
		"--fallback-style=llvm",
	},
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
	capabilities = {
		textDocument = {
			completion = { editsNearCursor = true },
		},
		offSetEncoding = { "utf-8", "utf-16" },
	},
	root_markers = {
		".clangd",
		".clang-tidy",
		".clang-format",
		"compile_commands.json",
		"compile_flags.txt",
		"configure.ac",
	},
	settings = {
		clangd = {
			init_options = {
				usePlaceholders = true,
				completeUnimported = true,
				clangdFileStatus = true,
			},
		},
	},
}
