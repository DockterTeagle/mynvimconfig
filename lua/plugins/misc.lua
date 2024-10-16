return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		opts = require("configs.conform"),
		-- init = function()
		-- 	vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		-- end,
	},

	{
		--remider that linters happen on file open and on file write
		"mfussenegger/nvim-lint",
		event = "VeryLazy",
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				markdown = { "vale" },
				python = { "ruff", "mypy" },
				cmake = { "cmakelint" },
			}
			vim.api.nvim_create_autocmd({ "InsertLeave", "BufEnter", "BufWritePre" }, {
				callback = function()
					local lint_status = pcall(require)
					if lint_status then
						lint.try_lint()
					end
				end,
			})
		end,
	},
	-- {
	--   "tpope/vim-surround",
	--
	-- }
	{
		"junegunn/vim-easy-align",
		lazy = false,
	},
	{
		"vyfor/cord.nvim",
		build = "./build",
		event = "VeryLazy",
		opts = {},
	},
	{
		"stevearc/aerial.nvim",
		cmd = { "AerialToggle", "AerialOpen" },
		keys = {
			{
				"<leader>ou",
				"<cmd>AerialToggle!<CR>",
				desc = "Toggle outline using aerial",
			},
		},
		opts = {
			filter_kind = false,
		},
		-- Optional dependencies
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"grapp-dev/nui-components.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
	},
	{
		"nvim-pack/nvim-spectre",
	},
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("refactoring").setup()
		end,
	},
	{
		"smjonas/inc-rename.nvim",
		config = function()
			require("inc_rename").setup({})
		end,
		cmd = "IncRename",
	},
	{
		"sindrets/diffview.nvim",
		cmd = {
			"DiffviewOpen",
			"DiffviewToggleFiles",
			"DiffviewFocusFiles",
			"DiffviewRefresh",
		},
		{
			"NeogitOrg/neogit",
			dependencies = {
				"nvim-lua/plenary.nvim", -- required
				"sindrets/diffview.nvim", -- optional - Diff integration

				-- Only one of these is needed, not both.
				"nvim-telescope/telescope.nvim", -- optional
			},
			cmd = "Neogit",
			config = true,
			-- event = "Enter git buffer"?
		},
		{
			"numToStr/Comment.nvim",
			opts = {
				padding = true,
			},
		},
	},
	require("plugins.FolkePlugins.folkePlugins"),
	require("plugins.FileBrowsers.oil"),
	require("plugins.FileBrowsers.nvim-treeMain"),
	require("plugins.Telescope.TelescopePlugins"),
	require("plugins.dap.nvim-dap"),
	require("plugins.Compilers.Compiler"),
}
