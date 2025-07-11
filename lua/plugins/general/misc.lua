return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = "ConformInfo",
		opts = require("configs.conform"),
		init = function()
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	},

	{
		"gbprod/yanky.nvim",
		event = { "BufReadPost", "BufNewFile", "BufWritePre" },
		opts = {
			highlight = { timer = 150 },
		},
		keys = {
			-- {
			-- 	"<leader>p",
			-- 	function()
			-- 		require("telescope").extensions.yank_history.yank_history()
			-- 	end,
			-- 	mode = { "n", "x" },
			-- 	desc = "open Yank History",
			-- },
			{ "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank Text" },
			{ "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put Text After Cursor" },
			{ "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put Text Before Cursor" },
			{ "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "Put Text After Selection" },
			{ "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "Put Text Before Selection" },
			{ "]y", "<Plug>(YankyCycleForward)", desc = "Cycle Forward Through Yank History" },
			{ "[y", "<Plug>(YankyCycleBackward)", desc = "Cycle Backward Through Yank History" },
			{ "]p", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put Indented After Cursor (Linewise)" },
			{ "[p", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put Indented Before Cursor (Linewise)" },
			{ "]P", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put Indented After Cursor (Linewise)" },
			{ "[P", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put Indented Before Cursor (Linewise)" },
			{ ">p", "<Plug>(YankyPutIndentAfterShiftRight)", desc = "Put and Indent Right" },
			{ "<p", "<Plug>(YankyPutIndentAfterShiftLeft)", desc = "Put and Indent Left" },
			{ ">P", "<Plug>(YankyPutIndentBeforeShiftRight)", desc = "Put Before and Indent Right" },
			{ "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)", desc = "Put Before and Indent Left" },
			{ "=p", "<Plug>(YankyPutAfterFilter)", desc = "Put After Applying a Filter" },
			{ "=P", "<Plug>(YankyPutBeforeFilter)", desc = "Put Before Applying a Filter" },
		},
	},

	{
		"MagicDuck/grug-far.nvim",
		opts = { headerMaxWidth = 80 },
		cmd = "GrugFar",
		keys = {
			{
				"<leader>sr",
				function()
					local grug = require("grug-far")
					local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
					grug.open({
						transient = true,
						prefills = {
							filesFilter = ext and ext ~= "" and "*." .. ext or nil,
						},
					})
				end,
				mode = { "n", "v" },
				desc = "Search and Replace",
			},
		},
	},
	{ "akinsho/toggleterm.nvim", version = "*", config = true, lazy = false },

	{
		--remider that linters happen on file open and on file write
		"mfussenegger/nvim-lint",
		event = "VeryLazy",
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				cmake = { "cmakelint" },
				nix = { "statix", "nix" },
				cpp = { "cppcheck", "cpplint" },
				python = { "dmypy" },
				fish = { "fish" },
				systemd = { "systemd-analyze", "systemdlint" },
				markdown = { "markdownlint-cli2", "vale" },
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
	{
		"vyfor/cord.nvim",
		build = ":Cord update",
		event = "VeryLazy",
		config = true,
	},
	{
		"smjonas/inc-rename.nvim",
		config = true,
		cmd = "IncRename",
	},
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		opts = {
			padding = true,
		},
	},
	{
		"kevinhwang91/nvim-ufo",
		event = "LspAttach",
		opts = {},
		dependencies = {
			"kevinhwang91/promise-async",
		},
	},
	{ "wakatime/vim-wakatime", lazy = false },
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"m4xshen/hardtime.nvim",
		lazy = false,
		dependencies = { "MunifTanjim/nui.nvim" },
		opts = {
			disabled_filetypes = {
				lazy = false,
				["dapui"] = false,
			},
		},
	},
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},
}
