return {
	{
		"theHamsta/nvim-dap-virtual-text",
		cmd = "DapContinue",
		config = function()
			require("nvim-dap-virtual-text").setup()
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		cmd = "DapContinue",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			dap.adapters.lldb = {
				type = "executable",
				command = "/home/cdockter/.nix-profile/bin/lldb-dap",
				name = "lldb",
			}
			dap.configurations.sh = {
				{
					type = "bashdb",
					request = "launch",
					name = "Launch file",
					showDebugOutput = true,
					pathBashdb = vim.fn.stdpath("data")
						.. "/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb",
					pathBashdbLib = vim.fn.stdpath("data") .. "/mason/packages/bash-debug-adapter/extension/bashdb_dir",
					trace = true,
					file = "${file}",
					program = "${file}",
					cwd = "${workspaceFolder}",
					pathCat = "cat",
					pathBash = "/bin/bash",
					pathMkfifo = "mkfifo",
					args = {},
					env = {},
					terminalKind = "integrated",
				},
			}
			dap.configurations.lua = {
				{
					type = "nlua",
					request = "attach",
					name = "Attach to running Neovim instance",
				},
			}
			dap.adapters.nlua = function(callback, config)
				callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
				--Tcausing dap to not load for nvim-lua
			end
		end,
	},
	-- {
	-- 	"mfussenegger/nvim-dap-python",
	-- 	ft = "python",
	-- 	dependencies = {
	-- 		"mfussenegger/nvim-dap",
	-- 		"rcarriga/nvim-dap-ui",
	-- 	},
	-- 	config = function()
	-- 		-- local path = "~/miniconda3/lib/python3.11/site-packages/debugpy"
	-- 		local path = "~/.local/share/nvchad/mason/packages/debugpy/venv/bin/python"
	-- 		require("dap-python").setup(path)
	-- 	end,
	-- },
}
