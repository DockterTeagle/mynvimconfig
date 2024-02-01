---@class ChadrcConfig
local M = {}
M.ui = {
  theme = "catppuccin",
  nvdash = {
    load_on_startup = true,
  },
}
M.mappings = require "custom.mappings" --loads the mappings?
M.plugins = "custom.plugins" --tells it where to look?
return M
