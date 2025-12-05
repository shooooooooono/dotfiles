local nvim_lsp = require("lspconfig")
local command_util = require("util.command")

nvim_lsp.gopls.setup({
  cmd = { command_util.ExecuteCommand({ "go", "env", "GOPATH" }) .. "/bin/gopls" },
})

nvim_lsp.lua_ls.setup {}
