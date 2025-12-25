return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    picker = { enabled = true },
  },
  keys = {
    -- Files & Grep
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Files" },
    { "<leader>fw", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>ft", function()
      vim.ui.input({ prompt = "Filetype (go, lua, js, etc): " }, function(ft)
        if ft and ft ~= "" then
          Snacks.picker.grep({ ft = ft })
        end
      end)
    end, desc = "Grep (filetype)" },
    { "<leader>fo", function() Snacks.picker.recent() end, desc = "Recent Files" },
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>f/", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
    -- Git
    { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
    { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
    { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
    -- LSP
    { "<leader>fs", function() Snacks.picker.lsp_symbols() end, desc = "Symbols (file)" },
    { "<leader>fS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "Symbols (workspace)" },
    -- Useful
    { "<leader>fu", function() Snacks.picker.undo() end, desc = "Undo History" },
    { "<leader>fd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
    { "<leader>fh", function() Snacks.picker.help() end, desc = "Help" },
    { "<leader>fk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
    { "<leader>fc", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
    { "<leader>f:", function() Snacks.picker.command_history() end, desc = "Command History" },
  },
}
