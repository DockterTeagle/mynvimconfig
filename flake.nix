{
  description = "rustacean flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    rustacean.url = "github:mrcjkb/rustaceanvim";
    utils.url = "github:numtide/flake-utils";
  };
  outputs = inputs@ { self, nixpkgs, utils, ... }:
    utils.lib.eachDefaultSystem (
      system:
      let
        inherit (nixpkgs) lib;
        pkgs = nixpkgs.legacyPackages.${system};
        runtimeDeps = with pkgs; [
          # Tree sitter
          gcc

          # LSP/Linters
          nil
          statix
          deadnix
          manix

          # Telescope
          chafa
          ffmpegthumbnailer

          # Misc
          wakatime
        ];

        nvim =
          pkgs.wrapNeovimUnstable pkgs.neovim-unwrapped
            (pkgs.neovimUtils.makeNeovimConfig
              {
                customRC = ''
                  set runtimepath^=${./.}
                  source ${./.}/init.lua
                '';
              }
            // {
              wrapperArgs = [
                "--prefix"
                "PATH"
                ":"
                "${lib.makeBinPath runtimeDeps}"
              ];
            });
      in
      {
        overlays = {
          neovim = _: _prev: {
            neovim = nvim;
          };
          default = self.overlays.neovim;
        };

        packages = rec {
          neovim = nvim;
          default = neovim;
        };

        devShells.default = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            lua # Lua programming language
            stylua # Lua formatter
            selene # Lua linter written in rust
            lua-language-server # Lua LSP
            luajitPackages.luarocks-nix # Package manager for Lua on Nix
          ];
        };
      }
    );

}

