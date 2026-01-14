return {
  "nvim-tree/nvim-tree.lua",
  cmd = {
    "NvimTreeToggle",
    "NvimTreeOpen",
    "NvimTreeClose",
    "NvimTreeRefresh",
    "NvimTreeFindFile",
  },
  config = function()
    require("nvim-tree").setup({
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = true,
      },
      view = {
        adaptive_size = true,
        width = 35,
        signcolumn = "yes",
      },
      actions = {
        open_file = {
          window_picker = {
            enable = true,
            picker = require("window-picker").pick_window,
          }
        }
      }
    })
  end,
  keys = {
    { "<C-n>", "<cmd>NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
  },
}
