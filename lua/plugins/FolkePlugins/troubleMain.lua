return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	cmd = "Trouble",
	keys = {
		"<leader>tr",
		"<cmd> Trouble diagnostics toggle<cr>",
		desc = "diagnostics",
	},
}
