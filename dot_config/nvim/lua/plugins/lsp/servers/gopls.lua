local command_util = require("lib.command")

local function get_gopls_cmd()
  local gopath = command_util.ExecuteCommand({ "go", "env", "GOPATH" })
  if gopath then
    local gopls_path = gopath .. "/bin/gopls"
    if vim.fn.executable(gopls_path) == 1 then
      return gopls_path
    end
  end
  -- fallback: PATH から gopls を探す
  return "gopls"
end

vim.lsp.config('gopls', {
  cmd = { get_gopls_cmd(), "-remote=auto" },
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
})
