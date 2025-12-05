local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- The following example advertise capabilities to `clangd`.
require("lspconfig").clangd.setup({
  capabilities = capabilities,
})
