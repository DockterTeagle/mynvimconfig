return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"tamago324/nlsp-settings.nvim",
			{ "antosha417/nvim-lsp-file-operations", config = true },
		},
		config = function()
			require("configs.lsp.lspconfig")
		end,
	},
}
