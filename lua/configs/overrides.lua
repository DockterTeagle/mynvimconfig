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
M.treesitter = {
	ignore_install = { "tex" },
	ensure_installed = {
		"vim",
		"lua",
		"python",
		"markdown",
		"markdown_inline",
		"bash",
		"regex",
		"vimdoc",
		"gitignore",
		"c",
		"cpp",
		"rust",
	},
}
return M
