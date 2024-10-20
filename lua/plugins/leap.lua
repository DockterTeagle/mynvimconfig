return {
	-- {
	--   "ggandor/leap.nvim",
	--   dependencies = {
	--     "tpope/vim-repeat",
	--   },
	--   keys = {
	--     { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
	--     { "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
	--     { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
	--   },
	--   config = function(_, opts)
	--     local leap = require "leap"
	--     for k, v in pairs(opts) do
	--       leap.opts[k] = v
	--     end
	--     leap.add_default_mappings()
	--     vim.keymap.del({ "x", "o" }, "x")
	--     vim.keymap.del({ "x", "o" }, "X")
	--   end,
	-- },
	{
		"ggandor/leap-spooky.nvim",
		dependencies = { "ggandor/leap.nvim" },
		event = "VeryLazy",
		config = function()
			require("leap-spooky").setup()
		end,
	},
}
