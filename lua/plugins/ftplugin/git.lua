return {
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
			{
				"sindrets/diffview.nvim",
				cmd = {
					"DiffviewOpen",
					"DiffviewToggleFiles",
					"DiffviewFocusFiles",
					"DiffviewRefresh",
				},
			},

			-- Only one of these is needed, not both.
			"folke/snacks.nvim",
		},
		cmd = "Neogit",
		config = true,
	},
}
