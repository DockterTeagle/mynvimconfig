local opt = vim.opt
local o = vim.o

-------------------------------------- options ------------------------------------------
-- o.conceallevel = 2
-- o.concealcursor = "nc"
o.laststatus = 3
o.showmode = false

o.cursorline = true
o.cursorlineopt = "number"

-- Indenting
o.expandtab = true
opt.shiftround = true
opt.termguicolors = true
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

opt.laststatus = 3
opt.splitkeep = "screen"
o.foldcolumn = "1"
o.foldlevel = 99
-- o.foldlevelstart = 99
opt.inccommand = "split"
o.foldenable = true
-- opt.statuscolumn = [[!v:lua.require'snacks.statuscolumn'.get()]]
opt.completeopt = "menu,menuone,noselect"
opt.smoothscroll = true
opt.fillchars = { foldopen = "", foldclose = "", fold = " ", foldsep = " ", diff = "╱", eob = " " }
-- opt.foldexpr = "v:lua.LazyVim.ui.foldexpr()"
-- opt.foldmethod = "expr"
