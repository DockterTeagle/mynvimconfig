return {
	defaults = { lazy = true },

	rocks = {
		enabled = false,
	},
	checker = {
		enabled = true,
		notify = false,
	},
	-- ui = {
	-- 	icons = {
	-- 		ft = "",
	-- 		lazy = "󰂠 ",
	-- 		loaded = "",
	-- 		not_loaded = "",
	-- 	},
	-- },

	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
}
