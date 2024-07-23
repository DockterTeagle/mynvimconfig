local lsp_capabilities = require("configs.lspconfigDefaults").capabilities
local lsp_on_attach = require("configs.lspconfigDefaults").on_attach
vim.g.rustaceanvim = {
	tools = {
		inlay_hints = {
			enable = true,
		},
	},
	server = {
		settings = {
			on_attach = lsp_on_attach,
			capabilities = lsp_capabilities,
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
