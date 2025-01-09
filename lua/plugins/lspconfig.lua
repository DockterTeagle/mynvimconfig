return {
	{
		"neovim/nvim-lspconfig",
		-- ft = {},
		event = { "BufReadPost", "BufNewFile", "BufWritePre" },
		dependencies = {
			"tamago324/nlsp-settings.nvim",
			{ "antosha417/nvim-lsp-file-operations", config = true },
		},
		opts = function()
			return require("configs.lsp.lspconfig")
		end,
		config = function(_, opts)
			local servers = opts
			local lspconfig = require("lspconfig")
			local on_attach = require("configs.lsp.lspconfigDefaults").on_attach
			local capabilities = vim.tbl_deep_extend(
				"force",
				{},
				vim.lsp.protocol.make_client_capabilities() and require("blink.cmp").get_lsp_capabilities()
			)
			for server, server_opts in pairs(opts.servers) do
				-- Retrieve the filetypes associated with the server (if any)
				local filetypes = lspconfig[server].document_config
						and lspconfig[server].document_config.default_config.filetypes
					or {}

				-- If the server has filetypes, set up an autocmd to trigger LSP setup for the filetypes
				if #filetypes > 0 then
					for _, ft in ipairs(filetypes) do
						vim.api.nvim_create_autocmd("FileType", {
							pattern = ft,
							callback = function()
								lspconfig[server].setup(vim.tbl_deep_extend("force", {
									on_attach = on_attach,
									capabilities = capabilities,
								}, server_opts))
							end,
						})
					end
				else
					-- If no filetypes are specified, set up the LSP for all filetypes
					vim.api.nvim_create_autocmd("BufReadPost", {
						pattern = "*",
						callback = function()
							lspconfig[server].setup(vim.tbl_deep_extend("force", {
								on_attach = on_attach,
								capabilities = capabilities,
							}, server_opts))
						end,
					})
				end
			end
		end,
	},
}
