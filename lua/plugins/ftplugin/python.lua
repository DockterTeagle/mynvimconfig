return {
	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		cmd = { "DapContinue" },
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
		},
		config = function()
			local dap = require("dap-python")
			dap.setup("python")
			dap.test_runner = "pytest"
		end,
	},
	{
		"nvim-neotest/neotest-python",
	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/neotest-python",
		},
		opts = {
			adapters = {
				["neotest-python"] = {
					-- Here you can specify the settings for the adapter, i.e.
					-- runner = "pytest",
					-- python = ".venv/bin/python",
				},
			},
		},
	},
}
