return {
	{
		"NvChad/base46",
		branch = "v2.5",
		build = function()
			require("base46").load_all_highlights()
		end,
	},

	{
		"NvChad/ui",
		branch = "v2.5",
		lazy = false,
		config = function()
			require("nvchad")
		end,
	},

	{
		"nvim-tree/nvim-web-devicons",
		opts = function()
			return { override = require("nvchad.icons.devicons") }
		end,
		config = function(_, opts)
			dofile(vim.g.base46_cache .. "devicons")
			require("nvim-web-devicons").setup(opts)
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		event = "User FilePost",
		opts = {
			indent = { char = "│", highlight = "IblChar" },
			scope = { char = "│", highlight = "IblScopeChar" },
		},
		config = function(_, opts)
			dofile(vim.g.base46_cache .. "blankline")

			local hooks = require("ibl.hooks")
			hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
			require("ibl").setup(opts)

			dofile(vim.g.base46_cache .. "blankline")
		end,
	},

	-- formatting!
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		opts = function()
			local opts = {
				formatters = {
					stylua = {
						column_width = 120,
						line_endings = "Unix",
						indent_type = "Spaces",
						indent_width = 2,
						quote_style = "AutoPreferDouble",
						call_parentheses = "None",
					},
					nixpkgs_format = {},
				},
				formatters_by_ft = {
					lua = { "stylua" },
					bib = { "bibtex-tidy" },
					python = { "black" },
					c = { "clang-format" },
					cpp = { "clang-format" },
					cmake = { "cmakelang" },
					nix = { "nixpkgs_fmt" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},
			}
			return opts
		end,
		-- init = function()
		-- 	vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		-- end,
	},

	-- git stuff
	{
		"lewis6991/gitsigns.nvim",
		event = "User FilePost",
		opts = function()
			return require("nvchad.configs.gitsigns")
		end,
		config = function(_, opts)
			require("gitsigns").setup(opts)
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = "User FilePost",
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lspconfig")
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{
				-- snippet plugin
				"L3MON4D3/LuaSnip",
				-- dependencies = "rafamadriz/friendly-snippets",
				opts = { history = true, updateevents = "TextChanged,TextChangedI" },
				config = function(_, opts)
					require("luasnip").config.set_config(opts)
					require("nvchad.configs.luasnip")
				end,
			},

			-- autopairing of (){}[] etc
			{
				"windwp/nvim-autopairs",
				opts = {
					fast_wrap = {},
					disable_filetype = { "TelescopePrompt", "vim" },
				},
				config = function(_, opts)
					require("nvim-autopairs").setup(opts)

					-- setup cmp for autopairs
					local cmp_autopairs = require("nvim-autopairs.completion.cmp")
					require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
				end,
			},

			-- cmp sources plugins
			{
				"saadparwaiz1/cmp_luasnip",
				"hrsh7th/cmp-nvim-lua",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
			},
		},
		opts = function()
			return require("nvchad.configs.cmp")
		end,
		config = function(_, opts)
			require("cmp").setup(opts)
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		cmd = "Telescope",
		opts = function()
			return require("nvchad.configs.telescope")
		end,
		config = function(_, opts)
			local telescope = require("telescope")
			telescope.setup(opts)

			-- load extensions
			for _, ext in ipairs(opts.extensions_list) do
				telescope.load_extension(ext)
			end
		end,
	},

	{
		"NvChad/nvim-colorizer.lua",
		event = "User FilePost",
		opts = {
			user_default_options = { names = false },
			filetypes = {
				"*",
				"!lazy",
			},
		},
		config = function(_, opts)
			require("colorizer").setup(opts)

			-- execute colorizer as soon as possible
			vim.defer_fn(function()
				require("colorizer").attach_to_buffer(0)
			end, 0)
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		build = ":TSUpdate",
		opts = function()
			require("nvchad.configs.treesitter")
			require("configs.overrides.treesitter")
		end,
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
