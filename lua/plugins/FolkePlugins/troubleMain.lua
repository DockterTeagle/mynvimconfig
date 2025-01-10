return {
	{
		"folke/trouble.nvim",
		dependencies = { "echasnovski/mini.icons" },
		opts = {
			modes = {
				lsp = {
					win = { position = "right" },
				},
			},
		},
		cmd = "Trouble",
		keys = { {
			"<leader>tr",
			"<cmd>Trouble diagnostics toggle<CR>",
			desc = "diagnostics",
		} },
	},
}
