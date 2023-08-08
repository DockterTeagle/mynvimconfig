local M = {}
M.general = {
  n = {
    ["<C-h>"] = {"<cmd> TmuxNavigateLeft<CR>","window left"},
    ["<C-l>"] = {"<cmd> TmuxNavigateRight<CR>", "window right"},
    ["<C-j>"] = {"<cmd> TmuxNavigateDown<CR>","window down"},
    ["<C-k>"] = {"<cmd> TmuxNavigateUp<CR>","window up"},
  }
}
M.dap = {
 plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line"
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Start or continue the debugger"
    },
    -- {
      ["<leader>dus"] = {
        function ()
          local widgets = require('dap.ui.widgets');
          local sidebar = widgets.sidebar(widgets.scopes);
          sidebar.open();
        end,
        "Open debugging sidebar"
      }
  }
}
M.crates = {
  n = {
    ["<leader>rcu"] = {
      function ()
        require('crates').upgrade_all_crates()
      end,
      "update crates"
    }
  },
}
return M
