local clangdOpts = {
	keys = {
		{ "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
	},
	capabilities = { offSetEncoding = { "utf-16" } },
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
}
local nixdOpts = {
	cmd = { "nixd" },
	settings = {
		nixd = {
			semantictokens = true,
			autowatch = true,
			formatting = { command = { "alejandra" } },
			nixpkgs = {
				expr = 'import (builtins.getFlake "/home/cdockter/myNixOS").inputs.nixpkgs { }',
			},
			options = {
				nixOptions = {
					expr = '(builtins.getFlake "/home/cdockter/myNixOS").nixosConfigurations.nixos.options',
				},
				home_manager = {
					expr = '(builtins.getFlake "/home/cdockter/myNixOS").homeConfigurations."cdockter".options',
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
}
local texlabOpts = {
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
}
local lualsOpts = {
	settings = {
		Lua = {
			checkFrequency = "save",
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
				maxPreload = 100000,
				preloadFileSize = 10000,
			},
		},
	},
}
local ruff_opts = {
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
}
local basedpyright_opts = {
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
}
local ltexopts = {
	settings = {
		ltex = {
			clearDiagnosticsWhenClosingFile = false,
			completionEnabled = true,
			enabled = true,
			additionalRules = {
				enablePickyRules = true,
			},
			checkFrequency = "save",
			language = "en-US",
		},
	},
}
return {
	servers = {
		marksman = {},
		bashls = {},
		denols = {},
		vimls = {},
		-- "julials",
		jsonls = {},
		matlab_ls = {},
		neocmake = {},
		hyprls = {},
		basedpyright = basedpyright_opts,
		clangd = clangdOpts,
		ruff = ruff_opts,
		lua_ls = lualsOpts,
		nixd = nixdOpts,
		texlab = texlabOpts,
		ltex_plus = ltexopts,
		zls = {},
	},
	setup = {},
}
