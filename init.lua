require("globals")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	local repo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

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
vim.lsp.config("*", {
	on_attach = require("configs.lsp.lspconfigDefaults").on_attach,
})
