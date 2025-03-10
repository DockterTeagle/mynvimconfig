return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		{
			"MunifTanjim/nui.nvim",
			lazy = false,
		},
		{
			"rcarriga/nvim-notify",
			lazy = false,
			opts = {
				background_colour = "#000000",
			},
		},
		{
			"nvim-treesitter/nvim-treesitter",
		},
	},
	opts = {
		popupmenu = {
			enabled = true,
		},
		-- notify = { view = "noice" },
		routes = {
			{
				filter = {
					event = "msg_showmore",
				},
				opts = { skip = true },
			},
			{
				filter = {
					event = "msg_show",
					kind = "",
					find = "rust", -- Modify this based on patterns in your Rust popups
				},
				opts = { skip = true },
			},
			{
				view = "notify",
				filter = {
					event = "msg_showmode",
				},
			},
			{
				filter = {
					event = "msg_show",
					any = {
						{ find = "%d+L, %d+B" },
						{ find = "; after #%d+" },
						{ find = "; before #%d+" },
					},
				},
				view = "mini",
			},
		},
		lsp = {
			hover = {
				enabled = true,
			},
			-- progress = { enabled = false },
			messages = {
				enabled = false,
			},
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
			signature = {
				enabled = true,
			},
		},
		presets = {
			bottom_search = true, -- use a classic bottom cmdline for search
			command_palette = true, -- position the cmdline and popupmenu together
			long_message_to_split = true, -- long messages will be sent to a split
			lsp_doc_border = true, -- add a border to hover docs and signature help
			inc_rename = true,
		},
	},
}
