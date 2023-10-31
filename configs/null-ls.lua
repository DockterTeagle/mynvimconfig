local present, null_ls = pcall(require, "null-ls")
if not present then
  return
end
local b = require("null-ls").builtins
local d = b.diagnostics
local m = require("null-ls").methods
local c = b.code_actions
local f = b.formatting
local sources = {
  -- Code actions
  c.gitsigns,

  -- diagnostics
  d.ruff.with {
    method = m.DIAGNOSTICS_ON_SAVE,
    extra_args = function()
      local virtual = os.getenv "VIRTUAL_ENV" or os.getenv "CONDA_PREFIX" or "/usr"
      return { "--python-executable", virtual .. "/bin/python3" }
    end,
  },
  d.mypy.with {
    method = m.DIAGNOSTICS_ON_SAVE,
    extra_args = function()
      local virtual = os.getenv "VIRTUAL_ENV" or os.getenv "CONDA_PREFIX" or "/usr"
      return { "--python-executable", virtual .. "/bin/python3" }
    end,
  },
  d.vale,

  -- Formatters
  f.black,
  -- b.formatting.bibtex_tidy,
  f.clang_format,
  f.stylua,
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
