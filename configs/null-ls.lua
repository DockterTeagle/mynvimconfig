local present, null_ls = pcall(require, "null-ls")
if not present then
  return
end
local b = require("null-ls").builtins

  local sources = {
  -- Code actions
  b.code_actions.gitsigns,
  -- b.code_actions.eslint_d,
  -- Completion
  b.completion.luasnip,

  -- diagnostics
  -- b.diagnostics.cpplint,
  -- b.diagnostics.clj_kondo,
  -- b.diagnostics.eslint_d,
  -- b.diagnostics.flake8,
  -- b.diagnostics.selene,
  -- b.diagnostics.statix,
  -- b.diagnostics.stylelint,
  -- b.diagnostics.shellcheck,
  b.diagnostics.ruff,
  b.diagnostics.mypy.with({
    extra_args = function()
      local virtual = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX") or "/usr"
      return { "--python-executable", virtual .. "/bin/python3" }
    end,
  }),
  b.diagnostics.vale,

  -- Formatters
  -- b.formatting.astyle,
  -- b.formatting.alejandra,
  b.formatting.black,
  -- b.formatting.dart_format,
  -- b.formatting.prettierd,
  -- b.formatting.rustfmt,
  -- b.formatting.stylua,
  -- b.formatting.yamlfmt,
  -- b.formatting.zprint,
  --

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
