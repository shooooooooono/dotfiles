return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- 既存
    picker = { enabled = true },
    notifier = { enabled = true },
    words = { enabled = true, debounce = 100 },
    zen = { enabled = true },
    terminal = { enabled = true },
    gitbrowse = { enabled = true },
    -- ◎ おすすめ
    bigfile = { enabled = true },
    quickfile = { enabled = true },
    -- ○ 便利
    animate = { enabled = true },
    bufdelete = { enabled = true },
    scratch = { enabled = true },
    input = { enabled = true },
    toggle = { enabled = true },
    -- △ 好み次第
    scroll = { enabled = true },
    scope = { enabled = true },
  },
  init = function()
    vim.api.nvim_create_user_command("GitBrowse", function(opts)
      Snacks.gitbrowse({ line_start = opts.line1, line_end = opts.line2 })
    end, { range = true })
  end,
  keys = {
    -- Zen
    { "<leader>zn", function() Snacks.zen() end, desc = "Zen Mode" },
    -- Scratch
    { "<leader>.", function() Snacks.scratch() end, desc = "Scratch Buffer" },
    { "<leader>S", function() Snacks.scratch.select() end, desc = "Select Scratch" },
    -- Buffer Delete
    { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
    -- Scope
    { "[i", function() Snacks.scope.jump({ pos = "top" }) end, desc = "Scope Top" },
    { "]i", function() Snacks.scope.jump({ pos = "bottom" }) end, desc = "Scope Bottom" },
    { "ii", function() Snacks.scope.textobject() end, desc = "Inner Scope", mode = { "x", "o" } },
    { "ai", function() Snacks.scope.textobject({ edge = true }) end, desc = "Around Scope", mode = { "x", "o" } },
    -- Terminal
    { "<S-t><S-t>", function() Snacks.terminal(nil, { win = { position = "float" } }) end, desc = "Terminal Float" },
    { "<S-t><S-w>", function() Snacks.terminal() end, desc = "Terminal Split" },
    { "<leader>gt", function() Snacks.terminal("gitui", { win = { position = "float" } }) end, desc = "GitUI" },
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
