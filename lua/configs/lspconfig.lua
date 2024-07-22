local ok, wf = pcall(require, "vim.lsp._watchfiles")
if ok then
	wf._watchfunc = function()
		return function() end
	end
end
--this was the command that fixed pyright being slow for me above
require("noice").setup()
local lspconfig = require("lspconfig")
local on_attach = require("configs.lspconfigDefaults").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities
local servers = {
	"clangd",
	"pyright",
	"texlab",
	"marksman",
	"cmake",
	"bashls",
	"denols",
	"vimls",
	"julials",
	"nixd",
	"jsonls",
	"lua_ls",
}
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end
-- lspconfig.nil_ls.setup({
-- 	settings = {
-- 		["nil"] = {
-- 			nix = {
-- 				maxMemoryMB = 15000,
-- 				flake = {
-- 					autoArchive = true,
-- 					autoEvalInputs = true,
-- 					nixpkgsInputName = "nixpkgs",
-- 				},
-- 			},
-- 		},
-- 	},
-- })
lspconfig.clangd.setup({
	cmd = {
		"clangd",
		"--background-index",
		"--clang-tidy",
	},
})
lspconfig.nixd.setup({
	cmd = { "nixd" },
	settings = {
		nixd = {
			autowatch = true,
			nixpkgs = {
				expr = 'import (builtins.getFlake "/home/cdockter/MyNixOS/").inputs.nixpkgs { }',
			},
			formatting = {
				command = { "nixpkgs-fmt" },
			},
			options = {
				nixos = {
					expr = '(builtins.getFlake "/home/cdockter/MyNixOS/").nixosConfigurations.nixos.options',
				},
				home_manager = {
					expr = '(builtins.getFlake "/home/cdockter/MyNixOS").homeConfigurations."cdockter".options',
				},
				flake_parts = {
					expr = '(builtins.getFlake "/home/cdockter/MyNixOS").debug.options',
				},
			},
		},
	},
})
lspconfig.texlab.setup({
	settings = {
		texlab = {
			build = {
				useFileList = true,
			},
			chktex = {
				onOpenAndSave = true,
				onEdit = true,
			},
			latexFormatter = "latexindent",
			experimental = {
				followPackageLinks = true,
			},
		},
	},
})
lspconfig.lua_ls.setup = {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					vim.fn.expand("$VIMRUNTIME/lua"),
					vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
					vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
					vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
				},
				maxPreload = 100000,
				preloadFileSize = 10000,
			},
		},
	},
}
-- vim.api.nvim_create_autocmd("BuffWritePost", {
-- 	pattern = "*.nix",
-- 	callback = function()
-- 		vim.cmd("!nix flake show")
-- 	end,
-- })
