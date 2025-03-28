--TODO: ROOT_DIR
return {
	cmd = { "ltex-ls-plus" },
	filetypes = {
		"bib",
		"context",
		"gitcommit",
		"html",
		"markdown",
		"org",
		"pandoc",
		"plaintex",
		"quarto",
		"mail",
		"mdx",
		"rmd",
		"rnoweb",
		"rst",
		"tex",
		"text",
		"typst",
		"xhtml",
	},
	capabilities = require("blink.cmp").get_lsp_capabilities(),
	on_attach = require("configs.lsp.lspconfigDefaults").on_attach(),
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
