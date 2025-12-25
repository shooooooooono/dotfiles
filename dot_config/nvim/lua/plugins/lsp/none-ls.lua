return {
  "nvimtools/none-ls.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
    "williamboman/mason.nvim",
    {
      "jay-babu/mason-null-ls.nvim",
      config = function()
        require("mason-null-ls").setup({
          ensure_installed = { "yamlfmt", "jq", "ruff" },
        })
      end,
    },
  },
  -- after = { "nvim-lspconfig" },
  config = function()
    local null_ls = require("null-ls")
    local util = require("lib.command")

    ------------------------------------------------------------
    -- Go
    ------------------------------------------------------------
    local goimports = null_ls.builtins.formatting.goimports.with({
      diagnostics_format = "[goimports] #{m}\n(#{c})",
      filetypes = { "go" },
      command = util.ExecuteCommand({ "go", "env", "GOPATH" }) .. "/bin/goimports",
    })

    ------------------------------------------------------------
    -- Yaml
    ------------------------------------------------------------
    local yamlfmt = null_ls.builtins.formatting.yamlfmt.with({
      filetypes = { "yaml", "yml" },
    })

    ------------------------------------------------------------
    -- Json
    ------------------------------------------------------------
    local jq = require("none-ls.formatting.jq")

    ------------------------------------------------------------
    -- Python
    ------------------------------------------------------------
    local ruff_format = require("none-ls.formatting.ruff_format")
    local ruff = require("none-ls.formatting.ruff")

    local sources = {
      goimports,
      yamlfmt,
      jq,
      ruff_format,
      ruff,
    }
    null_ls.setup({
      sources = sources,
    })
  end,
}
