---@type vim.lsp.ClientConfig
-- local client = vim.lsp.
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
				-- library = {
				-- 	vim.env.VIMRUNTIME,
				-- },
				maxPreload = 100000,
				preloadFileSize = 10000,
			},
		},
	},
}
