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

    -- Enable LSP servers
    vim.lsp.enable({ 'gopls', 'lua_ls', 'clangd', 'rust_analyzer' })
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
          ensure_installed = { "lua_ls" },
        })
      end,
    },
    { "hrsh7th/cmp-nvim-lsp" },
    {
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      config = function()
        local lspkind = require("lspkind")
        local cmp = require("cmp")

        lspkind.init({
          symbol_map = {
            Copilot = "",
          }
        })

        cmp.setup({
          snippet = {
            expand = function(args)
              vim.fn["vsnip#anonymous"](args.body)
            end,
          },
          sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "buffer" },
            { name = "path" },
            -- { name = 'nvim_lsp_signature_help' },
            { name = 'copilot' },
          }),
          window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
          },
          formatting = {
            format = lspkind.cmp_format({
              with_text = true,
              mode = "symbol_text",
            }),
          },
          mapping = cmp.mapping.preset.insert({
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            ["<C-n>"] = cmp.mapping.select_next_item(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
            ['<C-Space>'] = cmp.mapping.complete(),
          }),
        })
      end,
      dependencies = {
        "hrsh7th/cmp-vsnip",
        "hrsh7th/vim-vsnip",
        "onsails/lspkind.nvim",
        "zbirenbaum/copilot-cmp"
      }
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
