return {
	cmd = { "clangd" },
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
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
			capabilities = { offSetEncoding = { "utf-16" } },
			cmd = {
				"clangd",
				"--background-index",
				"--clang-tidy",
				"--header-insertion=iwyu",
				"--completion-style=detailed",
				"--function-arg-placeholders",
				"--fallback-style=llvm",
			},
			init_options = {
				usePlaceholders = true,
				completeUnimported = true,
				clangdFileStatus = true,
			},
		},
	},
}
-- setup = {
-- 	clangd = function(_, opts)
-- 		local clangd_ext_opts = LazyVim.opts("clangd_extensions.nvim")
-- 		require("clangd_extensions").setup(
-- 			vim.tbl_deep_extend("force", clangd_ext_opts or {}, { server = opts })
-- 		)
-- 		return false
-- 	end,
-- },
