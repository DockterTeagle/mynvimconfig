local M = {}
M.mason = {
  ensure_installed = {
    --formatters
    "black",
    "stylua",
    "clang-format",
    "bibtex-tidy",
    --end formatters
    --LSPs
    "pyright",
    "bash-language-server",
    "clangd",
    "cmake-language-server",
    "deno",
    "lua-language-server",
    "marksman",
    "rust-analyzer",
    "texlab",
    "vim-language-server",
    --end LSPs
    --Linters
    "cmakelint",
    "cpplint",
    "mypy",
    "ruff",
    "vale",
    --End Linters
    --DAPs
    "debugpy",
    "codelldb",
  },
}
M.treesitter = {
  ignore_install = { "tex" },
  ensure_installed = {
    "vim",
    "lua",
    "python",
    "markdown",
    "markdown_inline",
    "bash",
    "regex",
    "vimdoc",
    "gitignore",
    "c",
    "cpp",
    "rust",
  },
}
M.telescope = {
  extensions_list = {
    "fzf",
    "noice",
    -- "frecency",
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
M.todoComments = {
  FIX = {
    icon = " ", -- icon used for the sign, and in search results
    color = "error", -- can be a hex color, or a named color (see below)
    alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
    -- signs = false, -- configure signs for some keywords individually
  },
  TODO = { icon = " ", color = "info" },
  HACK = { icon = " ", color = "warning" },
  WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
  PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
  NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
  TEST = { icon = "󰙨 ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
}
return M
