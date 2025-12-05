local command_util = require("lib.command")

vim.lsp.config('gopls', {
  cmd = { command_util.ExecuteCommand({ "go", "env", "GOPATH" }) .. "/bin/gopls" },
})
