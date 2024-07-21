vim.g.base46_cache = vim.fn.stdpath("data") .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	local repo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require("configs.lazy")
local overrides = require("configs.overrides")
vim.g.isNixOS = os.execute("test -e /etc/nixos")
if not vim.g.isNixOS then
	require("lazy").setup({
		{
			"NvChad/NvChad",
			lazy = false,
			branch = "v2.5",

			import = "nvchad.plugins",

			config = function()
				require("options")
			end,
		},
		{
			"williamboman/mason.nvim",
			opts = overrides.mason,
		},
		{
			"jay-babu/mason-nvim-dap.nvim",
			ft = { "c", "cpp", "rust" },
			dependencies = {
				"williamboman/mason.nvim",
				"mfussenegger/nvim-dap",
			},
			opts = {
				handlers = {},
			},
		},

		{ import = "plugins" },
	}, lazy_config)
elseif vim.g.isNixOS then
	-- load plugins
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
end
-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")
require("nvchad.autocmds")
vim.schedule(function()
	require("mappings")
end)
-- require("NUIComponentsProjects.spectreImprovement.main")
