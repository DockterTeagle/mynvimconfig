return {
	{
		"lewis6991/hover.nvim",
		event = "LspAttach",
		config = function()
			require("hover.providers.lsp")
		end,
	},
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
				jsonls = {},
				matlab_ls = {},
				neocmake = {},
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
