local overrides = require "configs.overrides"
return {
  {
    --remider that linters happen on file open and on file write
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      local Lint = require "lint"
      Lint.linters_by_ft = {
        markdown = { "vale" },
        python = { "ruff", "mypy" },
        cmake = { "cmakelint" },
      }
      vim.api.nvim_create_autocmd({ "InsertLeave", "BufEnter", "BufWritePre" }, {
        callback = function()
          local lint_status, lint = pcall(require, "lint")
          if lint_status then
            lint.try_lint()
          end
        end,
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = function()
      local opts = {
        formatters = {
          stylua = {
            column_width = 120,
            line_endings = "Unix",
            indent_type = "Spaces",
            indent_width = 2,
            quote_style = "AutoPreferDouble",
            call_parentheses = "None",
          },
        },
        formatters_by_ft = {
          lua = { "stylua" },
          bib = { "bibtex-tidy" },
          python = { "black" },
          cpp = { "clang_format" },
          cmake = { "cmakelang" },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
      }
      return opts
    end,
    init = function()
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    opts = overrides.treesitter,
  },
  require "plugins.FolkePlugins.folkePlugins",
  require "plugins.FileBrowsers.oil",
  require "plugins.FileBrowsers.nvim-treeMain",
  require "plugins.Telescope.TelescopePlugins",
  require "plugins.dap.nvim-dap",
  require "plugins.Compilers.VimTeX",
  require "plugins.Compilers.Compiler",
}
