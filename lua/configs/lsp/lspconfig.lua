--this was the command that fixed pyright being slow for me above
local lspconfig = require("lspconfig")
local on_attach = require("configs.lsp.lspconfigDefaults").on_attach
local capabilities = require("configs.lsp.lspconfigDefaults").capabilities
local servers = {
	"marksman",
	"bashls",
	"denols",
	"vimls",
	-- "julials",
	"jsonls",
	"matlab_ls",
	"neocmake",
}
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end
lspconfig.clangd.setup({
	on_attach = on_attach,
	capabilities = { capabilities, offSetEncoding = { "utf-16" } },
	root_dir = function(fname)
		return require("lspconfig.util").root_pattern(
			"Makefile",
			"configure.ac",
			"configure.in",
			"config.h.in",
			"meson.build",
			"meson_options.txt",
			"build.ninja"
		)(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(fname) or require(
			"lspconfig.util"
		).find_git_ancestor(fname)
	end,
	cmd = {
		"clangd",
		"--background-index",
		"--clang-tidy",
		"--compile-commands-dir=" .. vim.fn.expand("${workspaceFolder}/build"),
		"--header-insertion=iwyu",
		"--completion-style=detailed",
		"--function-arg-placeholders",
		"--fallback-style=llvm",
	},
	init_options = {
		usePlaceholders = true,
		completeUnimported = true,
		clangdFileStatus = true,
	},
})
lspconfig.nixd.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "nixd" },
	settings = {
		nixd = {
			semantictokens = true,
			autowatch = true,
			nixpkgs = {
				expr = 'import (builtins.getFlake "/home/cdockter/myNixOS").inputs.nixpkgs { }',
			},
			options = {
				nixOptions = {
					expr = '(builtins.getFlake "/home/cdockter/myNixOS").nixosConfigurations.nixos.options',
				},
				home_manager = {
					expr = '(builtins.getFlake "github:DockterTeagle/myNixOS").homeConfigurations."cdockter".options',
				},
				flake_parts = {
					expr = '(builtins.getFlake "github:DockterTeagle/myNixOS").debug.options',
				},
				flake_parts2 = {
					expr = '(builtins.getFlake "github:DockterTeagle/myNixOS").currentSystem.options',
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
					vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
				},
				maxPreload = 100000,
				preloadFileSize = 10000,
			},
		},
	},
})
lspconfig.hyprls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
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
			format = {
				preview = true,
			},
			disableRuleComment = {
				enable = false,
			},
		},
	},
})
lspconfig.basedpyright.setup({
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
