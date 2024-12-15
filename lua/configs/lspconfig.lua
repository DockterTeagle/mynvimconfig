local ok, wf = pcall(require, "vim.lsp._watchfiles")
if ok then
	wf._watchfunc = function()
		return function() end
	end
end
--this was the command that fixed pyright being slow for me above
local lspconfig = require("lspconfig")
local on_attach = require("configs.lspconfigDefaults").on_attach
local capabilities = require("configs.lspconfigDefaults").capabilities
local servers = {
	"marksman",
	"cmake",
	"bashls",
	"denols",
	"vimls",
	-- "julials",
	"jsonls",
	"matlab_ls",
}
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end
lspconfig.clangd.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = {
		"clangd",
		"--background-index",
		"--clang-tidy",
	},
})
lspconfig.nixd.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "nixd" },
	settings = {
		nixd = {
			autowatch = true,
			nixpkgs = {
				expr = 'import (builtins.getFlake "/home/cdockter/myNixOS/").inputs.nixpkgs { }',
			},
			options = {
				nixos = {
					expr = '(builtins.getFlake "/home/cdockter/myNixOS/").nixosConfigurations.nixos.options',
				},
				home_manager = {
					expr = '(builtins.getFlake "/home/cdockter/myNixOS/").homeConfigurations."cdockter".options',
				},
				flake_parts = {
					expr = '(builtins.getFlake "/home/cdockter/myNixOS").debug.options',
				},
				flake_parts2 = {
					expr = '(builtins.getFlake "/home/cdockter/myNixOS").currentSystem.options',
				},
			},
		},
	},
})
lspconfig.texlab.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		texlab = {
			build = {
				useFileList = true,
			},
			chktex = {
				onOpenAndSave = true,
				onEdit = true,
			},
			experimental = {
				followPackageLinks = true,
			},
		},
	},
})
lspconfig.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			telemetry = {
				enable = false,
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
})
lspconfig.ruff.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	init_options = {
		settings = {
			configurationPreference = "filesystemFirst",
			codeAction = {
				fixViolation = {
					enable = true,
				},
			},
			lint = {
				preview = true,
			},
			-- format = {
			-- 	preview = true,
			-- },
			disableRuleComment = {
				enable = false,
			},
		},
	},
})
lspconfig.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		pyright = {
			disableOrganizeImports = true,
		},
		python = {
			analysis = {
				ignore = { "*" },
			},
		},
	},
})
-- vim.api.nvim_create_autocmd("BuffWritePost", {
-- 	pattern = "*.nix",
-- 	callback = function()
-- 		vim.cmd("!nix flake show")
-- 	end,
-- })
