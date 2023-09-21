return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        compile_path = vim.fn.stdpath('cache') .. '/catppuccin',
        integrations = {
          noice = true,
        },
        highlight_overrides = {
          all = function(colors)
            return {
              -- IndentBlankline highlights
              IndentBlanklineContextStart = {
                bg = colors.surface0,
                sp = '', style = {}
              },

              -- Alpha Colors
              AlphaViuim1 = { fg = colors.sapphire, bg = colors.mantle },
              AlphaViuim2 = { fg = colors.mauve, bg = colors.mantle },
              AlphaViuim3 = { fg = colors.blue, bg = colors.mantle },
              AlphaViuim4 = { fg = colors.green, bg = colors.mantle },
              AlphaViuim5 = { fg = colors.sapphire, bg = colors.mantle },
              AlphaViuim6 = { fg = colors.teal, bg = colors.mantle },
            }
          end
        }
      }

      if vim.g.colorscheme == 'catppuccin' then
        vim.cmd.colorscheme 'catppuccin'
      end
    end
  },
}
