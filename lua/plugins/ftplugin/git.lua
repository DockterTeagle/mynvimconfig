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
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim", "echasnovski/mini.icons" },
		opts = {},
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
			"nvim-telescope/telescope.nvim", -- optional
		},
		cmd = "Neogit",
		config = true,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"gitignore",
				"gitattributes",
				"gitcommit",
				"git_config",
				"git_rebase",
			},
		},
	},
}
