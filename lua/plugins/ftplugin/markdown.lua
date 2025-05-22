return {
	{
		"mfussenegger/nvim-lint",
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
	-- ["markdown-toc"] = {
	-- 	condition = function(_, ctx)
	-- 		for _, line in ipairs(vim.api.nvim_buf_get_lines(ctx.buf, 0, -1, false)) do
	-- 			if line:find("<!%-%- toc %-%->") then
	-- 				return true
	-- 			end
	-- 		end
	-- 	end,
	-- },
	-- ["markdownlint-cli2"] = {
	-- 	condition = function(_, ctx)
	-- 		local diag = vim.tbl_filter(function(d)
	-- 			return d.source == "markdownlint"
	-- 		end, vim.diagnostic.get(ctx.buf))
	-- 		return #diag > 0
	-- 	end,
	-- },
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
		"OXY2DEV/markview.nvim",
		lazy = false,
		branch = "dev",
		opts = {
			icon_provider = "mini",
			latex = {
				enable = true,
			},
		},
		-- dependencies = {
		-- 	"saghen/blink.cmp",
		-- },
	},
	{
		"obsidian-nvim/obsidian.nvim",
		event = {
			"BufReadPre /home/cdockter/Documents/main/*.md",
			"BufNewFile /home/cdockter/Documents/main/*.md",
		},
		dependencies = {
			-- Required.
			"nvim-lua/plenary.nvim",
			"folke/snacks.nvim",
			-- see above for full list of optional dependencies ☝️
			"saghen/blink.cmp",
			"nvim-treesitter/nvim-treesitter",
			"OXY2DEV/markview.nvim",
		},
		---@module 'obsidian'
		---@type obsidian.config.ClientOpts
		opts = {
			picker = {
				name = "snacks.pick",
			},
			completion = {
				nvim_cmp = false,
				blink = true,
			},
			workspaces = {
				{ name = "main", path = "~/Documents/main" },
			},
		},
	},
}
