return {
  "zbirenbaum/copilot-cmp",
  event = "InsertEnter",
  dependencies = {
    {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      event = "InsertEnter",
      config = function()
        require("copilot").setup({})
      end
    },
  },
  config = function()
    require("copilot_cmp").setup()
  end
}
