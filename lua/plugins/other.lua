return {
  {
    'christoomey/vim-tmux-navigator',
    lazy = false,
  },
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    keys = { '<leader>', '"', '\'', '`', 'c', 'v' },
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      icons = {
        group = '',
      }
    },
  },
}
