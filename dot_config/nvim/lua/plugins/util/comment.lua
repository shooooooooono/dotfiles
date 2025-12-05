return {
  "numToStr/Comment.nvim",
  config = function()
    require("Comment").setup()
  end,
  keys = {
    {
      "<leader>/",
      function() require("Comment.api").toggle.linewise.current() end,
      desc = "Toggle Comment",
    },
    {
      "<leader>/",
      function() require("Comment.api").toggle.linewise(vim.fn.visualmode()) end,
      mode = "v",
      desc = "Toggle Comment",
    },
  },
}
