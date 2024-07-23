return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	keys = {
		"<leader>tr",
		"<cmd> Trouble diagnostics toggle<cr>",
		desc = "diagnostics",
	},
}
