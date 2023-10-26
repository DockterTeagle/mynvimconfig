local overrides = require "custom.configs.overrides"
local plugins = {
   {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "charludo/projectmgr.nvim",
    lazy = false,
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    opts = {
    },
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    -- lazy = false,
    build = "make",
  },
  {
    "lervag/vimtex",
    ft = "tex",
    lazy = false,
    init = function()
      vim.g.vimtex_compiler_latexmk = {
        options = {
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
      vim.cmd[[if !exists("g:vim_window_id")
          let g:vim_window_id = system("xdotool getactivewindow")
          endif]]
    end,
  },
  {
    "junegunn/fzf",
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
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
    end
  },

  {
    "saecki/crates.nvim",
    ft = {"rust","toml"},
    config = function (_,opts)
      local crates = require('crates')
      crates.setup(opts)
      crates.show()
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local M = require "plugins.configs.cmp"
      table.insert(M.sources,{name="crates"})
      return M
    end
  },
  -- {
  --   "latex-lsp/texlab",
  --   ft = "latex,"
  -- },
  {
    "ludovicchabant/vim-gutentags",
    lazy = false,
  },
  {
    "neomake/neomake",
    lazy = false,
  },
  {
    "rafamadriz/friendly-snippets",
    enabled = false,
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        names = false
      }
    }
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    config = function ()
      require "custom.configs.external.mason-nvim-dap"
    end
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, _)
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local path ="~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap_python")
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    opts = overrides.mason,
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function ()
      return require "custom.configs.rust-tools"
    end,
    config = function(_,opts)
      require('rust-tools').setup(opts)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    opts = overrides.treesitter,
  },

  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    dependencies = {
      "nvimtools/none-ls.nvim",
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  -- {
  --   "TimUntersberger/neogit",
  --   event = "VeryLazy",
  --   dependencies = {
  --     "sindrets/diffview.nvim",
  --   },
  --   config = "custom.configs.external.neogit"
  -- },
}
return plugins
