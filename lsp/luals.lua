return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = {
		".luarc.json",
		".luarc.jsonc",
		".luacheckrc",
		".stylua.toml",
		"stylua.toml",
		"selene.toml",
		"selene.yml",
		".git",
	},
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
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
				},
				maxPreload = 100000,
				preloadFileSize = 10000,
			},
		},
	},
}
