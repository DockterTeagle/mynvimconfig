local ok, wf = pcall(require, "vim.lsp._watchfiles")
if ok then
	wf._watchfunc = function()
		return function() end
	end
end
--this was the command that fixed pyright being slow for me above
local lspconfig = require("lspconfig")
require("noice").setup()
local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities
local servers = { "clangd", "pyright", "texlab", "marksman", "cmake", "bashls", "denols", "vimls", "julials", "nil_ls" }
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end
lspconfig.nil_ls.setup({
	settings = {
		["nil"] = {
			nix = {
				maxMemoryMB = 15000,
				flake = {
					autoArchive = true,
					autoEvalInputs = true,
					nixpkgsInputName = "nixpkgs",
				},
			},
		},
	},
})
