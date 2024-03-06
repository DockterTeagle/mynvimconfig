local ok, wf = pcall(require, "vim.lsp._watchfiles")
if ok then
  wf._watchfunc = function()
    return function() end
  end
end
--this was the command that fixed pyright being slow for me above
require("neodev").setup {
  library = {
    plugins = {
      "nvim-dap-ui",
    },
    types = true,
  },
}
require("noice").setup()
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"
local servers = { "clangd", "pyright", "texlab", "marksman", "cmake", "bashls", "denols", "vimls" }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
