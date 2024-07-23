local lsp_capabilities = require("configs.lspconfigDefaults").capabilities
local lsp_on_attach = require("configs.lspconfigDefaults").on_attach
-- vim.keymap.set("n", "J", "<cmd>RustLsp joinLines<CR>", { desc = "better join Lines for rust", remap = true })
vim.g.rustaceanvim = {
	tools = {
		inlay_hints = {
			enable = true,
		},
	},
	server = {
		settings = {
			on_attach = lsp_on_attach,
			capabilities = lsp_capabilities,
			["rust-analyzer"] = {
				cargo = {
					allFeatures = true,
					autoreload = true,
				},
				completion = {
					addCallArgumentSnippets = true,
					addCallParenthesis = true,
					autoimport = { enable = true },
				},
			},
		},
	},
	dap = {},
}
vim.keymap.set("n", "<leader>rcu", function()
	require("crates").upgrade_all_crates()
end, { desc = "update crates" })
