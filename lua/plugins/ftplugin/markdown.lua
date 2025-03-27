return {
	{
		"mfussenegger/nvim-lint",
		optional = true,
		opts = {
			linters_by_ft = {
				markdown = { "markdownlint-cli2" },
			},
		},
	},
	-- {
	-- 	"stevearc/conform.nvim",
	-- 	opts = {
	-- 		formatters = {
	--
	-- 			-- ["markdown-toc"] = {
	-- 			-- 	condition = function(_, ctx)
	-- 			-- 		for _, line in ipairs(vim.api.nvim_buf_get_lines(ctx.buf, 0, -1, false)) do
	-- 			-- 			if line:find("<!%-%- toc %-%->") then
	-- 			-- 				return true
	-- 			-- 			end
	-- 			-- 		end
	-- 			-- 	end,
	-- 			-- },
	-- 			-- ["markdownlint-cli2"] = {
	-- 			-- 	condition = function(_, ctx)
	-- 			-- 		local diag = vim.tbl_filter(function(d)
	-- 			-- 			return d.source == "markdownlint"
	-- 			-- 		end, vim.diagnostic.get(ctx.buf))
	-- 			-- 		return #diag > 0
	-- 			-- 	end,
	-- 			-- },
	-- 		},
	-- 		formatters_by_ft = {
	-- 			-- ["markdown"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
	-- 			-- ["markdown.mdx"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
	-- 			["markdown"] = { "prettier", "markdownlint-cli2" },
	-- 			["markdown.mdx"] = { "prettier", "markdownlint-cli2" },
	-- 		},
	-- 	},
	-- },
	{
		--TODO: get me to work on nixos
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = function()
			require("lazy").load({ plugins = { "markdown-preview.nvim" } })
			vim.fn["mkdp#util#install"]()
		end,
		keys = {
			{
				"<localleader>cp",
				ft = "markdown",
				"<cmd>MarkdownPreviewToggle<cr>",
				desc = "Markdown Preview",
			},
		},
		config = function()
			vim.cmd([[do FileType]])
		end,
	},

	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" }, -- if you use standalone mini plugins
		---@module 'render-markdown'
		---@type render.md.UserConfig
		ft = { "markdown", "norg", "rmd", "org", "codecompanion" },
		opts = {
			code = {
				sign = false,
				width = "block",
				right_pad = 1,
			},
			heading = {
				sign = false,
				icons = {},
			},
			checkbox = {
				enabled = false,
			},
		},
		config = function(_, opts)
			require("render-markdown").setup(opts)
		end,
	},
}
