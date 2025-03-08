return {
	{
		"lawrence-laz/neotest-zig",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = { ensure_installed = { "zig" } },
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
