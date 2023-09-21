return {
  i = {
    -- Moving cursor
    ['<C-j>'] = { '<Down>', desc = 'Move down' },
    ['<C-k>'] = { '<Up>', desc = 'Move up' },
    ['<C-h>'] = { '<Left>', desc = 'Move left' },
    ['<C-l>'] = { '<Right>', desc = 'Move right' },
    -- Enter normal mode (for the phone)
    -- ['jj'] = { '<Esc>', desc = 'Enter normal mode' },
  },
  n = {
    ['<C-q>'] = { '<cmd> q <CR>', desc = 'Quit' },
    ['<leader>q'] = { '<cmd> q <CR>', desc = 'Quit' },
    ['<leader>Q'] = { '<cmd> q! <CR>', desc = 'Force quit' },
    ['<Esc>'] = { '<cmd> nohl <CR>', desc = 'Clear highlights' },

    -- Scroll up/down
    ['<A-j>'] = { '<PageDown> zz', desc = 'Scroll down' },
    ['<A-k>'] = { '<PageUp> zz', desc = 'Scroll up' },

    -- Cycle through the windows
    ['<C-j>'] = { '<cmd> TmuxNavigateDown <CR>', desc = 'To window down' },
    ['<C-k>'] = { '<cmd> TmuxNavigateUp <CR>', desc = 'To window up' },
    ['<C-h>'] = { '<cmd> TmuxNavigateLeft <CR>', desc = 'To window left' },
    ['<C-l>'] = { '<cmd> TmuxNavigateRight <CR>', desc = 'To window right' },

    ['<leader>s'] = { name = 'Split' },
    ['<leader>sv'] = { '<C-w>v', desc = 'Split window verticaly' },
    ['<leader>sh'] = { '<C-w>s', desc = 'Split window horizontaly' },
  },
  t = {
    ['<Esc>'] = { '<C-\\><C-n>', desc = 'Enter normal mode' },
  },
  -- Mappings with more then one mode
  other = {
    ['<C-s>'] = { '<Esc><cmd> w <CR>', mode = { 'i', 'n' }, desc = 'Save file' },
  },
}
