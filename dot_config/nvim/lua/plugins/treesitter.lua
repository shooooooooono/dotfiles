return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-context",
  },
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "go",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "regex",
        "rust",
        "toml",
        "vim",
        "yaml",
        "diff"
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      autotag = {
        enable = true,
      },
    })

    require("treesitter-context").setup({
      enable = true,
    })
  end,
}
