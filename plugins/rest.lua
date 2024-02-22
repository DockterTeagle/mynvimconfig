local cmp = require "cmp"
local overrides = require "custom.configs.overrides"
return {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "anuvyklack/pretty-fold.nvim",
    event = "VeryLazy",
    config = function()
      require("pretty-fold").setup()
    end,
  },
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      vim.g.vimtex_compiler_latexmk = {
        options = {
          "-lualatex",
          "-shell-escape",
          "-verbose",
          "-file-line-error",
          "-interaction=nonstopmode",
          "-synctex=1",
          -- "-recorder"
        },
      }
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_imaps_enabled = 0
    end,
  },
  {
    "saecki/crates.nvim",
    ft = { "rust", "toml" },
    config = function(_, opts)
      local crates = require "crates"
      crates.setup(opts)
      require("cmp").setup.buffer {
        sources = { { name = "crates" } },
      }
      require("core.utils").load_mappings "crates"
      crates.show()
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local M = require "plugins.configs.cmp"
      M.completion.completeopt = "menu,menuone,noselect"
      M.mapping["<CR>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = false,
      }
      table.insert(M.sources, { name = "crates" })
      return M
    end,
  },
  {
    "ludovicchabant/vim-gutentags",
    -- event = "InsertEnter",
    event = "VeryLazy",
  },
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    dependencies = {},
    init = function()
      local ls = require "luasnip"
      ls.config.set_config { --not the most elegant can probably make this a config part instead
        history = true,
        enable_autosnippets = true,
        update_events = "TextChanged,TextChangedI",
        store_selection_keys = "<Tab>",
      }
    end,
  },
  {
    "rafamadriz/friendly-snippets",
    enabled = false,
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        names = false,
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      local Lint = require "lint"
      Lint.linters_by_ft = {
        markdown = { "vale" },
        python = { "ruff", "mypy" },
        cmake = { "cmakelint" },
      }
      -- Lint.linters.mypy = {
      --   cmd = "~/miniconda3/bin/mypy",
      -- }
      -- Lint.linters.ruff = {
      --   cmd = "~/miniconda3/bin/ruff",
      -- }
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
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^3", -- Recommended
    -- config = {
    --   tools = {},
    --   server = {
    --     on_attach = function(client, bufnr) end,
    --     settings = {
    --       ["rust-analyzer"] = {},
    --     },
    --   },
    --   dap = {},
    -- },
    ft = { "rust" },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    opts = overrides.treesitter,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/neodev.nvim",
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "Zeioth/compiler.nvim",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    dependencies = {
      {
        "stevearc/overseer.nvim",
        cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
        opts = {
          task_list = {
            direction = "bottom",
            min_height = 25,
            max_height = 25,
            default_detail = 1,
          },
        },
      },
    },
    opts = {},
  },
  require "custom.plugins.FolkePlugins.folkePlugins",
  require "custom.plugins.FileBrowsers.oil",
  require "custom.plugins.FileBrowsers.nvim-treeMain",
  require "custom.plugins.Telescope.TelescopePlugins",
  require "custom.plugins.dap.nvim-dap",
}
