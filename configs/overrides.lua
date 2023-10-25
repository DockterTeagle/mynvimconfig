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
return M
