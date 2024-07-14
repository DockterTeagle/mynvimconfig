local overrides = require("configs.overrides")
return {
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
		init = function()
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = "VeryLazy",
		opts = overrides.treesitter,
	},
	{
		"junegunn/vim-easy-align",
		lazy = false,
	},
	{
		"andweeb/presence.nvim",
		event = "VeryLazy",
	},
	{
		"hedyhli/outline.nvim",
		lazy = true,
		cmd = { "Outline", "OutlineOpen" },
		keys = { -- Example mapping to toggle outline
			{ "<leader>ou", "<cmd>Outline<CR>", desc = "Toggle outline" },
		},
		opts = {
			-- Your setup opts here
		},
	},
	-- {
	-- 	"stevearc/aerial.nvim",
	-- 	cmd = "AerialToggle",
	-- 	opts = {},
	-- 	-- Optional dependencies
	-- 	dependencies = {
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 		"nvim-tree/nvim-web-devicons",
	-- 	},
	-- },
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
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		config = function()
			require("tiny-inline-diagnostic").setup()
		end,
	},
	require("plugins.FolkePlugins.folkePlugins"),
	require("plugins.FileBrowsers.oil"),
	require("plugins.FileBrowsers.nvim-treeMain"),
	require("plugins.Telescope.TelescopePlugins"),
	require("plugins.dap.nvim-dap"),
	require("plugins.Compilers.VimTeX"),
	require("plugins.Compilers.Compiler"),
}
