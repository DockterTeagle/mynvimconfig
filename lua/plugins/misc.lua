return {
	{
		"Civitasv/cmake-tools.nvim",
		init = function()
			local loaded = false
			local function check()
				local cwd = vim.uv.cwd()
				if vim.fn.filereadable(cwd .. "/CMakeLists.txt") == 1 then
					require("lazy").load({ plugins = { "cmake-tools.nvim" } })
					loaded = true
				end
			end
			check()
			vim.api.nvim_create_autocmd("DirChanged", {
				callback = function()
					if not loaded then
						check()
					end
				end,
			})
		end,
		opts = {},
	},
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		opts = require("configs.conform"),
		init = function()
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	},
	{
		"catgoose/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = {
			user_default_options = {
				names = false,
			},
			virtualtext_inline = true,
		},
	},
	{
		"gbprod/yanky.nvim",
		dependencies = {
			{ "kkharji/sqlite.lua" },
		},
		event = { "BufReadPost", "BufNewFile", "BufWritePre" },
		opts = {
			highlight = { timer = 150 },
			ring = { storage = "sqlite" },
		},
		keys = {
			{
				"<leader>p",
				function()
					require("telescope").extensions.yank_history.yank_history()
				end,
				mode = { "n", "x" },
				desc = "open Yank History",
			},
			{ "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank Text" },
			{ "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put Text After Cursor" },
			{ "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put Text Before Cursor" },
			{ "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "Put Text After Selection" },
			{ "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "Put Text Before Selection" },
			{ "[y", "<Plug>(YankyCycleForward)", desc = "Cycle Forward Through Yank History" },
			{ "]y", "<Plug>(YankyCycleBackward)", desc = "Cycle Backward Through Yank History" },
			{ "]p", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put Indented After Cursor (Linewise)" },
			{ "[p", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put Indented Before Cursor (Linewise)" },
			{ "]P", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put Indented After Cursor (Linewise)" },
			{ "[P", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put Indented Before Cursor (Linewise)" },
			{ ">p", "<Plug>(YankyPutIndentAfterShiftRight)", desc = "Put and Indent Right" },
			{ "<p", "<Plug>(YankyPutIndentAfterShiftLeft)", desc = "Put and Indent Left" },
			{ ">P", "<Plug>(YankyPutIndentBeforeShiftRight)", desc = "Put Before and Indent Right" },
			{ "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)", desc = "Put Before and Indent Left" },
			{ "=p", "<Plug>(YankyPutAfterFilter)", desc = "Put After Applying a Filter" },
			{ "=P", "<Plug>(YankyPutBeforeFilter)", desc = "Put Before Applying a Filter" },
		},
	},
	{
		"danymat/neogen",
		cmd = "Neogen",

		opts = {
			snippet_engine = "luasnip",
		},
		-- Uncomment next line if you want to follow only stable versions
		-- version = "*"
	},
	{
		"echasnovski/mini.surround",
		keys = function(_, keys)
			local opts = LazyVim.opts("mini.surround")
			local mappings = {
				{ opts.mappings.add, desc = "Add Surrounding", mode = { "n", "v" } },
				{ opts.mappings.delete, desc = "Delete Surrounding" },
				{ opts.mappings.find, desc = "Find Right Surrounding" },
				{ opts.mappings.find_left, desc = "Find Left Surrounding" },
				{ opts.mappings.highlight, desc = "Highlight Surrounding" },
				{ opts.mappings.replace, desc = "Replace Surrounding" },
				{ opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
			}
			mappings = vim.tbl_filter(function(m)
				return m[1] and #m[1] > 0
			end, mappings)
			return vim.list_extend(mappings, keys)
		end,
		opts = {
			mappings = {
				add = "gsa", -- Add surrounding in Normal and Visual modes
				delete = "gsd", -- Delete surrounding
				find = "gsf", -- Find surrounding (to the right)
				find_left = "gsF", -- Find surrounding (to the left)
				highlight = "gsh", -- Highlight surrounding
				replace = "gsr", -- Replace surrounding
				update_n_lines = "gsn", -- Update `n_lines`
			},
		},
	},
	{
		"echasnovski/mini.icons",
		opts = {
			file = {
				[".keep"] = { glyph = "󰊢", hl = "MiniIconsGrey" },
				["devcontainer.json"] = { glyph = "", hl = "MiniIconsAzure" },
			},
			filetype = {
				dotenv = { glyph = "", hl = "MiniIconsYellow" },
			},
		},
		init = function()
			package.preload["nvim-web-devicons"] = function()
				require("mini.icons").mock_nvim_web_devicons()
				return package.loaded["nvim-web-devicons"]
			end
		end,
	},

	{
		"MagicDuck/grug-far.nvim",
		opts = { headerMaxWidth = 80 },
		cmd = "GrugFar",
		keys = {
			{
				"<leader>sr",
				function()
					local grug = require("grug-far")
					local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
					grug.open({
						transient = true,
						prefills = {
							filesFilter = ext and ext ~= "" and "*." .. ext or nil,
						},
					})
				end,
				mode = { "n", "v" },
				desc = "Search and Replace",
			},
		},
	},
	{
		"echasnovski/mini.ai",
		event = "VeryLazy",
		opts = function()
			local ai = require("mini.ai")
			return {
				n_lines = 500,
				custom_textobjects = {
					o = ai.gen_spec.treesitter({ -- code block
						a = { "@block.outer", "@conditional.outer", "@loop.outer" },
						i = { "@block.inner", "@conditional.inner", "@loop.inner" },
					}),
					f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }), -- function
					c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }), -- class
					t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" }, -- tags
					d = { "%f[%d]%d+" }, -- digits
					e = { -- Word with case
						{
							"%u[%l%d]+%f[^%l%d]",
							"%f[%S][%l%d]+%f[^%l%d]",
							"%f[%P][%l%d]+%f[^%l%d]",
							"^[%l%d]+%f[^%l%d]",
						},
						"^().*()$",
					},
					u = ai.gen_spec.function_call(), -- u for "Usage"
					U = ai.gen_spec.function_call({ name_pattern = "[%w_]" }), -- without dot in function name
				},
			}
		end,
		config = function(_, opts)
			require("mini.ai").setup(opts)
		end,
	},
	{
		"echasnovski/mini.pairs",
		-- version = "*",
		opts = {
			modes = { insert = true, command = true, terminal = false },
			-- skip autopair when next character is one of these
			skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
			-- skip autopair when the cursor is inside these treesitter nodes
			skip_ts = { "string" },
			-- skip autopair when next character is closing pair
			-- and there are more closing pairs than opening pairs
			skip_unbalanced = true,
			-- better deal with markdown code blocks
			markdown = true,
		},
		event = "VeryLazy",
	},
	{
		"folke/ts-comments.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		opts = {
			on_highlights = function(hl, c)
				local prompt = "#2d3149"
				hl.TelescopeNormal = {
					bg = c.bg_dark,
					fg = c.fg_dark,
				}
				hl.TelescopeBorder = {
					bg = c.bg_dark,
					fg = c.bg_dark,
				}
				hl.TelescopePromptNormal = {
					bg = prompt,
				}
				hl.TelescopePromptBorder = {
					bg = prompt,
					fg = prompt,
				}
				hl.TelescopePromptTitle = {
					bg = prompt,
					fg = prompt,
				}
				hl.TelescopePreviewTitle = {
					bg = c.bg_dark,
					fg = c.bg_dark,
				}
				hl.TelescopeResultsTitle = {
					bg = c.bg_dark,
					fg = c.bg_dark,
				}
			end,
			style = "night",
			terminal_colors = true,
			plugins = {
				blink = true,
			},
		},
	},
	{ "akinsho/toggleterm.nvim", version = "*", config = true, lazy = false },
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		init = function()
			vim.g.lualine_laststatus = vim.o.laststatus
			if vim.fn.argc(-1) > 0 then
				-- set an empty statusline till lualine loads
				vim.o.statusline = " "
			else
				-- hide the statusline on the starter page
				vim.o.laststatus = 0
			end
		end,
		opts = require("configs.lualine").lualine_opts(),
		dependencies = { "echasnovski/mini.icons" },
	},
	--
	{
		"nvim-lualine/lualine.nvim",
		opts = function(_, opts)
			-- local trouble = require("trouble")
			-- local symbols = trouble.statusline({
			-- 	mode = "lsp_document_symbols",
			-- 	groups = {},
			-- 	title = false,
			-- 	filter = { range = true },
			-- 	format = "{kind_icon}{symbol.name:Normal}",
			-- 	-- The following line is needed to fix the background color
			-- 	-- Set it to the lualine section you want to use
			-- 	hl_group = "lualine_c_normal",
			-- })
			-- table.insert(opts.sections.lualine_c, {
			-- 	symbols.get,
			-- 	cond = symbols.has,
			-- })
			local x = opts.sections.lualine_x
			for _, comp in ipairs(x) do
				if comp[1] == "diff" then
					comp.source = function()
						local summary = vim.b.minidiff_summary
						return summary
							and {
								added = summary.add,
								modified = summary.change,
								removed = summary.delete,
							}
					end
					break
				end
			end
		end,
	},
	{
		"saghen/blink.cmp",

		lazy = false, -- lazy loading handled internally
		-- optional: provides snippets for the snippet source
		dependencies = {
			"mikavilpas/blink-ripgrep.nvim",
			{
				"L3MON4D3/LuaSnip",
				lazy = false,
				version = "v2.*",
				build = "make install_jsregexp",
				config = function()
					local ls = require("luasnip")
					local opts = require("configs.luasnip")
					ls.config.set_config(opts)
				end,
			},
		},

		build = "nix run .#build-plugin",

		opts = require("configs.blink-cmp"),
		-- allows extending the providers array elsewhere in your config
		-- without having to redefine it
		opts_extend = { "sources.default" },
	},

	{
		--remider that linters happen on file open and on file write
		"mfussenegger/nvim-lint",
		event = "VeryLazy",
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				cmake = { "cmakelint" },
				tex = {
					"lacheck",
				},
				nix = { "statix", "nix" },
				cpp = { "cppcheck", "cpplint" },
				python = { "dmypy" },
				gitcommit = { "commitlint" },
				fish = { "fish" },
				systemd = { "systemd-analyze", "systemdlint" },
				markdown = { "markdownlint" },
			}
			vim.api.nvim_create_autocmd({ "InsertLeave", "BufEnter", "BufWritePre", "BufWritePost" }, {
				callback = function()
					local lint_status = pcall(require, "lint")
					if lint_status then
						lint.try_lint()
					end
				end,
			})
		end,
	},
	{
		"vyfor/cord.nvim",
		build = ":Cord update",
		event = "VeryLazy",
		config = true,
	},
	{
		"grapp-dev/nui-components.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
	},
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = true,
	},
	{
		"smjonas/inc-rename.nvim",
		config = true,
		cmd = "IncRename",
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			{
				"sindrets/diffview.nvim",
				cmd = {
					"DiffviewOpen",
					"DiffviewToggleFiles",
					"DiffviewFocusFiles",
					"DiffviewRefresh",
				},
			},

			-- Only one of these is needed, not both.
			"nvim-telescope/telescope.nvim", -- optional
		},
		cmd = "Neogit",
		config = true,
	},
	{
		"numToStr/Comment.nvim",
		opts = {
			padding = true,
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		version = false,
		config = function()
			local configs = require("nvim-treesitter.configs")
			local opts = require("configs.overrides.treesitter")
			configs.setup(opts)
		end,
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile", "BufWritePre", "VeryLazy" },
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		event = "VeryLazy",
		enabled = true,
		config = function()
			-- If treesitter is already loaded, we need to run config again for textobjects
			-- if LazyVim.is_loaded("nvim-treesitter") then
			-- 	local opts = LazyVim.opts("nvim-treesitter")
			-- 	require("nvim-treesitter.configs").setup({ textobjects = opts.textobjects })
			-- end

			-- When in diff mode, we want to use the default
			-- vim text objects c & C instead of the treesitter ones.
			local move = require("nvim-treesitter.textobjects.move") ---@type table<string,fun(...)>
			local configs = require("nvim-treesitter.configs")
			for name, fn in pairs(move) do
				if name:find("goto") == 1 then
					move[name] = function(q, ...)
						if vim.wo.diff then
							local config = configs.get_module("textobjects.move")[name] ---@type table<string,string>
							for key, query in pairs(config or {}) do
								if q == query and key:find("[%]%[][cC]") then
									vim.cmd("normal! " .. key)
									return
								end
							end
						end
						return fn(q, ...)
					end
				end
			end
		end,
	},
	{
		"kevinhwang91/nvim-ufo",
		opts = {},
		dependencies = {
			"kevinhwang91/promise-async",
			"neovim/nvim-lspconfig",
		},
	},
	{
		"barreiroleo/ltex_extra.nvim",
		branch = "dev",
		ft = { "markdown", "tex" },
		opts = {
			---@type string[]
			-- See https://valentjn.github.io/ltex/supported-languages.html#natural-languages
			load_langs = { "en-US" },
			---@type "none" | "fatal" | "error" | "warn" | "info" | "debug" | "trace"
			log_level = "none",
			---@type string File's path to load.
			-- The setup will normalice it running vim.fs.normalize(path).
			-- e.g. subfolder in project root or cwd: ".ltex"
			-- e.g. cross project settings:  vim.fn.expand("~") .. "/.local/share/ltex"
			path = ".ltex",
		},
	},
	{
		"lowitea/aw-watcher.nvim",
		event = "VeryLazy",
		opts = { -- required, but can be empty table: {}
			-- add any options here
			-- for example:
			-- aw_server = {
			-- 	host = "127.0.0.1",
			-- 	port = 5600,
			-- },
		},
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"xzbdmw/colorful-menu.nvim",
	},
	{
		"stevearc/aerial.nvim",
		event = { "BufReadPost", "BufNewFile", "BufWritePre" },
		--TODO: Integrate rest of lazyvim on this
		opts = function()
			local icons = vim.deepcopy(vim.g.icons)
			icons.lua = { Package = icons.Control }
			local opts = {
				attach_mode = "global",
				backends = { "lsp", "treesitter", "markdown", "man" },
				show_guides = true,
				layout = {
					resize_to_content = false,
					win_opts = {
						winhl = "Normal:NormalFloat,FloatBorder:NormalFloat,SignColumn:SignColumnSB",
						signcolumn = "yes",
						statuscolumn = " ",
					},
				},
				icons = icons,
				-- filter_kind = filter_kind,
				guides = {
					mid_item = "├╴",
					last_item = "└╴",
					nested_top = "│ ",
					whitespace = "  ",
				},
			}
			return opts
		end,
		keys = {
			{
				"<leader>ou",
				"<cmd>AerialToggle<CR>",
				desc = "Aerial Toggle",
			},
		},
	},
	{
		"chrisgrieser/nvim-scissors",
		dependencies = "nvim-telescope/telescope.nvim",
		opts = {
			snippetDir = vim.g.luasnippets_path,
		},
	},
}
