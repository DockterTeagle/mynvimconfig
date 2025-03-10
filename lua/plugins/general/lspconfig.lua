local ltexopts = {
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
return {
	{
		"kosayoda/nvim-lightbulb",
		event = "LspAttach",
		opts = {
			autocmd = {
				enabled = true,
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPost", "BufNewFile", "BufWritePre" },
		dependencies = {
			"saghen/blink.cmp",
		},
		opts = {
			servers = {
				marksman = {},
				bashls = {},
				denols = {},
				vimls = {},
				-- "julials",
				jsonls = {},
				matlab_ls = {},
				neocmake = {},
				ltex_plus = ltexopts,
				hyprls = {},
				zls = {},
				bacon_ls = { enabled = diagnostics == "bacon-ls" },
			},
		},
		config = function(_, opts)
			local lspconfig = require("lspconfig")
			for server, server_config in pairs(opts.servers) do
				local config = vim.tbl_deep_extend("force", server_config, {
					on_attach = require("configs.lsp.lspconfigDefaults").on_attach,
					capabilities = require("blink.cmp").get_lsp_capabilities(server_config.capabilities),
				})
				lspconfig[server].setup(config)
			end
		end,
	},
}
