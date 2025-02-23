{
  description = "neovim config flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    pre-commit-hooks.url = "github:cachix/git-hooks.nix";
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixd.url = "github:nix-community/nixd";
  };
  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        "x86_64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      perSystem = {
        inputs',
        self',
        system,
        pkgs,
        ...
      }: {
        formatter = pkgs.alejandra;
        checks = {
          pre-commit-check = inputs.pre-commit-hooks.lib.${system}.run {
            src = ./.;
            hooks = {
              alejandra.enable = true;
              stylua.enable = true;
            };
          };
        };
        devShells.default = pkgs.mkShell {
          shellHook =
            # let
            #
            # in
            # bash
            ''
              ${self'.checks.pre-commit-check.shellHook}
            '';
          packages = with pkgs; [
            self'.checks.pre-commit-check.enabledPackages
            inputs'.nixd.packages.nixd
            stylua
            selene
            lua-language-server
            codespell
            marksman
            ltex-ls-plus
            alejandra
          ];
        };
      };
    };
}
