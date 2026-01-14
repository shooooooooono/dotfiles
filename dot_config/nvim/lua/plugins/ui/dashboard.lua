return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('dashboard').setup({
      theme = 'hyper',
      config = {
        week_header = {
          enable = true,
        },
        shortcut = {
          {
            desc = '󰱼 Find',
            group = '@property',
            key = 'f',
            action = 'lua Snacks.picker.files()',
          },
          {
            desc = '󰺮 Grep',
            group = 'Label',
            key = 'g',
            action = 'lua Snacks.picker.grep()',
          },
          {
            desc = ' Config',
            group = 'Number',
            key = 'c',
            action = 'e ~/.config/nvim/init.lua',
          },
          {
            desc = '󰒲 Lazy',
            group = '@function',
            key = 'l',
            action = 'Lazy',
          },
          {
            desc = '󰈆 Quit',
            group = 'DiagnosticError',
            key = 'q',
            action = 'qa',
          },
        },
        project = {
          enable = true,
          limit = 5,
          icon = ' ',
          label = ' Recent Projects:',
          action = 'lua Snacks.picker.files({ cwd = "%s" })',
        },
        mru = {
          limit = 8,
          icon = ' ',
          label = ' Recent Files:',
          cwd_only = false,
        },
        footer = {
          '',
          '🐧 Have a nice coding! ✨',
        },
      },
    })
  end,
}
