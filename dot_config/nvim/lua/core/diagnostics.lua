M = {}

local function configure_diagnostics()
  local icons = require("lib.icons")
  vim.diagnostic.config({
    underline = true,
    virtual_text = {
      spacing = 4,
      prefix = "●",
    },
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
        [vim.diagnostic.severity.WARN] = icons.diagnostics.Warn,
        [vim.diagnostic.severity.HINT] = icons.diagnostics.Hint,
        [vim.diagnostic.severity.INFO] = icons.diagnostics.Info,
      },
    },
    update_in_insert = false,
    severity_sort = true,
  })
end

function M.setup()
  -- 即座に設定
  configure_diagnostics()

  -- LspAttach 後にも再設定 (プラグインによる上書き対策)
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function()
      vim.schedule(configure_diagnostics)
    end,
  })
end

return M
