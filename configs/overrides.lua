local M = {}
M.mason = {
  ensure_installed = {
    "black",
    "clangd",
    "clang-format",
    "codelldb",
    "mypy",
    "ruff",
    "pyright",
    "debugpy",
    "deno",
    "vale",
    "rust-analyzer",
    "texlab",
    "bibtex-tidy",
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
