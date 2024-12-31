return {
	{
		"neovim/nvim-lspconfig",
		event = "User FilePost",
		config = function()
			require("configs.lsp.lspconfig")
		end,
	},
	{
		"tamago324/nlsp-settings.nvim",
	},
}
