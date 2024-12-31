return {
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = "User FilePost",
		opts = {},
		config = function(_, opts)
			local hooks = require("ibl.hooks")
			hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
			require("ibl").setup(opts)
		end,
		---@module "ibl"
		---@type ibl.config
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "User FilePost",
		opts = function()
			return require("configs.gitsigns")
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = { fast_wrap = {}, disable_filetype = { "TelescopePrompt", "vim" } },
		config = function(_, opts)
			require("nvim-autopairs").setup(opts)
			-- local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			-- require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		opts = {
			options = {
      -- stylua: ignore
      -- close_command = function(n) Snacks.bufdelete(n) end,
      -- -- stylua: ignore
      -- right_mouse_command = function(n) Snacks.bufdelete(n) end,
				diagnostics = "nvim_lsp",
				always_show_bufferline = false,
				-- diagnostics_indicator = function(_, _, diag)
				-- local icons = LazyVim.config.icons.diagnostics
				-- 	local ret = (diag.error and icons.Error .. diag.error .. " " or "")
				-- 		.. (diag.warning and icons.Warn .. diag.warning or "")
				-- 	return vim.trim(ret)
				-- end,
				offsets = {
					{
						filetype = "neo-tree",
						text = "Neo-tree",
						highlight = "Directory",
						text_align = "left",
					},
				},
				---@param opts bufferline.IconFetcherOpts
				-- get_element_icon = function(opts)
				-- 	return LazyVim.config.icons.ft[opts.filetype]
				-- end,
			},
		},
		config = function(_, opts)
			require("bufferline").setup(opts)
			-- Fix bufferline when restoring a session
			vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
				callback = function()
					vim.schedule(function()
						pcall(nvim_bufferline)
					end)
				end,
			})
		end,
	},
}
