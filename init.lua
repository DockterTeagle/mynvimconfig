require("globals")
-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	local repo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

_G.LazyVim = require("util")
require("lazy").setup({
	LazyVim.load_all(vim.fn.stdpath("config") .. "/lua/plugins", "plugins"),
}, require("configs.lazy"))
vim.schedule(function()
	require("mappings")
end)
require("options")
require("autocmds")
vim.cmd([[colorscheme tokyonight]])
