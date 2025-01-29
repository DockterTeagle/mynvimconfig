vim.keymap.set(
	"n",
	"<localleader>ch",
	"<cmd>ClangdSwitchSourceHeader<cr>",
	{ desc = "Switch Source/Header", buffer = true }
)
vim.keymap.set("n", "<localleader><F6>", "<CMD>CompilerOpen", { desc = "open the compiler", buffer = true })
