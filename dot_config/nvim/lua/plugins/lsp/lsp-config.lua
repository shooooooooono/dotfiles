return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- 手動管理: gopls (asdf), rust_analyzer (rustup), clangd (dnf)
    require("plugins.lsp.servers.gopls")
    require("plugins.lsp.servers.rust_analyzer")
    require("plugins.lsp.servers.clangd")

    -- mason で管理する LSP
    require("plugins.lsp.servers.lua_ls")
    require("plugins.lsp.servers.pyright")
    require("plugins.lsp.servers.bashls")

    -- Enable LSP servers
    vim.lsp.enable({ 'gopls', 'lua_ls', 'clangd', 'rust_analyzer', 'pyright', 'bashls', 'copilot' })
  end,
  dependencies = {
    {
      "williamboman/mason.nvim",
      cmd = "Mason",
      config = function()
        require("mason").setup()
      end,
    },
    {
      "williamboman/mason-lspconfig.nvim",
      config = function()
        require("mason-lspconfig").setup({
          ensure_installed = { "lua_ls", "pyright", "bashls" },
        })
      end,
    },
    {
      "saghen/blink.cmp",
      version = "1.*",
      dependencies = {
        "fang2hou/blink-copilot",
      },
      opts = {
        keymap = {
          preset = "default",
          ["<C-p>"] = { "select_prev", "fallback" },
          ["<C-n>"] = { "select_next", "fallback" },
          ["<CR>"] = { "accept", "fallback" },
          ["<C-Space>"] = { "show", "fallback" },
        },
        appearance = {
          nerd_font_variant = "mono",
        },
        completion = {
          trigger = {
            show_on_insert_on_trigger_character = true,
          },
          documentation = {
            auto_show = true,
            window = { border = "rounded" },
          },
          menu = {
            auto_show = true,
            border = "rounded",
            draw = {
              columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "source_name" } },
            },
          },
        },
        sources = {
          default = { "lsp", "copilot", "snippets", "path", "buffer" },
          providers = {
            copilot = {
              name = "copilot",
              module = "blink-copilot",
              score_offset = 100,
              async = true,
            },
          },
        },
      },
    },
    require("plugins.lsp.lspsaga"),
    {
      "ray-x/lsp_signature.nvim",
      config = function()
        require("lsp_signature").setup()
      end,
    },
    {
      "aznhe21/actions-preview.nvim",
      config = function()
        require("actions-preview").setup()
      end,
      keys = {
        { "<leader>ca", function() require("actions-preview").code_actions() end, desc = "Code Actions" },
      },
    },
  }
}
