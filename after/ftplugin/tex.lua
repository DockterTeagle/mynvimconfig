local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set(
	"n",
	"<localleader>vc",
	"<CMD>VimtexCompile<CR>",
	{ desc = "Start the VimtexC compiler", buffer = bufnr }
)
