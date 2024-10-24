require("nvchad.options")
-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
vim.g.lua_snippets_path = vim.fn.stdpath("config") .. "/lua/LuaSnip"
local enable_providers = {
	"python3_provider",
	-- and so on
}

vim.g.markdown_fenced_languages = {
	"ts=typescript",
}
for _, plugin in pairs(enable_providers) do
	vim.g["loaded_" .. plugin] = nil
	vim.cmd("runtime " .. plugin)
end
