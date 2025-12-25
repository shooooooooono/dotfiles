return {
  "folke/sidekick.nvim",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "folke/snacks.nvim",
    "neovim/nvim-lspconfig",
  },
  opts = {
    nes = { enabled = true, debounce = 500 },
    cli = {
      enabled = true,
      tool = "claude",
      picker = "snacks",
    },
  },
  keys = {
    -- NES
    {
      "<Tab>",
      function()
        if not require("sidekick").nes_jump_or_apply() then
          return "<Tab>"
        end
      end,
      expr = true,
      desc = "NES jump/apply or Tab",
    },
    {
      "<Esc>",
      function()
        if not require("sidekick.nes").clear() then
          vim.cmd("noh")
        end
      end,
      desc = "Clear NES or noh",
    },
    -- Claude CLI
    {
      "<leader>cc",
      function() require("sidekick.cli").toggle() end,
      mode = { "n", "x" },
      desc = "Toggle Claude",
    },
    {
      "<leader>cp",
      function() require("sidekick.cli").prompt() end,
      mode = { "n", "x" },
      desc = "Claude Prompt Picker",
    },
    {
      "<leader>cs",
      function() require("sidekick.cli").send({ msg = "{selection}" }) end,
      mode = { "x" },
      desc = "Send to Claude",
    },
    {
      "<leader>ct",
      function() require("sidekick.cli").send({ msg = "{this}" }) end,
      mode = { "n", "x" },
      desc = "Send This to Claude",
    },
  },
}
