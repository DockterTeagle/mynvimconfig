require("nvchad.autocmds")
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		local linters = require("lint").get_running()
		if #linters == 0 then
			return "󰦕"
		end
		return "󱉶 " .. table.concat(linters, ", ")
	end,
})
