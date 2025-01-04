return {
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
}
