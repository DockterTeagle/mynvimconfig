local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"
-- local util = require "lspconfig/util"
-- local servers = { "clangd", "pyright", "texlab","deno" }
local servers = { "clangd", "texlab", "deno" }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
