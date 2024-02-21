local todoComments = require "custom.plugins.FolkePlugins.TodoComments.TodoCommentsMain"
local noice = require "custom.plugins.FolkePlugins.noice.noiceMain"
local M = {
  {
    "folke/neodev.nvim",
  },
  noice,
  todoComments,
  require "custom.plugins.FolkePlugins.trouble.troubleMain",
}
return M
