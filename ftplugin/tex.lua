-- Enable spell checking only for LaTeX files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "tex",
	callback = function()
		vim.opt_local.spell = true
		vim.opt_local.spelllang = "en_us"
	end,
})
-- Swap gj and j mappings only for LaTeX files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "tex",
	callback = function()
		-- Remap 'j' to 'gj' in normal mode
		vim.api.nvim_buf_set_keymap(0, "n", "j", "gj", { noremap = true, silent = true })
		-- Remap 'gj' to 'j' in normal mode
		vim.api.nvim_buf_set_keymap(0, "n", "gj", "j", { noremap = true, silent = true })
	end,
})
