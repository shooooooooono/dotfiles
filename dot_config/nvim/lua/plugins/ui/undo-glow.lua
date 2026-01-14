return {
  "y3owk1n/undo-glow.nvim",
  event = "VeryLazy",
  opts = {
    animation = {
      enabled = true,
      duration = 300,
      animation_type = "zoom",
    },
    highlights = {
      undo = { hl_color = { bg = "#693232" } },
      redo = { hl_color = { bg = "#2F4640" } },
      yank = { hl_color = { bg = "#4A4A2F" } },
      paste = { hl_color = { bg = "#2F3D4A" } },
      search = { hl_color = { bg = "#4A2F4A" } },
    },
  },
  keys = {
    { "u", function() require("undo-glow").undo() end, desc = "Undo with glow" },
    { "<C-r>", function() require("undo-glow").redo() end, desc = "Redo with glow" },
    { "p", function() require("undo-glow").paste_below() end, desc = "Paste below with glow" },
    { "P", function() require("undo-glow").paste_above() end, desc = "Paste above with glow" },
    { "n", function() require("undo-glow").search_next() end, desc = "Search next with glow" },
    { "N", function() require("undo-glow").search_prev() end, desc = "Search prev with glow" },
  },
}
