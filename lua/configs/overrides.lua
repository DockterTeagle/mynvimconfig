local M = {}
M.mason = {
	ensure_installed = {
		--formatters
		"black",
		"stylua",
		"clang-format",
		"bibtex-tidy",
		"nixpkgs-fmt",
		--end formatters
		--LSPs
		"pyright",
		"bash-language-server",
		"clangd",
		"cmake-language-server",
		"deno",
		"lua-language-server",
		"marksman",
		"rust-analyzer",
		"texlab",
		"vim-language-server",
		"asm-lsp",
		"julia-lsp",
		"nil",
		--end LSPs
		--Linters
		"cmakelint",
		"cpplint",
		"mypy",
		"ruff",
		"vale",
		--End Linters
		--DAPs
		"debugpy",
		"codelldb",
	},
}
return M
