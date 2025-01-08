return {
	{
		"neovim/nvim-lspconfig",
		event = "User FilePost",
		dependencies = {
			{
				"tamago324/nlsp-settings.nvim",
			},
		},
		config = function()
			require("configs.lsp.lspconfig")
		end,
	},
}
