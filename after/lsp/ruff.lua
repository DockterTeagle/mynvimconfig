---@type vim.lsp.ClientConfig
return {
	cmd = { "ruff", "server" },
	root_markers = {
		"pyproject.toml",
		"setup.py",
		"setup.cfg",
		"requirements.txt",
		"Pipfile",
		"pyrightconfig.json",
		".git",
	},
	filetypes = { "python" },
	settings = {
		ruff = {
			configurationPreference = "filesystemFirst",
			codeAction = {
				fixViolation = {
					enable = true,
				},
			},
			lint = {
				preview = true,
			},
			format = {
				preview = true,
			},
			disableRuleComment = {
				enable = false,
			},
		},
	},
}
