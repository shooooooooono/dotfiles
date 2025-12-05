return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "folke/noice.nvim",
    "nvim-telescope/telescope-dap.nvim",
  },
  config = function()
    local ts = require("telescope")
    local actions = require("telescope.actions")

    ts.setup({
      defaults = {
        file_ignore_patterns = { "NvimTree" },
        mappings = {
          i = {
            ["<C-d>"] = actions.delete_buffer,
          },
        }
      },
      pickers = {
        colorscheme = {
          enable_preview = true,
        }
      }
    })

    ts.load_extension("noice")
    ts.load_extension('dap')
  end,
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>",   desc = "Find Files" },
    { "<leader>fw", "<cmd>Telescope live_grep<cr>",    desc = "Live Grep" },
    { "<leader>fo", "<cmd>Telescope oldfiles<cr>",     desc = "Old Files" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>",      desc = "Buffers" },
    { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Git Branches" },
  }
}
