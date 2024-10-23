{
  description = "rustacean flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    rustacean.url = "github:mrcjkb/rustaceanvim";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };
  outputs = inputs@ { self, nixpkgs, flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; }
      {
        systems = [
          "x86_64-linux"
          "x86_64-darwin"
          "aarch64-darwin"
        ];
        perSystem =
          { config
          , self'
          , inputs'
          , pkgs
          , system
          , ...
          }:
          let
            pkgs = nixpkgs.legacyPackages.${system};
            runtimeDeps = with pkgs;[
              gcc
              nixd
              clang

            ];
            nvim =
              pkgs.wrapNeovimUnstable pkgs.neovim-unwrapped
                (pkgs.neovimUtils.makeNeovimConfig
                  {
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
                    "${flake-parts.makeBinPath runtimeDeps}"
                  ];
                });
          in

          {
            # overlays = {
            #   neovim = _:__prev: {
            #     neovim = nvim;
            #   };
            #   default = self'.overlays.neovim;
            # };
            # packages = rec {
            #   neovim = nvim;
            #   default = neovim;
            # };
            devShells.default = pkgs.mkShell
              {

                buildInputs = with pkgs;
                  [
                    lua
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

