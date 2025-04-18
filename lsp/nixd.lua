return {
	cmd = {
		"nixd",
	},
	filetypes = { "nix" },
	on_attach = require("configs.lsp.lspconfigDefaults").on_attach(),
	capabilities = require("blink.cmp").get_lsp_capabilities(),
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
