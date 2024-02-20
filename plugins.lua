local overrides = require "custom.configs.overrides"
local cmp = require "cmp"
local TelescopePlugins = require "custom.plugins.TelescopePlugins"
local BasePlugins = {
  {
    "folke/neodev.nvim",
  },
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = overrides.todoComments,
    -- config = function()
    -- require("core.utils").load_mappings "TodoComments"
    -- end,
  },
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
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "Trouble",
  },
  -- {
  --   "jbyuki/one-small-step-for-vimkind",
  --   event = "VeryLazy",
  -- },
  -- TODO: Make this work as a DAP.
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
    "theHamsta/nvim-dap-virtual-text",
    cmd = "DapContinue",
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    cmd = "DapContinue",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
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
    "jay-babu/mason-nvim-dap.nvim",
    ft = { "c", "cpp", "rust" },
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {},
    },
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("core.utils").load_mappings "dap"
      local dap = require "dap"
      dap.configurations.sh = {
        {
          type = "bashdb",
          request = "launch",
          name = "Launch file",
          showDebugOutput = true,
          pathBashdb = vim.fn.stdpath "data" .. "/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb",
          pathBashdbLib = vim.fn.stdpath "data" .. "/mason/packages/bash-debug-adapter/extension/bashdb_dir",
          trace = true,
          file = "${file}",
          program = "${file}",
          cwd = "${workspaceFolder}",
          pathCat = "cat",
          pathBash = "/bin/bash",
          pathMkfifo = "mkfifo",
          pathPkill = "pkill",
          args = {},
          env = {},
          terminalKind = "integrated",
        },
      }
      dap.configurations.lua = {
        {
          type = "nlua",
          request = "attach",
          name = "Attach to running Neovim instance",
        },
      }
      dap.adapters.nlua = function(callback, config)
        callback { type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 }
        --TODO: This is the error causing dap to not load for nvim-lua
      end
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      -- local path = "~/miniconda3/lib/python3.11/site-packages/debugpy"
      local path = "~/.local/share/nvchad/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings "dap_python"
    end,
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
    "ggandor/leap.nvim",
    dependencies = {
      "tpope/vim-repeat",
    },
    keys = {
      { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
      { "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
      { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
    },
    config = function(_, opts)
      local leap = require "leap"
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings()
      vim.keymap.del({ "x", "o" }, "x")
      vim.keymap.del({ "x", "o" }, "X")
    end,
  },
  {
    "ggandor/leap-spooky.nvim",
    dependencies = { "ggandor/leap.nvim" },
    event = "VeryLazy",
    config = function()
      require("leap-spooky").setup()
    end,
  },
  --telescope extensions
  -- {
  --   "smjonas/inc-rename.nvim",
  --   cmd = "IncRename",
  --   config = function()
  --     require("inc_rename").setup()
  --   end,
  -- },
  -- {
  --   "nvim-telescope/telescope-frecency.nvim",
  -- },
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
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
  {
    "stevearc/oil.nvim",
    opts = {},
    cmd = { "Oil" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    init = function()
      require("core.utils").load_mappings "oil"
    end,
  },
}
--note to self never install YouCompleteMe
local plugins = vim.tbl_deep_extend("force", BasePlugins, TelescopePlugins)
return plugins
