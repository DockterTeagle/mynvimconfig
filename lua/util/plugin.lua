-- local Plugin = require("lazy.core.plugin")
local M = {}
function M.setup()
	-- M.fix_imports()
	-- M.fix_renames()
	M.lazy_file()
	table.insert(package.loaders, function(module)
		if M.deprecated_modules[module] then
			return function() end
		end
	end)
end
M.lazy_file_events = { "BufReadPost", "BufNewFile", "BufWritePre" }
function M.lazy_file()
	-- Add support for the LazyFile event
	local Event = require("lazy.core.handler.event")

	Event.mappings.LazyFile = { id = "LazyFile", event = M.lazy_file_events }
	Event.mappings["User LazyFile"] = Event.mappings.LazyFile
end
return M
