require("globals")
local map = vim.keymap.set
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	local repo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

require("options")
_G.LazyVim = require("util")
require("lazy").setup({
	{ import = "plugins.general" },
	{ import = "plugins.ftplugin" },
}, require("configs.lazy"))
vim.schedule(function()
	require("mappings")
end)
vim.schedule(function()
	require("autocmds")
end)
vim.lsp.config["*"] = {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
}
vim.lsp.enable({
	"clangd",
	"lua_ls",
	"nixd",
	"ruff",
	"basedpyright",
	"ltexplus",
	"marksman",
	"neocmake",
	"taplo",
	"texlab",
})
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		local function opts(desc)
			return { buffer = bufnr, desc = "LSP " .. desc }
		end
		map("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
		map("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
		map("n", "gi", vim.lsp.buf.implementation, opts("Go to implementation"))
		map("n", "<leader>sh", vim.lsp.buf.signature_help, opts("Show signature help"))
		map({ "n", "v" }, "<leader>ca", function()
			vim.lsp.buf.code_action()
		end, opts("Code action"))
		map("n", "gr", vim.lsp.buf.references, opts("Show references"))
		if client:supports_method("textDocument/inlayHint") then
			vim.lsp.inlay_hint.enable(true)
		end
	end,
})
