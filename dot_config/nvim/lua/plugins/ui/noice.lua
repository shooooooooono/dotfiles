return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "folke/snacks.nvim",
  },
  config = function()
    require("noice").setup({
      messages = {
        enabled = false,
      },
      notify = {
        enabled = true,
        view = "snacks",
      },
      lsp = {
        progress = {
          enabled = false
        },
        signature = {
          enabled = true
        },
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      }
    })
  end,
}
