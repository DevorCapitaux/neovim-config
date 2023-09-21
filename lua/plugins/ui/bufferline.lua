return {
  'akinsho/bufferline.nvim',
  dependencies = 'nvim-tree/nvim-web-devicons',
  init = function()
    require('core.utils').load_mappings('bufferline')
  end,
  config = function()
    require('bufferline').setup {
      options = {
        separator_style = 'slope',
        indicator = {
          style = 'underline'
        },
        diagnostics = 'nvim_lsp',
        offsets = {
          {
            filetype = 'NvimTree',
          },
        },
      },
      highlights = require('catppuccin.groups.integrations.bufferline').get()
    }
  end,
}
