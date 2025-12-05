require("lualine").setup({
  options = {
    globalstatus = true,
    refresh = {
      statusline = 50,
      tabline = 1000,
      winbar = 1000,
    }
  },

  sections = {
    lualine_y = {
      require("lsp-progress").progress
    },
  }
})
