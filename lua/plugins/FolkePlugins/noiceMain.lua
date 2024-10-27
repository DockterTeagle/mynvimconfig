return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		{
			"MunifTanjim/nui.nvim",
			lazy = false,
		},
		{ "rcarriga/nvim-notify", lazy = false },
	},
	opts = {
		popupmenu = {
			enabled = true,
		},
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
		},
		lsp = {
			hover = {
				enabled = true,
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
			inc_rename = true, -- enables an input dialog for inc-rename.nvim
			lsp_doc_border = true, -- add a border to hover docs and signature help
		},
	},
}
