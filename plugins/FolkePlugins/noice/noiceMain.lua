local NoiceSettings = require "custom.plugins.FolkePlugins.noice.noiceSettings"
return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = NoiceSettings,
  },
}
