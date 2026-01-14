return {
  "Bekaboo/dropbar.nvim",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    bar = {
      sources = function(buf, _)
        local sources = require("dropbar.sources")
        local utils = require("dropbar.utils")
        if vim.bo[buf].ft == "markdown" then
          return { sources.markdown }
        end
        if vim.bo[buf].buftype == "terminal" then
          return { sources.terminal }
        end
        return {
          sources.path,
          utils.source.fallback({
            sources.lsp,
            sources.treesitter,
          }),
        }
      end,
    },
  },
  keys = {
    { "<leader>;", function() require("dropbar.api").pick() end, desc = "Dropbar Pick" },
    { "[;", function() require("dropbar.api").goto_context_start() end, desc = "Go to context start" },
    { "];", function() require("dropbar.api").select_next_context() end, desc = "Select next context" },
  },
}
