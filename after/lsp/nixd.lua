return {
	root_markers = { "flake.nix" },
	cmd = {
		"nixd",
	},
	filetypes = { "nix" },
	settings = {
		nixd = {
			inlay_hints = true,
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
						vim.fn.getcwd() ~= "" and vim.fn.getcwd() or "/home/cdockter/myNixOS"
					),
				},
				home_manager = {
					expr = 'builtins.getFlake"/home/cdockter/myNixOS".homeConfigurations."cdockter".options',
					-- expr = string.format(
					-- 	'(builtins.getFlake "%s").homeConfigurations."cdockter".options',
					-- 	vim.fn.getcwd() ~= "" and vim.fn.getcwd() or "/home/cdockter/myNixOS"
					-- ),
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
