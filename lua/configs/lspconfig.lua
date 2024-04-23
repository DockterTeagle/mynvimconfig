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
require("neodev").setup({
	library = {
		plugins = {
			"nvim-dap-ui",
		},
		types = true,
	},
})
-- elseif vim.g.isNixOS then
-- 	lspconfig.clangd.setup({
-- 		cmd = { "clangd" },
-- 		filetypes = { "c" },
-- 	})
-- 	lspconfig.pyright.setup({
-- 		cmd = { "pyright" },
-- 		filetypes = { "python" },
-- 	})
-- 	lspconfig.texlab.setup({
-- 		cmd = { "texlab" },
-- 		filetypes = { "bib", "tex" },
-- 	})
