return {
  "petertriho/nvim-scrollbar",
  event = { "BufReadPre", "BufNewFile", "BufWinEnter" },
  config = function()
    require("scrollbar").setup()
  end,
}
