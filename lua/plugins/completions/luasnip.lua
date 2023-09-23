return {
  'L3MON4D3/LuaSnip',
  dependencies = 'rafamadriz/friendly-snippets',
  lazy = true,
  config = function()
    require('luasnip').setup {
      history = true,
      update_events = { 'TextChanged', 'TextChangedI' },
      -- enable_autosnippets = true,
    }
    -- Load VSCode snippets
    require('luasnip.loaders.from_vscode').lazy_load()
  end,
}
