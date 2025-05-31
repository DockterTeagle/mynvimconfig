require("globals")
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
vim.lsp.config("*", {
	capabilities = {
		textDocument = {
			foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			},
		},
	},
})
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		local bufnr = vim.api.nvim_get_current_buf()
		local map = vim.keymap.set
		local function opts(desc)
			return {
				buffer = bufnr,
				desc = "LSP " .. desc,
			}
		end
		map("n", "gD", function()
			Snacks.picker.lsp_declarations()
		end, opts("Go to declaration"))
		map("n", "<leader>sh", vim.lsp.buf.signature_help, opts("Show signature help"))
		map({ "n", "v" }, "<leader>ca", function()
			vim.lsp.buf.code_action()
		end, opts("Code action"))
		map("n", "gd", function()
			Snacks.picker.lsp_definitions()
		end)
		map("n", "gr", function()
			Snacks.picker.lsp_references()
		end, opts("Show references"))
		map("n", "gi", function()
			Snacks.picker.lsp_implementations()
		end, opts("Go to implementation"))
		map("n", "gy", function()
			Snacks.picker.lsp_type_definitions()
		end, opts("Go to type definition"))
		if client:supports_method("textDocument/inlayHint") then
			vim.lsp.inlay_hint.enable(true)
		end
	end,
})
