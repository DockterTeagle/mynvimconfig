return {
	"stevearc/oil.nvim",
	opts = {
		default_file_explorer = true,
		delete_to_trash = true,
		view_options = {
			show_hidden = true,
			natural_order = true,
			is_always_hidden = function(name, _)
				return name == ".." or name == ".git"
			end,
		},
		win_options = {
			wrap = true,
		},
		keymaps = {
			gs = {
				callback = function()
					local oil = require("oil")
					-- get the current directory
					local prefills = { paths = oil.get_current_dir() }

					local grug_far = require("grug-far")
					-- instance check
					if not grug_far.has_instance("explorer") then
						grug_far.open({
							instanceName = "explorer",
							prefills = prefills,
							staticTitle = "Find and Replace from Explorer",
						})
					else
						grug_far.open_instance("explorer")
						-- updating the prefills without clearing the search and other fields
						grug_far.update_instance_prefills("explorer", prefills, false)
					end
				end,
				desc = "oil: Search in directory",
			},
		},
	},
	cmd = { "Oil" },
	dependencies = {
		"echasnovski/mini.icons",
	},
}
