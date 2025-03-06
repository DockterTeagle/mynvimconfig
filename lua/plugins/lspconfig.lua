return {
	{
		"nvimdev/lspsaga.nvim",
		opts = {
			lightbulb = {
				-- virtual_text = false,
			},
		},
		config = function(_, opts)
			require("lspsaga.util").icon_from_devicon = function(ft)
				return require("mini.icons").get("filetype", ft)
			end
			require("lspsaga").setup(opts)
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional
			"echasnovski/mini.icons",
		},
		event = "LspAttach",
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPost", "BufNewFile", "BufWritePre" },
		dependencies = {
			"saghen/blink.cmp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
		},
		opts = function()
			return require("configs.lsp.lspconfig")
		end,
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
