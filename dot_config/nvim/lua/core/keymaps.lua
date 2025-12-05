-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Clear search highlighting
map("n", "<ESC><ESC>", ":nohl<CR>")

-- Fast saving
map("n", "<leader>s", ":w<CR>")

-----------------------------------------------------------
-- Terminal
-----------------------------------------------------------
map("n", "<C-t>", ":Term<CR>", { noremap = true })
map("t", "jk", "<C-\\><C-n>")

-----------------------------------------------------------
-- LSP
-----------------------------------------------------------
map("n", "gd", vim.lsp.buf.definition)

local function format()
  vim.lsp.buf.format({ async = true })
end
map("n", "<leader>fm", format)

-----------------------------------------------------------
-- Buffer
-----------------------------------------------------------
map("n", "<Tab>", ":bnext<CR>")
map("n", "<S-Tab>", ":bprevious<CR>")

-----------------------------------------------------------
-- Copy file path with line numbers (for Claude Code context)
-----------------------------------------------------------
map("v", "Y", function()
  local start_line = vim.fn.line("v")
  local end_line = vim.fn.line(".")
  if start_line > end_line then
    start_line, end_line = end_line, start_line
  end
  local file_path = vim.fn.expand("%:.")
  local result
  if start_line == end_line then
    result = file_path .. ":" .. start_line
  else
    result = file_path .. ":" .. start_line .. "-" .. end_line
  end
  vim.fn.setreg("+", result)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
  print("Copied: " .. result)
end)
