---@module "lazy"
---@type LazySpec
return {
	{
		"mikavilpas/yazi.nvim",
		lazy = false,
		-- cmd = "Yazi",
		dependencies = { "folke/snacks.nvim" },
		---@module "yazi"
		---@type YaziConfig | {}
		opts = {
			-- if you want to open yazi instead of netrw, see below for more info
			open_for_directories = true,
			integrations = {},
			keymaps = {
				show_help = "<f1>",
			},
		},
		init = function()
			vim.g.loaded_netrwPlugin = 1
		end,
	},
}
