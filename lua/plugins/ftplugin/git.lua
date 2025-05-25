return {
	{
		"rhysd/git-messenger.vim",
		-- dependencies = {
		-- 	"gitsigns",
		-- },
		keys = {
			-- {
			-- 	"<localleader>gm",
			-- 	mode = { "n" },
			-- },
		},
		init = function()
			vim.g.git_messenger_no_default_mappings = true
		end,
	},
	{
		"pwntester/octo.nvim",
		event = "VeryLazy",
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
