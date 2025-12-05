-----------------------------------------------------------
-- Autocommand functions
-----------------------------------------------------------
-- Normal mode になったときに、英語のIMEに切り替える
if vim.loop.os_uname().sysname == "Linux" then
  vim.api.nvim_create_autocmd("InsertLeave", {
    callback = function()
      if vim.fn.system("fcitx5-remote") == "2\n" then
        vim.fn.system("fcitx5-remote -c")
      end
    end
  })
end
