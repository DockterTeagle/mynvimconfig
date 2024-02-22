return {
  "stevearc/oil.nvim",
  opts = {},
  cmd = { "Oil" },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  init = function()
    require("core.utils").load_mappings "oil"
  end,
}
