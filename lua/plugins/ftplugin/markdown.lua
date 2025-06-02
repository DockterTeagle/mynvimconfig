return {

	{
		"OXY2DEV/markview.nvim",
		lazy = false,
		branch = "dev",
		opts = {
			icon_provider = "mini",
			preview = {
				filetypes = {
					"markdown",
					"rmd",
					"quarto",
					-- "tex",
					"rmd",
					"typst",
				},
			},
			latex = {
				enable = false,
			},
		},
		dependencies = {
			"saghen/blink.cmp",
		},
	},
	{
		"jmbuhr/otter.nvim",
		ft = {
			"markdown",
			"nix",
		},
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			-- verbose = {
			-- 	no_code_found = true,
			-- },
		},
	},
	{
		"obsidian-nvim/obsidian.nvim",
		event = {
			"BufReadPre /home/cdockter/Documents/Obsidian/main/*.md",
			"BufNewFile /home/cdockter/Documents/Obsidian/main/*.md",
		},
		dependencies = {
			-- Required.
			"nvim-lua/plenary.nvim",
			"folke/snacks.nvim",
			-- see above for full list of optional dependencies ☝️
			"nvim-treesitter/nvim-treesitter",
			"OXY2DEV/markview.nvim",
		},
		---@module 'obsidian'
		---@type obsidian.config.ClientOpts
		opts = {
			notes_subdir = "notes",
			-- note_id_func = function(title)
			-- 	local suffix = ""
			-- 	if title == nil then
			-- 		title = tostring(os.date("%Y-%m-%d"))
			-- 	else
			-- 		title = title:gsub(" ", "_")
			-- 		title = title:gsub("[^A-Za-z0-9_]", "")
			-- 	end
			-- end,
			open = {
				use_advanced_uri = true,
			},
			daily_notes = {
				folder = "notes/dailies",
			},
			templates = {
				folder = "templates",
				date_format = "%Y-%m-%d",
				time_format = "%H:%M",
				-- A map for custom variables, the key should be the variable and the value a function
				substitutions = {
					created = function()
						return os.date("%Y-%m-%d")
					end,
					updated = function()
						return os.date("%Y-%m-%d")
					end,
					id = function()
						-- get full path of current buffer
						local filename = vim.api.nvim_buf_get_name(0)
						-- extract file name without path
						filename = filename:match("^.+/(.+)$") or filename
						-- remove the .md extension
						return filename:gsub("%.md$", "")
					end,
				},
			},
			note_frontmatter_func = function(note)
				if note.title then
					note:add_alias(note.title)
				end
				local out = { id = note.id, aliases = note.aliases, tags = note.tags }
				-- `note.metadata` contains any manually added fields in the frontmatter.
				-- So here we just make sure those fields are kept in the frontmatter.
				if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
					for k, v in pairs(note.metadata) do
						out[k] = v
					end
				end

				return out
			end,
			mappings = {
				["gf"] = {
					action = function()
						return require("obsidian").util.gf_passthrough()
					end,
					opts = { noremap = false, expr = true, buffer = true },
				},
				-- Toggle check-boxes.
				["<leader>ch"] = {
					action = function()
						return require("obsidian").util.toggle_checkbox()
					end,
					opts = { buffer = true },
				},
				-- Smart action depending on context: follow link, show notes with tag, toggle checkbox, or toggle heading fold
				["<cr>"] = {
					action = function()
						return require("obsidian").util.smart_action()
					end,
					opts = { buffer = true, expr = true },
				},
				["<leader>ff"] = {
					action = function()
						return vim.cmd([[Obsidian search]])
					end,
				},
				["<leader>ft"] = {
					action = function()
						return vim.cmd([[Obsidian tags]])
					end,
				},
				["<leader>fF"] = {
					action = function()
						return vim.cmd([[Obsidian quick_switch]])
					end,
				},
			},
			picker = {
				name = "snacks.pick",
			},
			completion = {
				nvim_cmp = false,
				blink = true,
			},
			workspaces = {
				{ name = "main", path = "~/Documents/Obsidian/main" },
			},
		},
	},
}
