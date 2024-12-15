return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		opts = require("configs.conform"),
		-- init = function()
		-- 	vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		-- end,
	},
	-- {
	-- 	"epwalsh/obsidian.nvim",
	-- 	version = "*", -- recommended, use latest release instead of latest commit
	-- 	lazy = true,
	-- 	ft = "markdown",
	-- 	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	-- 	-- event = {
	-- 	--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
	-- 	--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
	-- 	--   -- refer to `:h file-pattern` for more examples
	-- 	--   "BufReadPre path/to/my-vault/*.md",
	-- 	--   "BufNewFile path/to/my-vault/*.md",
	-- 	-- },
	-- 	dependencies = {
	-- 		-- Required.
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-telescope/telescope.nvim",
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 		"hrsh7th/nvim-cmp",
	-- 	},
	-- 	opts = {
	-- 		workspaces = {
	-- 			{
	-- 				name = "personal",
	-- 				path = "~/vaults/personal",
	-- 			},
	-- 			{
	-- 				name = "work",
	-- 				path = "~/vaults/work",
	-- 			},
	-- 		},
	--
	-- 		-- see below for full list of options 👇
	-- 	},
	-- },

	{
		--remider that linters happen on file open and on file write
		"mfussenegger/nvim-lint",
		event = "VeryLazy",
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				-- markdown = { "vale" },
				python = { "mypy", "ruff" },
				cmake = { "cmakelint" },
				-- lua = { "selene" },
				tex = { "write_good" },
				-- nix = { "deadnix", "nix" }, currently deadnix is just duplicating the nixd errors
				nix = { "statix" },
			}
			vim.api.nvim_create_autocmd({ "InsertLeave", "BufEnter", "BufWritePre", "BufWritePost" }, {
				callback = function()
					local lint_status = pcall(require, "lint")
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
	-- {
	-- 	"kiyoon/jupynium.nvim",
	-- 	lazy = false,
	-- 	-- build = "conda run --no-capture-output -n jupynium pip install .",
	-- 	-- enabled = vim.fn.isdirectory(vim.fn.expand "~/miniconda3/envs/jupynium"),
	-- 	dependencies = {
	-- 		"rcarriga/nvim-notify",
	-- 		"stevearc/dressing.nvim",
	-- 	},
	-- },
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
	{
		"nvim-treesitter/nvim-treesitter",
		opts = require("configs.overrides.treesitter"),
	},
	require("plugins.FolkePlugins.folkePlugins"),
	require("plugins.FileBrowsers.oil"),
	require("plugins.FileBrowsers.nvim-treeMain"),
}
