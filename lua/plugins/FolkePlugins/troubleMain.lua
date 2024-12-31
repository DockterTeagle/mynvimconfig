return {
	{
		"folke/trouble.nvim",
		dependencies = { "echasnovski/mini.icons" },
		opts = {},
		cmd = "Trouble",
		keys = {
			"<leader>tr",
			"<cmd> Trouble diagnostics toggle<cr>",
			desc = "diagnostics",
		},
	},
}
