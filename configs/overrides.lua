local M = {}
M.mason = {
  ensure_installed = {
    "black",
    "clangd",
    "clang-format",
    "codelldb",
    "ruff",
    "pyright",
    "debugpy",
    "vale",
    "texlab",
    "bibtex-tidy",
    "stylua",
    "cpplint",
    "lua-language-server",
    "mypy",
    "deno",
    "marksman",
    "cmake-language-server",
    "bash-language-server",
    "bash-debug-adapter",
    "rust-analyzer",
    "cmakelint",
    "vim-language-server",
  },
}
M.treesitter = {
  ignore_install = { "tex" },
  ensure_installed = {
    -- defaults
    "vim",
    "lua",
    "python",
    "markdown",
    "markdown_inline",
    "bash",
    "regex",
    "vimdoc",
    "gitignore",
    -- low level
    "c",
    "cpp",
    "rust",
  },
}
M.telescope = {
  extensions_list = {
    "fzf",
    "noice",
    "media_files",
    "frecency",
    "bibtex",
    "file_browser",
    "lazygit",
    "dap",
    "i23",
  },
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter",
    },
  },
}
M.nvimtree = {
  git = {
    enable = true,
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}
return M
