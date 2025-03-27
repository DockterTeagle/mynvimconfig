return {
	{ "nvim-treesitter/nvim-treesitter", opts = { ensure_installed = {
		"nix",
	} } },
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				nixd = {
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
				},
			},
		},
	},
}
