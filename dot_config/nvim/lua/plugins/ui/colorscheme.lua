return {
  -- 使用中のカラースキームのみ即時読み込み
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require('kanagawa').setup({
        compile = true,   -- コンパイルを有効化して高速化
        undercurl = true,
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = true,
        dimInactive = false,
        terminalColors = true,
        theme = "wave",
        background = {
          dark = "dragon",
        },
      })
      vim.cmd("colorscheme kanagawa")
    end,
  },
  -- 以下は必要な時だけ読み込む
  { "folke/tokyonight.nvim", lazy = true },
  { "EdenEast/nightfox.nvim", lazy = true },
  { "nyoom-engineering/nyoom.nvim", lazy = true },
  { "nyoom-engineering/oxocarbon.nvim", lazy = true },
  { "bluz71/vim-nightfly-colors", lazy = true },
  { "bluz71/vim-moonfly-colors", lazy = true },
  { "savq/melange-nvim", lazy = true },
  { "AlexvZyl/nordic.nvim", lazy = true },
  { "mcchrish/zenbones.nvim", lazy = true, dependencies = { "rktjmp/lush.nvim" } },
  { "craftzdog/solarized-osaka.nvim", lazy = true },
  { "catppuccin/nvim", name = "catppuccin", lazy = true },
}
