local present, null_ls = pcall(require, "null-ls")
if not present then
  return
end
local b = require("null-ls").builtins

  local sources = {
  -- Code actions
  b.code_actions.gitsigns,

  -- diagnostics
  b.diagnostics.ruff,
  b.diagnostics.mypy.with({
    extra_args = function()
      local virtual = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX") or "/usr"
      return { "--python-executable", virtual .. "/bin/python3" }
    end,
  }),
  b.diagnostics.vale,

  -- Formatters
  b.formatting.black,
  -- b.formatting.bibtex_tidy,
  b.formatting.clang_format,
  }
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup {
  debug = true,
  sources = sources,

  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}
