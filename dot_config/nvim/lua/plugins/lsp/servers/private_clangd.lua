-- .ino を C++ として認識
vim.filetype.add({
  extension = {
    ino = "cpp",
  },
})

vim.lsp.config('clangd', {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=iwyu",
    "--completion-style=detailed",
    "--function-arg-placeholders=true",
  },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
})
