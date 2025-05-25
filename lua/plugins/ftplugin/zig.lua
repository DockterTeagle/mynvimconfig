return {
	{
		"lawrence-laz/neotest-zig",
	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			"lawrence-laz/neotest-zig",
		},
		opts = {
			adapters = {
				["neotest-zig"] = {},
			},
		},
	},
}
