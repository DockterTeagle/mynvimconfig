{
  description = "rustacean flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    rustacean.url = "github:mrcjkb/rustaceanvim";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };
  outputs = inputs@ { self, nixpkgs, flake-parts, rustacean, ... }:
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
          in
          {
            devShells.default = pkgs.mkShell
              {
                buildInputs = with pkgs;[
                  rustacean.packages.${system}.codelldb
                  libcxx
                  valgrind
                  gcc
                  cmake
                  rocmPackages.llvm.clang
                  clang-tools
                  codespell
                  conan
                  cppcheck
                  doxygen
                  gtest
                  lcov
                  vcpkg
                  vcpkg-tool
                ];
                shellHook = ''
                  export CODELLDB_PATH=${rustacean.packages.${system}.codelldb}
                  echo $CODELLDB_PATH
                '';
              };
          };
      };
}

