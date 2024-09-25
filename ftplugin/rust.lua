local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
lsp_capabilities.textDocument.completion.completionItem = {
	documentationFormat = { "markdown", "plaintext" },
	snippetSupport = true,
	preselectSupport = true,
	insertReplaceSupport = true,
	labelDetailsSupport = true,
	deprecatedSupport = true,
	commitCharactersSupport = true,
	tagSupport = { valueSet = { 1 } },
	resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	},
}
local lsp_on_attach = require("configs.lspconfigDefaults").on_attach
vim.g.rustaceanvim = {
	tools = {
		inlay_hints = {
			enable = true,
		},
	},
	server = {
		on_attach = lsp_on_attach,
		capabilities = lsp_capabilities,
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
