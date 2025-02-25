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
		injected = {
			options = {
				ignore_errors = true,
				lang_to_ext = {
					bash = "sh",
					c_sharp = "cs",
					elixir = "exs",
					javascript = "js",
					julia = "jl",
					latex = "tex",
					markdown = "md",
					python = "py",
					ruby = "rb",
					rust = "rs",
					teal = "tl",
					typescript = "ts",
					yaml = "yaml",
				},
			},
		},
	},
	formatters_by_ft = {
		lua = { "stylua" },
		bib = { "bibtex-tidy" },
		rust = { "rustfmt", lsp_format = "fallback" },
		python = { "ruff_organize_imports", "ruff_format", "ruff_fix" },
		c = { "clang-format" },
		cpp = { "clang-format" },
		cmake = { "cmake_format" },
		nix = { "alejandra", "injected" },
		["*"] = { "codespell" },
		tex = { "latexindent" },
		toml = { "taplo" },
		yaml = { "yq" },
		markdown = { "markdownlint-cli2" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
}
return options
