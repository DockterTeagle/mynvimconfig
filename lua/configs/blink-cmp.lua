local M = {
	-- 'default' for mappings similar to built-in completion
	-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
	-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
	-- see the "default configuration" section below for full documentation on how to define
	-- your own keymap.

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	completion = {
		ghost_text = {
			enabled = true,
		},
		documentation = { auto_show = true, auto_show_delay_ms = 500 },
		menu = {
			draw = {
				components = {
					label = {
						text = function(ctx)
							return require("colorful-menu").blink_components_text(ctx)
						end,
						highlight = function(ctx)
							return require("colorful-menu").blink_components_highlight(ctx)
						end,
					},
					kind_icon = {
						ellipsis = false,
						text = function(ctx)
							local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
							return kind_icon
						end,
						-- Optionally, you may also use the highlights from mini.icons
						highlight = function(ctx)
							local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
							return hl
						end,
					},
				},
				treesitter = {
					"lsp",
				},
			},
		},
		accept = {
			-- auto_brackets = {
			-- 	enabled = true,
			-- },
		},
	},
	keymap = {
		["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
		["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
		["<CR>"] = { "accept", "fallback" },
		["<C-e>"] = { "hide" },
		["<Up>"] = { "select_prev", "fallback" },
		["<Down>"] = { "select_next", "fallback" },
		["<S-CR>"] = {
			function(cmp)
				require("blink.cmp").cancel()
			end,
			"fallback",
		},
	},
	snippets = {
		preset = "luasnip",
	},
	appearance = {

		-- Sets the fallback highlight groups to nvim-cmp's highlight groups
		-- Useful for when your theme doesn't support blink.cmp
		-- will be removed in a future release
		-- use_nvim_cmp_as_default = true,
		-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
		-- Adjusts spacing to ensure icons are aligned
		nerd_font_variant = "mono",
	},

	-- default list of enabled providers defined so that you can extend it
	-- elsewhere in your config, without redefining it, via `opts_extend`
	sources = {
		providers = {
			dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },

			conventional_commits = {
				name = "Conventional Commits",
				module = "blink-cmp-conventional-commits",
				enabled = function()
					return vim.bo.filetype == "gitcommit"
				end,
				---@module 'blink-cmp-conventional-commits'
				---@type blink-cmp-conventional-commits.Options
				opts = {}, -- none so far
			},
			git = {
				module = "blink-cmp-git",
				name = "Git",
				enabled = function()
					return vim.tbl_contains({ "octo", "gitcommit", "markdown" }, vim.bo.filetype)
				end,
				opts = {
					-- options for the blink-cmp-git
				},
			},
			lazydev = {
				name = "LazyDev",
				module = "lazydev.integrations.blink",
				score_offset = 100,
			},
			snippets = {
				opts = {
					show_autosnippets = false,
				},
			},
		},
		default = { "git", "snippets", "lsp", "path" },
		per_filetype = {
			sql = { "snippets", "lsp", "path", "dadbod", "buffer" },
			lua = { "snippets", "lsp", "path", "lazydev" },
			gitcommit = { "snippets", "lsp", "path", "conventional_commits" },
		},
		-- optionally disable cmdline completions
	},
	cmdline = { enabled = false },

	-- experimental signature help support
	signature = {
		enabled = true,
		trigger = {
			blocked_trigger_characters = {},
			blocked_retrigger_characters = {},
			-- When true, will show the signature help window when the cursor comes after a trigger character when entering insert mode
			show_on_insert_on_trigger_character = true,
		},
		window = {
			min_width = 1,
			max_width = 100,
			max_height = 10,
			border = "padded",
			winblend = 0,
			winhighlight = "Normal:BlinkCmpSignatureHelp,FloatBorder:BlinkCmpSignatureHelpBorder",
			scrollbar = false, -- Note that the gutter will be disabled when border ~= 'none'
			-- Which directions to show the window,
			-- falling back to the next direction when there's not enough space,
			-- or another window is in the way
			direction_priority = { "n", "s" },
			-- Disable if you run into performance issues
			treesitter_highlighting = true,
		},
	},
}
return M
