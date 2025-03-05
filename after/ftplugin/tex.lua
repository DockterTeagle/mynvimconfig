-- Enable spell checking only for LaTeX files
-- vim.opt_local.spell = true
-- vim.opt_local.spelllang = "en_us"
-- Swap gj and j mappings only for LaTeX files
-- Remap 'j' to 'gj' in normal mode
vim.api.nvim_buf_set_keymap(0, "n", "j", "gj", { noremap = true, silent = true })
-- Remap 'gj' to 'j' in normal mode
vim.api.nvim_buf_set_keymap(0, "n", "gj", "j", { noremap = true, silent = true })
vim.api.nvim_buf_set_keymap(0, "n", "gk", "k", { noremap = true, silent = true })
vim.api.nvim_buf_set_keymap(0, "n", "k", "gk", { noremap = true, silent = true })
vim.keymap.set("n", "<localleader>k", "<plug>(vimtex-doc-package)", { desc = "open vimtex Docs" })
