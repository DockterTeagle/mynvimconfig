local ok, wf = pcall(require, "vim.lsp._watchfiles")
if ok then
	wf._watchfunc = function()
		return function() end
	end
end
--this was the command that fixed pyright being slow for me above
require("neodev").setup({
	library = {
		enabled = true,
		plugins = {
			"nvim-dap-ui",
			"noice.nvim",
			"vimtex",
			"Comment.nvim",
			"luasnip",
			"NvChad",
			"base46",
			"cmp-buffer",
			"cmp-nvim-lsp",
			"cmp-nvim-lua",
			"cmp-path",
			"cmp_luasnip",
			"lazy.nvim",
		},
		types = true,
	},
})
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
