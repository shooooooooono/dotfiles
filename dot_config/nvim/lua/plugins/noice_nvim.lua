local noise = require("noice")
noise.setup({
  messages = {
    enabled = false,
  },
  lsp = {
    progress = {
      enabled = false
    },
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  }
})

require("notify").setup({
  background_colour = "#000000",
})
