return {
  "nvim-lualine/lualine.nvim",
  event = { "InsertEnter", "CursorHold", "FocusLost", "BufRead", "BufNewFile" },
  config = function()
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
  end,
  dependencies = {
    {
      'linrongbin16/lsp-progress.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      config = function()
        require("lsp-progress").setup({
          spinner = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" },
        })
      end
    },
  }
}
