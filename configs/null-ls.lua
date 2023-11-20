local present, null_ls = pcall(require, "null-ls")
if not present then
  return
end
local b = null_ls.builtins
local d = b.diagnostics
-- local m = null_ls.methods
local c = b.code_actions
local f = b.formatting
local sources = {
  -- Code actions
  c.gitsigns,

  -- diagnostics
  d.ruff.with {
    extra_args = function()
      local virtual = os.getenv "VIRTUAL_ENV" or os.getenv "CONDA_PREFIX" or "/usr"
      return { "--python-executable", virtual .. "/bin/python3" }
    end,
  },
  d.mypy.with {
    prefer_local = "/home/christopher/miniconda3/bin",
    -- command = "dmypy",
    -- args = function(params)
    --   local t1 = {
    --     "run",
    --     "--timeout",
    --     "5000000",
    --     "--",
    --     "--hide-error-context",
    --     "--no-color-output",
    --     "--show-absolute-path",
    --     "--show-column-numbers",
    --     "--show-error-codes",
    --     "--no-error-summary",
    --     "--no-pretty",
    --     "--cache-fine-grained",
    --     "--sqlite-cache",
    --     "--shadow-file",
    --     params.bufname,
    --     params.temp_path,
    --     params.bufname,
    --   }
    --   local t2 = vim.lsp.buf.list_workspace_folders()
    --   for _, v in ipairs(t2) do
    --     table.insert(t1, v)
    --   end
    --   return t1
    -- end,
    -- timeout = 500000000,
    -- -- Do not run in fugitive windows, or when inside of a .venv area
    -- runtime_condition = function(params)
    --   if string.find(params.bufname, "fugitive") or string.find(params.bufname, ".venv") then
    --     return false
    --   else
    --     return true
    --   end
    -- end,
    -- extra_args = function()
    --   local virtual = os.getenv "VIRTUAL_ENV" or os.getenv "CONDA_PREFIX" or "/usr"
    --   return { "--python-executable", virtual .. "/bin/python3" }
    -- end,
  },
  d.vale,

  -- Formatters
  f.black,
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
