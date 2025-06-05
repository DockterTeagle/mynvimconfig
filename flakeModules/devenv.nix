{
  inputs',
  pkgs,
  config,
  ...
}: {
  devenv.shells.default = {
    cachix = {
      enable = true;
      pull = ["pre-commit-hooks"];
    };
    packages = with pkgs; [
      inputs'.nixd.packages.nixd
      lua-language-server
      markdownlint-cli2
      vale
      markdown-oxide
      ltex-ls-plus
      config.treefmt.build.wrapper
    ];
    git-hooks = {
      enabledPackages = with pkgs; [
        mdsh
        statix
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
          package = config.treefmt.build.wrapper;
        };
      };
    };
  };
}
