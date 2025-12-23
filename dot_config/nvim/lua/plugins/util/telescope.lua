-- DAP 専用 (picker は Snacks に移行済み)
return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-dap.nvim",
  },
  config = function()
    local ts = require("telescope")
    ts.setup({})
    ts.load_extension("dap")
  end,
}
