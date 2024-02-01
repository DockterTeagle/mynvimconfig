local M = {}
M.general = {
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
  },
}
M.dap = {
  plugin = true,
  n = {
    ["<leader>dtb"] = {
      function()
        require("dap").toggle_breakpoint()
      end,
      "Add breakpoint at line",
    },
    ["<leader>dsb"] = {
      function()
        require("dap").step_back()
      end,
      "Step back",
    },
    ["<leader>dsi"] = {
      function()
        require("dap").step_into()
      end,
      "Step into function",
    },
    ["<leader>dso"] = {
      function()
        require("dap").step_over()
      end,
      "Step over function",
    },
    ["<leader>dsO"] = {
      function()
        require("dap").step_out()
      end,
      "Step out of function",
    },
    ["<leader>dc"] = {
      "<cmd> DapContinue <CR>",
      "Start or continue the debugger",
    },
    ["<leader>dus"] = {
      function()
        local widgets = require "dap.ui.widgets"
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      "Open debugging sidebar",
    },
    ["<leader>dC"] = {
      function()
        require("dap").run_to_cursor()
      end,
      "Run to cursor",
    },
    ["<leader>dd"] = {
      function()
        require("dap").disconnect()
      end,
      "disconnect from the session",
    },
    ["<leader>dss"] = {
      function()
        require("dap").session()
      end,
      "Get session",
    },
    ["<leader>dpt"] = {
      function()
        require("dap").pause.toggle()
      end,
      "Pause",
    },
    ["<leader>drt"] = {
      function()
        require("dap").repl.toggle()
      end,
      "toggle Repl",
    },
  },
}
M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require("dap-python").test_method()
      end,
      "Open debugging with python and test",
    },
  },
}
M.luasnip = {
  n = {
    ["<leader><leader>s"] = {
      function()
        require("luasnip.loaders.from_lua").load { paths = "~/.config/nvim/lua/custom/LuaSnip/" }
      end,
      "reload LuaSnip snippets",
    },
  },
}
M.crates = {
  plugin = true,
  n = {
    ["<leader>rcu"] = {
      function()
        require("crates").upgrade_all_crates()
      end,
      "update crates",
    },
  },
}
M.mdpreview = {
  plugin = true,
  n = {
    ["<leader>mp"] = { "<cmd> MarkdownPreview<CR>", "Open Preview" },
    ["<leader>mc"] = { "<cmd> MarkdownPreviewStop<CR>", "Close Preview" },
  },
}
M.projects = {
  n = {
    ["<leader>fp"] = { "<cmd> ProjectMgr<CR>", "Open Projects" },
  },
}
M.lazy_git = {
  n = {
    ["<leader>lg"] = { "<cmd> LazyGit<CR>", "Load Lazy Git" },
  },
}
return M
