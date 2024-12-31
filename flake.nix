{
  description = "neovim config flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    pre-commit-hooks.url = "github:cachix/git-hooks.nix";
    flake-parts.url = "github:hercules-ci/flake-parts";
    blink.url = "github:Saghen/blink.cmp";
    gen-luarc.url = "github:mrcjkb/nix-gen-luarc-json";
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
            # overlays = [ inputs.gen-luarc.overlays.default ];
          };
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
              let
                luarc = pkgs.mk-luarc-json {
                  plugins = with pkgs.vimPlugins; [
                    blink-cmp
                    bufferline-nvim
                    flash-nvim
                    lazy-nvim
                    lazydev-nvim
                    lualine-nvim
                    luasnip
                    mini-icons
                    "noice.nvim"
                    "lua5.1-nui.nvim" # NUI
                    "nvim-lint"
                    "nvim-notify"
                    "luajit2.1-rustaceanvim"
                    "lua5.1-telescope.nvim"
                    "todo-comments.nvim"
                    "tokyonight.nvim"
                    "vim-easy-align"
                    "vim-tmux-navigator"
                    "vimtex"
                    "which-key.nvim"
                    "aerial.nvim"
                    "comment.nvim"
                    "compiler.nvim"
                    "conform.nvim"
                    "crates.nvim"
                    "diffview.nvim"
                    "lua5.1-gitsigns.nvim"
                    "FixCursorHold.nvim"
                    "inc-rename.nvim"
                    "indent-blankline.nvim"
                    "luvit-meta"
                    "nlsp-settings.nvim"
                    "nvim-autopairs"
                    "nvim-colorizer.lua"
                    "nvim-dap"
                    "nvim-dap-python"
                    "nvim-dap-ui"
                    "nvim-dap-virtual-text"
                    "nvim-spectre"
                    nvim-treesitter
                    oil-nvim
                    overseer-nvim
                    "refactoring.nvim"
                    "rust.vim"
                    "telescope-dap.nvim"
                    "telescope-frecency.nvim"
                    "telescope-fzf-native.nvim"
                    "vim-grammarous"
                  ];
                };

              in
              # ln -fs ${luarc} .luarc.json
              # bash
              ''
                ${self'.checks.pre-commit-check.shellHook}
              '';
            inputsFrom = [ inputs'.blink.devShells.default ];
            packages = with pkgs; [
              self'.checks.pre-commit-check.enabledPackages
              lua5_4
              stylua
              selene
              lua54Packages.luacheck
              lua-language-server
              rustc
              clang
            ];
          };
        };
    };
}
