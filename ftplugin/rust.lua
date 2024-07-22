local on_attach = require("nvchad.configs.lspconfig").on_attach
local lsp_capabilities = require("cmp_nvim_lsp").default_capabiliites()
vim.g.rustaceanvim = {
	tools = {
		inlay_hints = {
			enable = true,
		},
	},
	server = {
		settings = {
			on_attach = on_attach,
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
				-- on_attach = on_attach,
				-- capabilities = capabilities,
				-- on_init = on_init,
			},
		},
	},
	dap = {},
}
