return {
	"lervag/vimtex",
	lazy = false,
	init = function()
		vim.g.vimtex_compiler_latexmk = {
			options = {
				"-xelatex",
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
	end,
}
