---@type vim.lsp.ClientConfig
return {
	cmd = { "texlab" },
	filetypes = { "tex", "plaintex", "bib", "sty" },
	root_markers = { ".git", ".latexmkrc", "latexmkrc", ".texlabroot", "texlabroot", "Tectonic.toml" },
	settings = {
		texlab = {
			forwardSearch = {
				executable = "zathura",
			},
			chktex = {
				onOpenAndSave = true,
				onEdit = true,
			},
			experimental = {
				followPackageLinks = true,
				-- mathEnvironments = true,
				-- enumeEnvironments = true,
			},
		},
	},
}
