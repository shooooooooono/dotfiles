-- Plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end

vim.opt.runtimepath:prepend(lazypath)

local plugins = {
  -----------------------------------------------------------
  -- git
  -----------------------------------------------------------
  { import = "plugins.util.git" },
  -----------------------------------------------------------
  -- lsp & completion
  -----------------------------------------------------------
  { import = "plugins.lsp.lsp-config" },
  { import = "plugins.lsp.none-ls" },
  { import = "plugins.lsp.trouble-nvim" },
  -----------------------------------------------------------
  -- AI
  -----------------------------------------------------------
  { import = "plugins.ai" },
  -----------------------------------------------------------
  -- ui
  -----------------------------------------------------------
  { import = "plugins.ui" },
  -----------------------------------------------------------
  -- treesitter
  -----------------------------------------------------------
  { import = "plugins.treesitter" },
  -----------------------------------------------------------
  -- util tool
  -----------------------------------------------------------
  { import = "plugins.util" },
  -----------------------------------------------------------
  -- debugger & dap
  -----------------------------------------------------------
  { import = "plugins.dap.dap" },
}

require("lazy").setup(plugins, {})
