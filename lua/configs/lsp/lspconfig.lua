local clangdOpts = {
	keys = {
		{ "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
	},
	-- capabilities = { capabilities, offSetEncoding = { "utf-16" } },
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
			-- semantictokens = true,
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
	},
	setup = {},
}
