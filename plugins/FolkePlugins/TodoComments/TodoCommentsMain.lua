return {
  "folke/todo-comments.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = require "custom.plugins.FolkePlugins.TodoComments.TodoCommentsSettings",
  -- config = function()
  -- require("core.utils").load_mappings "TodoComments"
  -- end,
}
