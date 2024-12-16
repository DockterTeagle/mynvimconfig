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
			{
				"L3MON4D3/LuaSnip",
				version = "v2.*",
				build = "make install_jsregexp",
				dependencies = {},
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

		-- use a release tag to download pre-built binaries
		-- version = "v0.*",
		-- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',
		-- If you use nix, you can build from source using latest nightly rust with:
		-- build = 'nix run .#build-plugin',

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- 'default' for mappings similar to built-in completion
			-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
			-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
			-- see the "default configuration" section below for full documentation on how to define
			-- your own keymap.

			keymap = {
				["<Tab>"] = { "select_next", "snippet_forward" },
				["<S-Tab>"] = { "select_prev", "snippet_backward" },
				["<CR>"] = { "accept" },
				["<C-e>"] = { "hide" },
				["<Up>"] = { "select_prev", "fallback" },
				["<Down>"] = { "select_next", "fallback" },
			},
			snippets = {
				expand = function(snippet)
					require("luasnip").lsp_expand(snippet)
				end,
				active = function(filter)
					if filter and filter.direction then
						return require("luasnip").jumpable(filter.direction)
					end
					return require("luasnip").in_snippet()
				end,
				jump = function(direction)
					require("luasnip").jump(direction)
				end,
			},
			appearance = {
				-- Sets the fallback highlight groups to nvim-cmp's highlight groups
				-- Useful for when your theme doesn't support blink.cmp
				-- will be removed in a future release
				use_nvim_cmp_as_default = true,
				-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "mono",
			},

			-- default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, via `opts_extend`
			sources = {

				default = { "lsp", "path", "luasnip", "buffer" },
				-- optionally disable cmdline completions
				cmdline = {},
			},

			-- experimental signature help support
			-- signature = {
			-- 	enabled = true,
			-- 	trigger = {
			-- 		blocked_trigger_characters = {},
			-- 		blocked_retrigger_characters = {},
			-- 		-- When true, will show the signature help window when the cursor comes after a trigger character when entering insert mode
			-- 		show_on_insert_on_trigger_character = true,
			-- 	},
			-- 	window = {
			-- 		min_width = 1,
			-- 		max_width = 100,
			-- 		max_height = 10,
			-- 		border = "padded",
			-- 		winblend = 0,
			-- 		winhighlight = "Normal:BlinkCmpSignatureHelp,FloatBorder:BlinkCmpSignatureHelpBorder",
			-- 		scrollbar = false, -- Note that the gutter will be disabled when border ~= 'none'
			-- 		-- Which directions to show the window,
			-- 		-- falling back to the next direction when there's not enough space,
			-- 		-- or another window is in the way
			-- 		direction_priority = { "n", "s" },
			-- 		-- Disable if you run into performance issues
			-- 		treesitter_highlighting = true,
			-- 	},
			-- },
		},
		-- allows extending the providers array elsewhere in your config
		-- without having to redefine it
		opts_extend = { "sources.default" },
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
