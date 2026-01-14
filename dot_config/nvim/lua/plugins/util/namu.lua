return {
  "bassamsdata/namu.nvim",
  event = "VeryLazy",
  opts = {
    namu_symbols = {
      enable = true,
      options = {
        movement = {
          next = { "<C-n>", "<DOWN>" },
          previous = { "<C-p>", "<UP>" },
        },
      },
    },
    ui = {
      border = "rounded",
    },
  },
  keys = {
    { "<leader>ss", "<cmd>Namu symbols<cr>", desc = "Namu Symbols" },
    { "<leader>sw", "<cmd>Namu workspace<cr>", desc = "Namu Workspace" },
    { "<leader>sd", "<cmd>Namu diagnostics<cr>", desc = "Namu Diagnostics" },
    { "<leader>sc", "<cmd>Namu call_hierarchy<cr>", desc = "Namu Call Hierarchy" },
  },
}
