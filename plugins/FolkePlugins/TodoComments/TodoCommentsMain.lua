local todoCommentsSettings = require "custom.plugins.FolkePlugins.TodoComments.TodoCommentsSettings"
return {
  "folke/todo-comments.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = todoCommentsSettings,
  -- config = function()
  -- require("core.utils").load_mappings "TodoComments"
  -- end,
}
