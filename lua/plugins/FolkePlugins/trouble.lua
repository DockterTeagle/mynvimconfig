return {
	{
		"folke/trouble.nvim",
		dependencies = { "echasnovski/mini.icons" },
		opts = {
			auto_close = true,
			modes = {
				-- quickfix = { auto_open = true },
				lsp = {
					win = { position = "right" },
				},
			},
		},
		cmd = "Trouble",
	},
}
