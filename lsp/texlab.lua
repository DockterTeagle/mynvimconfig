return {
	cmd = { "texlab" },
	filetypes = { "tex", "plaintex", "bib" },
	settings = {

		forwardSearch = {
			executable = "zathura",
		},
		build = {
			useFileList = true,
		},
		chktex = {
			onOpenAndSave = true,
			onEdit = true,
		},
		experimental = {
			followPackageLinks = true,
		},
	},
}
-- texlab = {
-- },
