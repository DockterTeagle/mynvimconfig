local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
local lsp_on_attach = require("configs.lspconfigDefaults")

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
