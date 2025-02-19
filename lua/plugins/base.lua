return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPost", "BufNewFile", "BufWritePre" },
		opts = function()
			return require("configs.gitsigns")
		end,
	},
	{
		"gitsigns.nvim",
		opts = function()
			Snacks.toggle({
				name = "Git Signs",
				get = function()
					return require("gitsigns.config").config.signcolumn
				end,
				set = function(state)
					require("gitsigns").toggle_signs(state)
				end,
			}):map("<leader>uG")
		end,
	},
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		opts = {
			options = {
				-- close_command = function(n) Snacks.bufdelete(n) end,
				-- right_mouse_command = function(n) Snacks.bufdelete(n) end,
				diagnostics = "nvim_lsp",
				always_show_bufferline = true,
				offsets = {
					{
						filetype = "neo-tree",
						text = "Neo-tree",
						highlight = "Directory",
						text_align = "left",
					},
				},
				---@param opts bufferline.IconFetcherOpts
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
