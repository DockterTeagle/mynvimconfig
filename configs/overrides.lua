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
    "vale"
  },
}
M.treesitter = {

    ensure_installed = {
    -- defaults 
    "vim",
    "lua",
    "python",
    "markdown",
    "bash",
    "nix",
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
