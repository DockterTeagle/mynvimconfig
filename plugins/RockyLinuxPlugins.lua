return {
  {
    "toppair/peek.nvim",
    build = "deno task --quiet build:fast",
    opts = { theme = "dark", app = "browser" },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreview", "MarkdownPreviewStop" },
    ft = "markdown",
    config = function()
      require("core.utils").load_mappings "mdpreview"
    end,
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    init = function()
      vim.g.mkdp_theme = "dark"
    end,
  },
  {
    "charludo/projectmgr.nvim",
    cmd = "ProjectMgr",
    config = function()
      require("core.utils").load_mappings "projects"
    end,
    opts = {
      autogit = {
        enabled = true,
        command = "git pull --ff-only > .git/fastforward.log 2>&1",
      },
      session = { enabled = true, file = ".git/Session.vim" },
    },
  },
}
