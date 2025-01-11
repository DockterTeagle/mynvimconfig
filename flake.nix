{
  description = "neovim config flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    pre-commit-hooks.url = "github:cachix/git-hooks.nix";
    flake-parts.url = "github:hercules-ci/flake-parts";
    gen-luarc.url = "github:mrcjkb/nix-gen-luarc-json";
    nixd.url = "github:nix-community/nixd";
  };
  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      perSystem =
        {
          inputs',
          self',
          system,
          ...
        }:
        let
          pkgs = import inputs.nixpkgs {
            inherit system;
            overlays = [ inputs.gen-luarc.overlays.default ];
          };
        in
        {
          formatter = pkgs.nixfmt-rfc-style;
          checks = {
            pre-commit-check = inputs.pre-commit-hooks.lib.${system}.run {
              src = ./.;
              hooks = {
                nixfmt-rfc-style.enable = true;
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
              lua5_4
              stylua
              selene
              # lua54Packages.luacheck
              lua-language-server
              codespell
            ];
          };
        };
    };
}
