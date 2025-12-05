return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup()

    -- gitui terminal
    local Terminal = require("toggleterm.terminal").Terminal
    local gitui = Terminal:new({
      cmd = "gitui",
      hidden = true,
      direction = "float",
    })
    vim.keymap.set("n", "<leader>gt", function() gitui:toggle() end, { desc = "GitUI" })
  end,
  keys = {
    { "<S-t><S-t>", "<cmd>ToggleTerm direction=tab<cr>",   desc = "Terminal Tab" },
    { "<S-t><S-f>", "<cmd>ToggleTerm direction=float<cr>", desc = "Terminal Float" },
    { "<S-t><S-w>", "<cmd>ToggleTerm<cr>",                 desc = "Terminal Split" },
  },
}
