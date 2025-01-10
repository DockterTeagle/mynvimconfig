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
