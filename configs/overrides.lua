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
    "nix",
    "regex",
    "vimdoc",
    "gitignore",
    -- low level
    "c",
    "cpp",
    "rust",
  },
}
return M
