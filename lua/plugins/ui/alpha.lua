return {
  'goolord/alpha-nvim',
  config = function()
    require('alpha').setup (
      require('plugins.ui.alpha-themes.viuim').config
    )
  end,
}
