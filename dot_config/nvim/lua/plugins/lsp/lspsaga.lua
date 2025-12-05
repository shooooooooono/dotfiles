return {
  "nvimdev/lspsaga.nvim",
  branch = "main",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("lspsaga").setup({
      border_style = "single",
      symbol_in_winbar = {
        enable = true,
        sign = true,
      },
      implement = {
        enable = true,
        sign = true,
      },
      lightbulb = {
        enable = false,
      },
    })
  end,
  keys = {
    { "<leader>gd", "<cmd>Lspsaga finder<cr>",               desc = "LSP Finder" },
    { "<leader>ol", "<cmd>Lspsaga outline<cr>",              desc = "Outline" },
    { "<S-k>",      "<cmd>Lspsaga hover_doc<cr>",            desc = "Hover Doc" },
    { "[e",         "<cmd>Lspsaga diagnostic_jump_prev<cr>", desc = "Prev Diagnostic" },
    { "]e",         "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Next Diagnostic" },
  },
}
