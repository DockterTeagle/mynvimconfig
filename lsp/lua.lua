vim.lsp.config["luals"] = {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { ".luarc.json", ".luarc.jsonc" },
	on_attach = require("configs.lsp.lspconfigDefaults").on_attach(),
	capabilities = require("blink.cmp").get_lsp_capabilities(),
	settings = {
		Lua = {
			codelens = {
				enable = true,
				properties = { enable = true },
			},
			runtime = {
				version = "LuaJIT",
			},
			telemetry = {
				enable = false,
			},
			workspace = {
				maxPreload = 100000,
				preloadFileSize = 10000,
			},
		},
	},
}
vim.lsp.enable({ "luals" })
