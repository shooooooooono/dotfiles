-- Environment variable: USE_NVIM_AI_PLUGIN
-- Set to "1" to enable AI plugins (CopilotChat, ClaudeCode)
-- Example: export USE_NVIM_AI_PLUGIN=1
local use_ai = os.getenv("USE_NVIM_AI_PLUGIN") == "1"

if use_ai then
  return {
    "coder/claudecode.nvim",
    dependencies = {
      "folke/snacks.nvim",
    },
    opts = {
      terminal = {
        split_side = "right",
        split_width_percentage = 0.4,
        provider = "snacks",
      },
      terminal_cmd = "claude",
    },
    keys = {
      { "<leader>cc", "<cmd>ClaudeCode<cr>",      desc = "Toggle Claude" },
      { "<leader>cf", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
      { "<leader>cs", "<cmd>ClaudeCodeSend<cr>",  desc = "Send to Claude", mode = "v" },
    },
  }
else
  return {}
end
