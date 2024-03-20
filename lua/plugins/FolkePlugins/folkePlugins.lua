local todoComments = require "plugins.FolkePlugins.TodoComments.TodoCommentsMain"
local noice = require "plugins.FolkePlugins.noice.noiceMain"
return {
  {
    "folke/neodev.nvim",
  },
  noice,
  todoComments,
  require "plugins.FolkePlugins.trouble.troubleMain",
}
