require("globals")
-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	local repo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

require("options")
require("lazy").setup({
	import = "plugins",
}, require("configs.lazy"))
vim.schedule(function()
	require("mappings")
end)
vim.cmd([[colorscheme tokyonight]])
