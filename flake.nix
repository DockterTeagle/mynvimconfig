{
  description = "neovim config flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    blink.url = "github:Saghen/blink.cmp";
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
        { pkgs, inputs', ... }:
        let
          runtimeDeps = with pkgs; [
            lua
            gcc
            nixd
            clang
          ];
          nvim = pkgs.wrapNeovimUnstable pkgs.neovim-unwrapped (
            pkgs.neovimUtils.makeNeovimConfig {
              customRc = ''
                set runtimepath^=${./.}
                source ${./.}/init.lua
              '';
            }
            // {
              wrapperArgs = [
                "--prefix"
                "PATH"
                ":"
                "${pkgs.lib.makeBinPath runtimeDeps}"
              ];
            }
          );
        in
        {
          # overlays = {
          #   neovim = _:__prev: {
          #     neovim = nvim;
          #   };
          #   default = self'.overlays.neovim;
          # };
          packages = rec {
            neovim = nvim;
            default = neovim;
          };
          devShells.default = pkgs.mkShell {
            inputsFrom = [ inputs'.blink.devShells.default ];
            packages = with pkgs; [
              lua5_4
              stylua
              selene
              lua-language-server
              luajitPackages.luarocks-nix
              rustc
              clang
            ];
          };
        };
    };
}
