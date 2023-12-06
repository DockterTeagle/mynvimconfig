local linter_by_ft = {
  markdown = { "vale" },
  python = { "mypy", "ruff" },
}
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
