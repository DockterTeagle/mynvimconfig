vim.g.base46_cache = vim.fn.stdpath("data") .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
	local repo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require("configs.lazy")
local overrides = require("configs.overrides")
require("lazy").setup({
	{
		"NvChad/NvChad",
		lazy = false,
		branch = "v2.5",

		config = function()
			require("options")
		end,
	},
	{
		"williamboman/mason.nvim",
		enabled = false,
	},

	{ import = "plugins" },
}, lazy_config)
-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")
require("autocmds")
vim.schedule(function()
	require("mappings")
end)
-- require("NUIComponentsProjects.spectreImprovement.main")
