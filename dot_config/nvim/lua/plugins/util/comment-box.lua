return {
  "LudoPinelli/comment-box.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    { "<leader>cb", "<cmd>CBccbox<cr>", mode = { "n", "v" }, desc = "Comment Box (centered)" },
    { "<leader>cl", "<cmd>CBllbox<cr>", mode = { "n", "v" }, desc = "Comment Box (left)" },
    { "<leader>cd", "<cmd>CBd<cr>", mode = "n", desc = "Remove Comment Box" },
    { "<leader>c-", "<cmd>CBline<cr>", mode = "n", desc = "Comment Line" },
  },
}
