return {
	defaults = { lazy = true },

	rocks = {
		enabled = false,
	},
	checker = {
		enabled = false,
		-- notify = true,
	},
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
