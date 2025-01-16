return {
	{
		"lervag/vimtex",
		lazy = false,
		config = function()
			vim.g.vimtex_compiler_latexmk = {
				executable = "latexmk",
				_ = "luatex",
				options = {
					"-shell-escape",
					"-verbose",
					"-file-line-error",
					"-interaction=nonstopmode",
					"-synctex=1",
					"-recorder",
				},
			}
			vim.g.vimtex_view_method = "zathura"
			vim.g.vimtex_imaps_enabled = 0
			vim.g.vimtex_compiler_latexmk.clean_flags = "-pdf -bibtex -f -xelatex"
		end,
	},
}
