return {
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    -- config = function()
    --   require("plugins.dap")
    -- end,
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio"
    }
  },
  {
    "leoluz/nvim-dap-go",
    event = "VeryLazy",
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    event = "VeryLazy",
    dependencies = {
      "mfussenegger/nvim-dap",
    }
  },
}
