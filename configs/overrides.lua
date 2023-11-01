vim.env.PYENV = "~/anaconda3/bin/python"
local M = {}
M.mason = {
  name = "base",
  packages = {
    "python/mypy",
  },
  ensure_installed = {
    "black",
    "clangd",
    "clang-format",
    "codelldb",
    "ruff",
    "pyright",
    "debugpy",
    "deno",
    "vale",
    "texlab",
    "bibtex-tidy",
    "stylua",
    "bash-language-server",
    "bash-debug-adapter",
    "cpplint",
    "selene",
    "lua-language-server",
    "mypy",
  },
}
M.treesitter = {

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
    -- web dev
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "json",
    "vue",
    "svelte",
    "dart",
    "toml",
    "yaml",
    "yuck",
    -- low level
    "c",
    "zig",
    "cpp",
    "rust",
  },
}
return M
