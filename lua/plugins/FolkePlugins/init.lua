local plugins = {}
local plugin_dir = vim.fn.stdpath("config") .. "/lua/plugins/FolkePlugins/"

-- Loop through all Lua files in the directory
for _, file in ipairs(vim.fn.glob(plugin_dir .. "*.lua", false, true)) do
	local plugin_name = file:match("([^/]+)%.lua$")
	if plugin_name and plugin_name ~= "init" then
		table.insert(plugins, require("plugins.FolkePlugins." .. plugin_name))
	end
end

return plugins
