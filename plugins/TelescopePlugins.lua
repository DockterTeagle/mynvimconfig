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
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
  },
  -- {
  --   "nvim-telescope/telescope-media-files.nvim",
  --   dependencies = { "nvim-telescope/telescope.nvim" },
  -- },
  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    cmd = "LazyGit",
  },
  {
    "debugloop/telescope-undo.nvim",
  },
  {
    "nvim-telescope/telescope-bibtex.nvim",
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "nvim-telescope/telescope-dap.nvim",
  },
  {
    "HUAHUAI23/telescope-dapzzzz",
  },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
}
return M
