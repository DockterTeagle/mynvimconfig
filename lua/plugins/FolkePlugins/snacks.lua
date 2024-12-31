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
			bigfile = { enabled = true },
			input = { enabled = true },
			toggle = { enabled = true },
			notify = { enabled = true },
			notifier = { enabled = true },
			quickfile = { enabled = true },
			scroll = { enabled = true },
			statuscolumn = { enabled = true },
			words = { enabled = true },
			gitbrowse = { enabled = true },
			scope = { enabled = true },
		},
	},
}
