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
    "selene",
    "lua-language-server",
    "mypy",
    "deno",
    "marksman",
    "cmake-language-server",
    "bash-language-server",
    "bash-debug-adapter",
    "rust-analyzer",
    "cmakelang",
    "cmakelint",
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
  },
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter",
    },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    {
      "nvim-telescope/telescope-bibtex.nvim",
    },
  },
}
return M
