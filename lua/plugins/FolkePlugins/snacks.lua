return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			styles = {
				input = {
					-- backdrop = {
					--
					--      },
					position = "float",
					border = "rounded",
					height = 1,
					relative = "editor",
					noautocmd = true,
					row = 2,
					-- relative = "cursor",
					-- row = -3,
					-- col = 0,
					wo = {
						winhighlight = "NormalFloat:SnacksInputNormal,FloatBorder:SnacksInputBorder,FloatTitle:SnacksInputTitle",
						cursorline = false,
					},
					bo = {
						filetype = "snacks_input",
						buftype = "prompt",
					},
					--- buffer local variables
					b = {
						completion = false, -- disable blink completions in input
					},
					keys = {
						n_esc = { "<esc>", { "cmp_close", "cancel" }, mode = "n", expr = true },
						i_esc = { "<esc>", { "cmp_close", "stopinsert" }, mode = "i", expr = true },
						i_cr = { "<cr>", { "cmp_accept", "confirm" }, mode = "i", expr = true },
						i_tab = { "<tab>", { "cmp_select_next", "cmp" }, mode = "i", expr = true },
						q = "cancel",
					},
				},
			},
			animate = { enabled = true },
			bigfile = { enabled = true },
			bufdelete = { enabled = true },
			debug = { enabled = true },
			dim = { enabled = true },
			git = { enabled = true },
			gitbrowse = { enabled = true },
			indent = { enabled = true },
			input = { enabled = true },
			notifier = { enabled = true },
			notify = { enabled = true },
			profiler = { enabled = true },
			quickfile = { enabled = true },
			scope = { enabled = true },
			scratch = { enabled = true },
			scroll = { enabled = true },
			toggle = { enabled = true },
			terminal = { enabled = true },
			win = { enabled = true },
			words = { enabled = true },
			statuscolumn = {
				enabled = true,
				folds = {
					git_hl = true,
					open = true,
				},
			},
		},
		config = function(_, opts)
			local notify = vim.notify
			require("snacks").setup(opts)
			vim.notify = notify
		end,
	},
}
