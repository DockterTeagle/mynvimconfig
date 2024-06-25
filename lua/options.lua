require("nvchad.options")

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
vim.g.lua_snippets_path = vim.fn.stdpath("config") .. "/lua/LuaSnip"
local enable_providers = {
	"python3_provider",
	-- and so on
}

for _, plugin in pairs(enable_providers) do
	vim.g["loaded_" .. plugin] = nil
	vim.cmd("runtime " .. plugin)
end
vim.g.jukit_mappings = 0
-- vim.api.nvim_exec(
-- 	[[
--     autocmd FileType tex setlocal textwidth=80 formatoptionis+=w
--    ]],
-- 	false
-- )
