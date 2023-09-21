return {
  n = {
    -- ['<leader>c'] = { '<cmd> ColorizerToggle <CR>', desc = 'Toggle colorizer' },
    ['<leader>c'] = { name = 'Colorizer' },
    ['<leader>cc'] = { '<cmd> ColorizerToggle <CR>', desc = 'Toggle colorizer' },
    ['<leader>cf'] = { function()
      require('colorizer').setup {
        user_default_options = { mode = 'foreground' }
      }
      vim.cmd('ColorizerToggle')
    end, desc = 'Set mode `foreground`' },
    ['<leader>cb'] = { function()
      require('colorizer').setup {
        user_default_options = { mode = 'background' }
      }
      vim.cmd('ColorizerToggle')
    end, desc = 'Set mode `background`' },
  }
}
