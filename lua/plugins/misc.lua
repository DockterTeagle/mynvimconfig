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
		"saghen/blink.cmp",
		lazy = false, -- lazy loading handled internally
		-- optional: provides snippets for the snippet source
		dependencies = {
			{ "folke/lazydev.nvim" },
			{
				"L3MON4D3/LuaSnip",
				version = "v2.*",
				build = "make install_jsregexp",
				init = function()
					local ls = require("luasnip")
					ls.config.set_config({ --not the most elegant can probably make this a config part instead
						history = true,
						enable_autosnippets = true,
						update_events = "TextChanged,TextChangedI",
						store_selection_keys = "<Tab>",
					})
				end,
			},
		},

		-- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- If you use nix, you can build from source using latest nightly rust with:
		build = "nix run .#build-plugin",

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = require("configs.blink-cmp"),
		-- allows extending the providers array elsewhere in your config
		-- without having to redefine it
		opts_extend = { "sources.default" },
	},

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
		config = true,
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
		config = true,
	},
	{
		"smjonas/inc-rename.nvim",
		config = true,
		cmd = "IncRename",
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
		"numToStr/Comment.nvim",
		opts = {
			padding = true,
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
