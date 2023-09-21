return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = 'windwp/nvim-ts-autotag',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = vim.g.ts_ensure_installed,

      highlight = { enable = true },
      indent = { enable = true },
      autotag = { enable = true },
    }
  end,
}
