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
		nixpkgs_format = {},
	},
	formatters_by_ft = {
		lua = { "stylua" },
		bib = { "bibtex-tidy" },
		python = { "black" },
		c = { "clang-format" },
		cpp = { "clang-format" },
		cmake = { "cmakelang" },
		nix = { "nixpkgs_fmt" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
}
return options
