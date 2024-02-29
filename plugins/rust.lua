return {
  {
    "mrcjkb/rustaceanvim",
    version = "^3", -- Recommended
    -- config = {
    --   tools = {},
    --   server = {
    --     on_attach = function(client, bufnr) end,
    --     settings = {
    --       ["rust-analyzer"] = {},
    --     },
    --   },
    --   dap = {},
    -- },
    ft = { "rust" },
    event = "User FilePost",
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
}
