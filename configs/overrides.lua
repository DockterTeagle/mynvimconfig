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
  ignore_install = { "latex" },
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
  },
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter",
    },
  },
}
return M
