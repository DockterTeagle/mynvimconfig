{
  inputs',
  pkgs,
  config,
  ...
}: let
  inherit (config) treefmt;
in {
  devenv.shells.default = {
    cachix = {
      enable = true;
      pull = ["pre-commit-hooks"];
    };
    packages = with pkgs; [
      inputs'.nixd.packages.nixd
      lua-language-server
      codespell
      marksman
      ltex-ls-plus
      deno
      nodePackages_latest.prettier
      typos
    ];
    git-hooks = {
      enabledPackages = with pkgs; [
        markdownlint-cli2
        markdownlint-cli
        mdformat
        mdsh
        commitizen
        statix
        deadnix
        flake-checker
        gitleaks
        trufflehog
        convco
        dprint
        treefmt.build.wrapper
        inputs'.alejandra.packages.default
        stylua
      ];
      hooks = {
        #git
        check-merge-conflicts.enable = true;
        detect-private-keys.enable = true;
        commitizen.enable = true;
        convco.enable = true;
        forbid-new-submodules.enable = true;
        #nix
        flake-checker.enable = true;
        statix.enable = true;
        deadnix.enable = true;
        #lua
        stylua.enable = true;
        #markdown
        markdownlint.enable = true;
        mdsh.enable = true;
        treefmt = {
          enable = true;
          package = treefmt.build.wrapper;
        };
      };
    };
  };
}
