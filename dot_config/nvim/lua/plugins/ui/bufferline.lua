return {
  "akinsho/nvim-bufferline.lua",
  lazy = false,
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        always_show_bufferline = true,
      },
    })
  end,
}
