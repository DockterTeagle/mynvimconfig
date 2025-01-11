vim.keymap.set("n", "<localleader>dpr", function()
	require("dap-python").test_method()
end, { desc = "toggle python test method" })
