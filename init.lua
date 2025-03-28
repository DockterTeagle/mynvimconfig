require("globals")
-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	local repo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

vim.lsp.enable({
	"clangd",
	"luals",
	"nixd",
	-- "ruff",
	-- "basedpyright",
	-- "baconls",
	-- "bashls",
	-- "deno",
	-- "hyprls",
	"ltexplus",
	"marksman",
	-- "matlabls",
	-- "neocmake",
	-- "texlab",
	-- "zls",
})
require("options")
_G.LazyVim = require("util")
require("lazy").setup({
	{ import = "plugins.general" },
	{ import = "plugins.ftplugin" },
}, require("configs.lazy"))
vim.schedule(function()
	require("mappings")
end)
vim.schedule(function()
	require("autocmds")
end)
