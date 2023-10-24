local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local b = require("none-ls").builtins

local opts = {
  sources = {
    b.diagnostics.mypy,
    b.diagnostics.ruff,
    b.formatting.black,
    b.formatting.clang_format,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
}

return opts
