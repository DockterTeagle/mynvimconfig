local opt = vim.opt
local o = vim.o

-------------------------------------- options ------------------------------------------
o.laststatus = 3
o.showmode = false

o.cursorline = true
o.cursorlineopt = "number"

-- Indenting
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

opt.fillchars = { eob = " " }
o.ignorecase = true
o.smartcase = true
o.mouse = "a"

-- Numbers
o.number = true
o.numberwidth = 2
o.ruler = false

-- disable nvim intro
opt.shortmess:append("sI")

o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.timeoutlen = 400
o.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
o.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>[]hl")

-- disable some default providers

vim.g.lua_snippets_path = vim.fn.stdpath("config") .. "/lua/LuaSnip"

opt.laststatus = 3
opt.splitkeep = "screen"
vim.g.markdown_fenced_languages = {
	"ts=typescript",
}
vim.env.CC = os.getenv("CC")
vim.env.CXX = os.getenv("CXX")
