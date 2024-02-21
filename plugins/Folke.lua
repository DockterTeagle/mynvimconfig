local overrides = require "custom.configs.overrides"
local M = {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = overrides.Noice,
  },
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
}
return M
