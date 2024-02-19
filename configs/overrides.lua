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
    "stylua",
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
M.Noice = {
  lsp = {
    hover = {
      enabled = false,
    },
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
    signature = {
      enabled = false,
    },
  },
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    -- inc_rename = true, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
}
return M
