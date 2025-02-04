return {
	{
		"nvimdev/lspsaga.nvim",
		opts = {
			lightbulb = {
				-- virtual_text = false,
			},
		},
		config = function(_, opts)
			require("lspsaga.util").icon_from_devicon = function(ft)
				return require("mini.icons").get("filetype", ft)
			end
			require("lspsaga").setup(opts)
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional
			"echasnovski/mini.icons",
		},
		event = "LspAttach",
	},
	{
		"neovim/nvim-lspconfig",
		-- ft = {},
		-- event = { "BufReadPost", "BufNewFile", "BufWritePre" },
		event = { "BufReadPost", "BufNewFile", "BufWritePre" },
		dependencies = {
			"tamago324/nlsp-settings.nvim",
			{ "antosha417/nvim-lsp-file-operations", config = true },
		},
		opts = function()
			return require("configs.lsp.lspconfig")
		end,
		config = function(_, opts)
			local servers = opts.servers
			local capabilities = vim.tbl_deep_extend(
				"force",
				{},
				vim.lsp.protocol.make_client_capabilities(),
				require("blink.cmp").get_lsp_capabilities()
			)

			-- Retrieve the on_attach function
			local on_attach = require("configs.lsp.lspconfigDefaults").on_attach

			-- Function to set up a server
			local function setup(server)
				local server_opts = vim.tbl_deep_extend("force", {
					capabilities = vim.deepcopy(capabilities),
					on_attach = on_attach, -- Ensure on_attach is passed correctly
				}, servers[server] or {})

				-- Skip setup if the server is disabled
				if opts.setup and opts.setup[server] then
					if opts.setup[server](server, server_opts) then
						return
					end
				elseif opts.setup and opts.setup["*"] then
					if opts.setup["*"](server, server_opts) then
						return
					end
				end
				-- Finally, set up the LSP server
				require("lspconfig")[server].setup(server_opts)
			end

			-- Loop over each server and call the setup function
			for server, server_opts in pairs(servers) do
				if server_opts then
					-- If the server is enabled, proceed with setup
					if server_opts.enabled ~= false then
						setup(server)
					end
				end
			end
		end,
	},
}
