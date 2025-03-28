local on_attach = require("configs.lsp.lspconfigDefaults").on_attach
vim.g.rustaceanvim = {
	tools = {
		test_executor = "background",
		inlay_hints = {
			enable = true,
		},
	},
	server = {
		on_attach = on_attach,
		default_settings = {
			["rust-analyzer"] = {
				cargo = {
					allFeatures = true,
					autoreload = true,
					loadOutDirsFromCheck = true,
					buildScripts = {
						enable = true,
					},
				},
				checkOnSave = true,
				diagnostics = {
					enable = true,
				},
				procMacro = { enable = true },
				files = {
					excludeDirs = {
						".direnv",
						".git",
						".github",
						".gitlab",
						"bin",
						"node_modules",
						"target",
						"venv",
						".venv",
					},
				},
				completion = {
					addCallArgumentSnippets = true,
					addCallParenthesis = true,
					autoimport = { enable = true },
				},
			},
		},
	},
	dap = {},
}
