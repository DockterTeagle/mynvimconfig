---@type vim.lsp.ClientConfig
return {
	cmd = { "texlab" },
	filetypes = { "tex", "plaintex", "bib" },
	settings = {
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
}
