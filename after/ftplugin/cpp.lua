vim.lsp.enable("clangd")
vim.keymap.set(
	"n",
	"<localleader>ch",
	"<cmd>ClangdSwitchSourceHeader<cr>",
	{ desc = "Switch Source/Header", buffer = true }
)
