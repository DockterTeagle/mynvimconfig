return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPost", "BufNewFile", "BufWritePre" },
		opts = function()
			return require("configs.gitsigns")
		end,
	},
	{
		"pwntester/octo.nvim",
		-- event = "VeryLazy",
		dependencies = { "nvim-lua/plenary.nvim", "folke/snacks.nvim", "echasnovski/mini.icons" },
		opts = { picker = "snacks" },
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim",

			-- Only one of these is needed, not both.
			"folke/snacks.nvim",
		},
		cmd = "Neogit",
		config = true,
	},
}
