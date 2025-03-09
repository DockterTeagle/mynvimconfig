local clangdOpts = {
	keys = {
		{ "<localleader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
	},
	capabilities = { offSetEncoding = { "utf-16" } },
	cmd = {
		"clangd",
		"--background-index",
		"--clang-tidy",
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
	cmd = {
		"nixd",
	},
	settings = {
		nixd = {
			formatting = { command = { "alejandra" } },
			nixpkgs = {
				expr = string.format(
					'(builtins.getFlake "%s").inputs.nixpkgs {}',
					vim.fn.getcwd() ~= "" and vim.fn.getcwd() or "/home/cdockter/myNixOS"
				),
			},
			options = {
				nixOptions = {
					expr = string.format(
						'(builtins.getFlake "%s").nixosConfigurations.nixos.options',
						vim.fn.getcwd() ~= "" and vim.fn.getcwd()
					),
				},
				home_manager = {
					expr = string.format(
						'(builtins.getFlake "%s").homeConfigurations."cdockter".options',
						vim.fn.getcwd() ~= "" and vim.fn.getcwd()
					),
				},
				flake_parts = {
					expr = string.format(
						'(builtins.getFlake "%s").debug.options',
						vim.fn.getcwd() ~= "" and vim.fn.getcwd() or "/home/cdockter/myNixOS"
					),
				},
				perSystem = {
					expr = string.format(
						'(builtins.getFlake "%s").currentSystem.options',
						vim.fn.getcwd() ~= "" and vim.fn.getcwd() or "/home/cdockter/myNixOS"
					),
				},
			},
		},
	},
}
local texlabOpts = {
	settings = {
		texlab = {
			forwardSearch = {
				executable = "zathura",
			},
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
			-- statusBarItem = true,
			clearDiagnosticsWhenClosingFile = false,
			enabled = true,
			additionalRules = {
				enablePickyRules = true,
				motherTongue = "en-US",
			},
			-- checkFrequency = "save",
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
		bacon_ls = { enabled = diagnostics == "bacon-ls" },
	},
	setup = {
		clangd = function(_, opts)
			local clangd_ext_opts = LazyVim.opts("clangd_extensions.nvim")
			require("clangd_extensions").setup(vim.tbl_deep_extend("force", clangd_ext_opts or {}, { server = opts }))
			return false
		end,
	},
}
