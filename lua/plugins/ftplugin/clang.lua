return {
	"p00f/clangd_extensions.nvim",
	lazy = true,
	-- config = function() end,
	opts = {
		inlay_hints = {
			inline = true,
		},
		ast = {
			--These require codicons (https://github.com/microsoft/vscode-codicons)
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
				TemplateTypeParm = "",
				TemplateTemplateParm = "",
				TemplateParamObject = "",
			},
		},
	},
	{
		"Zeioth/compiler.nvim",
		cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
		opts = {

			compilers = {
				clang = {
					command = "clang",
					args = { "-std=c++17", "-Wall", "-g" },
					compile_commands = "build/compile_commands.json",
				},
			},
		},
		dependencies = {
			{
				"stevearc/overseer.nvim",
				cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
				opts = {
					task_list = {
						direction = "bottom",
						min_height = 25,
						max_height = 25,
						default_detail = 1,
					},
				},
			},
		},
	},
}
