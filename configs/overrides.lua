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
  },
}
M.treesitter = {

      ensure_installed = {
        -- defaults 
        "vim",
        "lua",
        "python",
        -- web dev 
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        -- "vue", "svelte",

       -- low level
        "c",
        "zig",
        "cpp",
        "rust"
      },
}
return M
