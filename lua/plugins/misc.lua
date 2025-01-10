return {
	{
		"Civitasv/cmake-tools.nvim",
		lazy = true,
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
		lazy = false,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	{
		"danymat/neogen",
		opts = {
			snippet_engine = "luasnip",
		},
		-- Uncomment next line if you want to follow only stable versions
		-- version = "*"
	},
	{
		"echasnovski/mini.surround",
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
	-- {
	-- 	"echasnovski/mini.ai",
	-- 	event = "VeryLazy",
	-- 	opts = function()
	-- 		local ai = require("mini.ai")
	-- 		return {
	-- 			n_lines = 500,
	-- 			custom_textobjects = {
	-- 				o = ai.gen_spec.treesitter({ -- code block
	-- 					a = { "@block.outer", "@conditional.outer", "@loop.outer" },
	-- 					i = { "@block.inner", "@conditional.inner", "@loop.inner" },
	-- 				}),
	-- 				f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }), -- function
	-- 				c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }), -- class
	-- 				t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" }, -- tags
	-- 				d = { "%f[%d]%d+" }, -- digits
	-- 				e = { -- Word with case
	-- 					{
	-- 						"%u[%l%d]+%f[^%l%d]",
	-- 						"%f[%S][%l%d]+%f[^%l%d]",
	-- 						"%f[%P][%l%d]+%f[^%l%d]",
	-- 						"^[%l%d]+%f[^%l%d]",
	-- 					},
	-- 					"^().*()$",
	-- 				},
	-- 				g = LazyVim.mini.ai_buffer, -- buffer
	-- 				u = ai.gen_spec.function_call(), -- u for "Usage"
	-- 				U = ai.gen_spec.function_call({ name_pattern = "[%w_]" }), -- without dot in function name
	-- 			},
	-- 		}
	-- 	end,
	-- 	config = function(_, opts)
	-- 		require("mini.ai").setup(opts)
	-- 		LazyVim.on_load("which-key.nvim", function()
	-- 			vim.schedule(function()
	-- 				LazyVim.mini.ai_whichkey(opts)
	-- 			end)
	-- 		end)
	-- 	end,
	-- },
	{
		"echasnovski/mini.pairs",
		version = "*",
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
		lazy = false,
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
	-- {
	-- 	function()
	-- 		local icon = "" -- Icon to display when LSP is active
	-- 		local clients = vim.lsp.get_clients({ bufnr = 0 }) -- Get LSP clients for the current buffer
	-- 		if next(clients) == nil then
	-- 			return "" -- No LSP active, return empty string
	-- 		end
	--
	-- 		local names = {}
	-- 		for _, client in ipairs(clients) do
	-- 			table.insert(names, client.name)
	-- 		end
	-- 		return icon .. " " .. table.concat(names, ", ")
	-- 	end,
	-- 	icon = "", -- No need to set the icon again; it's part of the function
	-- 	color = { fg = "#98be65", gui = "bold" }, -- Customize colors as needed
	-- },
	-- {
	-- 	function()
	-- 		local linters = require("lint").get_running()
	-- 		if #linters == 0 then
	-- 			return ""
	-- 		end
	-- 		local linter_names = {}
	-- 		for _, linter_id in ipairs(linters) do
	-- 			table.insert(linter_names, linter_id) -- Use linter_id directly or map to names
	-- 		end
	--
	-- 		return "󱉶 " .. table.concat(linter_names, ", ")
	-- 	end,
	-- 	icon = "", -- No need to set the icon again; it's part of the function
	-- 	color = { fg = "#98be65", gui = "bold" }, -- Customize colors as needed
	-- },
	-- {
	-- 	"diagnostics",
	-- 	symbols = {
	-- 		error = icons.diagnostics.Error,
	-- 		warn = icons.diagnostics.Warn,
	-- 		info = icons.diagnostics.Info,
	-- 		hint = icons.diagnostics.Hint,
	-- 	},
	-- },
	-- { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
	-- {
	-- 	"aerial",
	-- 	sep = " ", -- separator between symbols
	-- 	sep_icon = "", -- separator between icon and symbol
	--
	-- 	-- The number of symbols to render top-down. In order to render only 'N' last
	-- 	-- symbols, negative numbers may be supplied. For instance, 'depth = -1' can
	-- 	-- be used in order to render only current symbol.
	-- 	depth = 5,
	--
	-- 	-- When 'dense' mode is on, icons are not rendered near their symbols. Only
	-- 	-- a single icon that represents the kind of current symbol is rendered at
	-- 	-- the beginning of status line.
	-- 	dense = false,
	--
	-- 	-- The separator to be used to separate symbols in dense mode.
	-- 	dense_sep = ".",
	--
	-- 	-- Color the symbol icons.
	-- 	colored = true,
	-- },
	--
	{
		"nvim-lualine/lualine.nvim",
		opts = function(_, opts)
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

		-- version = "*",
		lazy = false, -- lazy loading handled internally
		-- optional: provides snippets for the snippet source
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				version = "v2.*",
				build = "make install_jsregexp",
				opts = {
					history = true,
					updateevents = "TextChanged,TextChangedI",
					enable_autosnippets = true,
					store_selection_keys = "<Tab>",
				},
				config = function()
					local ls = require("luasnip")
					local opts = require("configs.luasnip")
					ls.config.set_config({ opts })
				end,
			},
		},

		-- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- If you use nix, you can build from source using latest nightly rust with:
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
			lint.linters.luacheck.args = {
				-- "--config=./",
			}
			lint.linters_by_ft = {
				-- markdown = { "vale" },
				cmake = { "cmakelint" },
				-- lua = { "selene" },
				tex = { "write_good" },
				-- nix = { "deadnix", "nix" }, currently deadnix is just duplicating the nixd errors
				-- nix = { "statix" },
				cpp = { "cppcheck", "cpplint" },
				git = { "gitlint" },
				lua = { "luacheck", "luac" },
				-- lua = { "luac" },
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
		"junegunn/vim-easy-align",
		lazy = false,
	},
	{
		"vyfor/cord.nvim",
		branch = "client-server",
		build = ":Cord fetch",
		event = "VeryLazy",
		config = true,
	},
	{
		"stevearc/aerial.nvim",
		cmd = { "AerialToggle", "AerialOpen" },
		keys = {
			{
				"<leader>ou",
				"<cmd>AerialToggle!<CR>",
				desc = "Toggle outline using aerial",
			},
		},
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
		-- Optional dependencies
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"echasnovski/mini.icons",
		},
	},
	{
		"echasnovski/mini.diff",
		event = "VeryLazy",
		keys = {
			{
				"<leader>go",
				function()
					require("mini.diff").toggle_overlay(0)
				end,
				desc = "Toggle mini.diff overlay",
			},
		},
		opts = {
			view = {
				style = "sign",
				signs = {
					add = "▎",
					change = "▎",
					delete = "",
				},
			},
		},
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
		event = "VeryLazy",
	},
	require("plugins.FolkePlugins.folkePlugins"),
}
