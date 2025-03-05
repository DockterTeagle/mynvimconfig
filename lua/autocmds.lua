vim.api.nvim_create_autocmd("User", {
	pattern = "VimtexEventCompileFailed",
	callback = function()
		vim.cmd([[Trouble qflist open]])
	end,
})
