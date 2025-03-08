return {
	{
		"lervag/vimtex",
		lazy = false,
		config = function()
			vim.g.vimtex_mappings_disable = { ["n"] = { "K" } }
			vim.g.vimtex_quickfix_mode = 0
			vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"
			vim.g.vimtex_fold_types = {
				preamble = { enabled = 1 },
				sections = {
					parse_levels = 1,
				},
			}
			vim.g.vimtex_syntax_conceal = {
				accents = 1,
				ligatures = 1,
				cites = 1,
				fancy = 1,
				spacing = 1,
				greek = 1,
				math_bounds = 1,
				math_delimiters = 1,
				math_fracs = 1,
				math_super_sub = 1,
				math_symbols = 1,
				sections = 1,
				styles = 1,
			}
			vim.g.vimtex_compiler_latexmk = {
				executable = "latexmk",
				aux_dir = "latexbuild",
				options = {
					"-shell-escape",
					"-verbose",
					"-file-line-error",
					"-interaction=nonstopmode",
					"-synctex=1",
					"-recorder",
				},
			}
			vim.g.vimtex_compiler_latexmk_engines = {
				_ = "-lualatex",
			}
			vim.g.vimtex_view_method = "zathura"
		end,
	},
}
