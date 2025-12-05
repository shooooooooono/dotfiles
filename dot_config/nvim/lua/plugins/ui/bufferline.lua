return {
  "akinsho/nvim-bufferline.lua",
  event = "VeryLazy",
  config = function()
    require("bufferline").setup()
  end,
}
