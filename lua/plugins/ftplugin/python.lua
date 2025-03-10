return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = { ensure_installed = { "ninja", "rst" } },
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				basedpyright = {
					settings = {
						pyright = {
							disableOrganizeImports = true,
						},
						python = {
							analysis = {
								ignore = { "*" },
							},
						},
					},
				},
				ruff = {
					cmd_env = { RUFF_TRACE = "messages" },
					init_options = {
						settings = {
							logLevel = "error",
							configurationPreference = "filesystemFirst",
							codeAction = {
								fixViolation = {
									enable = true,
								},
							},
							lint = {
								preview = true,
							},
							format = {
								preview = true,
							},
							disableRuleComment = {
								enable = false,
							},
						},
					},
				},
			},
			-- FIXME: need to fix this and make it work
			--
			-- setup = {
			-- 	ruff = function(client)
			-- 		client.server_capabilities.hoverProvider = false
			-- 	end,
			-- 	-- [ruff] = function()
			-- 	-- 	LazyVim.lsp.on_attach(function(client, _)
			-- 	-- 		-- Disable hover in favor of Pyright
			-- 	-- 		client.server_capabilities.hoverProvider = false
			-- 	-- 	end, ruff)
			-- 	-- end,
			-- },
		},
	},
	-- {
	-- 	"neovim/nvim-lspconfig",
	-- 	opts = function(_, opts)
	-- 		local servers = { "pyright", "basedpyright", "ruff", "ruff_lsp", ruff, lsp }
	-- 		for _, server in ipairs(servers) do
	-- 			opts.servers[server] = opts.servers[server] or {}
	-- 			opts.servers[server].enabled = server == lsp or server == ruff
	-- 		end
	-- 	end,
	-- },
	-- {
	-- 	"mfussenegger/nvim-dap",
	-- 	optional = true,
	-- 	dependencies = {
	-- 		"mfussenegger/nvim-dap-python",
	-- 		config = function()
	-- 			if vim.fn.has("win32") == 1 then
	-- 				require("dap-python").setup(LazyVim.get_pkg_path("debugpy", "/venv/Scripts/pythonw.exe"))
	-- 			else
	-- 				require("dap-python").setup(LazyVim.get_pkg_path("debugpy", "/venv/bin/python"))
	-- 			end
	-- 		end,
	-- 	},
	-- },
	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
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
		optional = true,
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
