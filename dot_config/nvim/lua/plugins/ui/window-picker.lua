return {
  's1n7ax/nvim-window-picker',
  config = function()
    require("window-picker").setup({
      hint = "floating-big-letter",
      filter_rules = {
        include_current_win = false,
        autoselect_one = true,
        -- filter using buffer options
        bo = {
          -- if the file type is one of following, the window will be ignored
          filetype = { 'NvimTree', 'neo-tree', 'notify', 'snacks_notif', 'Avante', 'AvanteInput', "AvanteSelectedFiles" },
          -- if the buffer type is one of following, the window will be ignored
          buftype = { "terminal", "quickfix" },
        },
      },
    })
  end
}
