---@type ChadrcConfig 
 local M = {}
 M.ui = {
  theme = 'catppuccin',
  lsp = {
    signature = {
      silent = true,
      disabled = false,
    },
  },
}
 M.mappings =require "custom.mappings"
 M.plugins = "custom.plugins"
 return M
