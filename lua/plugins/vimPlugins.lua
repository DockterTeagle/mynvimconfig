return {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "anuvyklack/pretty-fold.nvim",
    event = "VeryLazy",
    config = function()
      require("pretty-fold").setup()
    end,
  },
  {
    "ludovicchabant/vim-gutentags",
    -- event = "InsertEnter",
    event = "VeryLazy",
  },
}
