local linter_by_ft = {
  lua = { "selene" },
  markdown = { "vale" },
  python = { "mypy", "ruff" },
  cmake = { "cmakelang", "cmakelint" },
}
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
