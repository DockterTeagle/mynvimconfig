return {
	cmd = { "ltex-ls-plus" },
	on_attach = require("configs.lsp.lspconfigDefaults").on_attach(),
	capabilities = require("blink.cmp").get_lsp_capabilities(),
	settings = {
		ltex = {
			-- statusBarItem = true,
			clearDiagnosticsWhenClosingFile = false,
			enabled = true,
			additionalRules = {
				enablePickyRules = true,
				motherTongue = "en-US",
			},
			-- checkFrequency = "save",
			language = "en-US",
		},
	},
}
