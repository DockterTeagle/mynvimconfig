local language_id_mapping = {
	bib = "bibtex",
	pandoc = "markdown",
	plaintex = "tex",
	rnoweb = "rsweave",
	rst = "restructuredtext",
	tex = "latex",
	text = "plaintext",
}

local function get_language_id(_, filetype)
	return language_id_mapping[filetype] or filetype
end
---@type vim.lsp.ClientConfig
return {
	cmd = { "ltex-ls-plus" },
	get_language_id = get_language_id,
	capabilities = {
		textDocument = {
			foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = false,
			},
		},
	},
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
	settings = {
		ltex = {
			enabled = {
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
				"latex",
				"text",
				"typst",
				"xhtml",
			},
			-- statusBarItem = true,
			clearDiagnosticsWhenClosingFile = false,
			additionalRules = {
				enablePickyRules = true,
				motherTongue = "en-US",
			},
			-- checkFrequency = "save",
			language = "en-US",
		},
	},
}
