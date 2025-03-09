local LazyUtil = require("lazy.core.util")
local M = {}
setmetatable(M, {
	__index = function(t, k)
		if LazyUtil[k] then
			return LazyUtil[k]
		end
		t[k] = require("util." .. k)
		return t[k]
	end,
})
function M.get_plugin(name)
	return require("lazy.core.config").spec.plugins[name]
end
function M.opts(name)
	local plugin = M.get_plugin(name)
	if not plugin then
		return {}
	end
	local Plugin = require("lazy.core.plugin")
	return Plugin.values(plugin, "opts", false)
end
function M.is_loaded(name)
	local Config = require("lazy.core.config")
	return Config.plugins[name] and Config.plugins[name]._.loaded
end
function M.dedup(list)
	local ret = {}
	local seen = {}
	for _, v in ipairs(list) do
		if not seen[v] then
			table.insert(ret, v)
			seen[v] = true
		end
	end
	return ret
end
function M.load_all(directory, module_prefix)
	local plugins = {}

	-- Recursive function to scan directories
	local function scan(dir, prefix)
		local scandir = vim.loop.fs_scandir(dir)
		if not scandir then
			return
		end

		for name, entry_type in
			function()
				return vim.loop.fs_scandir_next(scandir)
			end
		do
			local full_path = dir .. "/" .. name
			local module_name = prefix .. "." .. name:gsub("%.lua$", "")

			if entry_type == "file" and name:match("%.lua$") then
				-- Regular file: Load as a module
				local success, module = pcall(require, module_name)
				if success and type(module) == "table" then
					table.insert(plugins, module)
				else
					vim.notify("Failed to load plugin config: " .. module_name, vim.log.levels.ERROR)
				end
			elseif entry_type == "directory" then
				-- Check for `init.lua` in the directory
				local init_path = full_path .. "/init.lua"
				local init_module_name = module_name
				if vim.loop.fs_stat(init_path) then
					-- If `init.lua` exists, load the directory as a module
					local success, module = pcall(require, init_module_name)
					if success and type(module) == "table" then
						table.insert(plugins, module)
					else
						vim.notify("Failed to load module: " .. init_module_name, vim.log.levels.ERROR)
					end
				else
					-- If no `init.lua`, recursively scan subdirectories
					scan(full_path, module_name)
				end
			end
		end
	end

	-- Start scanning from the given directory
	scan(directory, module_prefix)
	return plugins
end
function M.get_pkg_path(pkg, path, opts)
	pcall(require, "mason") -- make sure Mason is loaded. Will fail when generating docs
	local root = vim.env.MASON or (vim.fn.stdpath("data") .. "/mason")
	opts = opts or {}
	opts.warn = opts.warn == nil and true or opts.warn
	path = path or ""
	local ret = root .. "/packages/" .. pkg .. "/" .. path
	if opts.warn and not vim.loop.fs_stat(ret) and not require("lazy.core.config").headless() then
		M.warn(
			("Mason package path not found for **%s**:\n- `%s`\nYou may need to force update the package."):format(
				pkg,
				path
			)
		)
	end
	return ret
end

return M
