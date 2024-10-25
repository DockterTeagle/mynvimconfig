local options = {
	formatters = {
		stylua = {
			column_width = 120,
			line_endings = "Unix",
			indent_type = "Spaces",
			indent_width = 2,
			quote_style = "AutoPreferDouble",
			call_parentheses = "None",
		},
		injected = {},
	},
	formatters_by_ft = {
		lua = { "stylua" },
		bib = { "bibtex-tidy" },
		rust = { "rustfmt", lsp_format = "fallback" },
		python = { "ruff_organize_imports", "ruff_format", "ruff_fix" },
		c = { "clang-format" },
		cpp = { "clang-format" },
		cmake = { "cmakelang" },
		nix = { "alejandra" },
		["*"] = { "codespell" },
		tex = { "latexindent" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
}
return options
