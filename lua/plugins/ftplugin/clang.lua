return {
	{
		"p00f/clangd_extensions.nvim",
		lazy = true,
		opts = {
			inlay_hints = {
				inline = true,
			},
			ast = {
				role_icons = {
					type = "",
					declaration = "",
					expression = "",
					specifier = "",
					statement = "",
					["template argument"] = "",
				},
				kind_icons = {
					Compound = "",
					Recovery = "",
					TranslationUnit = "",
					PackExpansion = "",
					TemplateTypeParam = "",
					TemplateTemplateParam = "",
					TemplateParamObject = "",
				},
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				clangd = {
					keys = {
						{
							"<localleader>ch",
							"<cmd>ClangdSwitchSourceHeader<cr>",
							desc = "Switch Source/Header (C/C++)",
						},
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
				},
			},
			setup = {
				clangd = function(_, opts)
					local clangd_ext_opts = LazyVim.opts("clangd_extensions.nvim")
					require("clangd_extensions").setup(
						vim.tbl_deep_extend("force", clangd_ext_opts or {}, { server = opts })
					)
					return false
				end,
			},
		},
	},
	{
		"Civitasv/cmake-tools.nvim",
		init = function()
			local loaded = false
			local function check()
				local cwd = vim.uv.cwd()
				if vim.fn.filereadable(cwd .. "/CMakeLists.txt") == 1 then
					require("lazy").load({ plugins = { "cmake-tools.nvim" } })
					loaded = true
				end
			end
			check()
			vim.api.nvim_create_autocmd("DirChanged", {
				callback = function()
					if not loaded then
						check()
					end
				end,
			})
		end,
		opts = {},
	},
}
