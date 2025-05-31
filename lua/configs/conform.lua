---@module "conform"
---@type conform.setupOpts
local options = {
	formatters = {
		treefmt = {
			inherit = false,
			command = "treefmt",
			args = { "--stdin", "$FILENAME" },
		},
		injected = {
			options = {
				lang_to_formatters = {},
				ignore_errors = false,
				lang_to_ft = {
					bash = "sh",
				},
				lang_to_ext = {
					bash = "sh",
					c_sharp = "cs",
					elixir = "exs",
					javascript = "js",
					julia = "jl",
					latex = "tex",
					plaintex = "tex",
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
		python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
		c = { "clang-format" },
		cpp = { "clang-format" },
		cmake = { "cmake_format" },
		nix = { "alejandra", "injected" },
		markdown = { "injected" },
		["*"] = { "treefmt" },
		tex = { "tex-fmt" },
		toml = { "taplo" },
		yaml = { "yq" },
		nu = { "nufmt" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
}
return options
