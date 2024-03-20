return {
  {
    "nvim-telescope/telescope.nvim",
    opts = require "plugins.Telescope.TelescopeOptions",
  },
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
