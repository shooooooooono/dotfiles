return {
  "luukvbaal/statuscol.nvim",
  config = function()
    local builtin = require('statuscol.builtin')
    require('statuscol').setup({
      ft_ignore = { "NvimTree" },
      relculright = true,
      segments = {
        {
          sign = { namespace = { "diagnostic" }, maxwidth = 1, auto = false },
          click = "v:lua.ScSa"
        },
        {
          text = { builtin.lnumfunc },
        },
        {
          sign = {
            namespace = { 'gitsigns' },
            maxwidth = 1,
            colwidth = 1,
            wrap = true,
          },
        },
      },
    })
  end
}
