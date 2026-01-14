-- Environment variable: USE_NVIM_AI_PLUGIN
-- Set to "1" to enable AI plugins (CopilotChat, ClaudeCode)
-- Example: export USE_NVIM_AI_PLUGIN=1
local use_ai = os.getenv("USE_NVIM_AI_PLUGIN") == "1"


if use_ai then
  return {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    cmd = { "CopilotChat", "CopilotChatOpen", "CopilotChatToggle" },
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    build = "make tiktoken",
    config = function()
      require("CopilotChat").setup {}
    end
  }
else
  return {}
end
