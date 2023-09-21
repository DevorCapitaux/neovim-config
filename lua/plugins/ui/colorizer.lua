return {
  'NvChad/nvim-colorizer.lua',
  cmd = 'ColorizerToggle',
  init = function()
    require('core.utils').load_mappings('colorizer')
  end,
  opts = {
    filetypes = {
      'html', 'css', 'javascript',
    },
    user_default_options = { names = false },
  },
}
