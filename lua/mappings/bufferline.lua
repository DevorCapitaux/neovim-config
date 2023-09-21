return {
  n = {
    ['<Tab>'] = { '<cmd> BufferLineCycleNext <CR>', desc = 'Next buffer' },
    ['<S-Tab>'] = { '<cmd> BufferLineCyclePrev <CR>', desc = 'Prev buffer' },

    ['<leader>b'] = { name = 'Buffers' },
    ['<leader>bx'] = { require('core.utils').bw, desc = 'Close current buffer' },
    ['<leader>bn'] = { '<cmd> BufferLineCycleNext <CR>', desc = 'Next buffer' },
    ['<leader>bp'] = { '<cmd> BufferLineCyclePrev <CR>', desc = 'Prev buffer' },
    ['<leader>bP'] = { '<cmd> BufferLineTogglePin <CR>', desc = 'Pin' },

    ['<leader>bm'] = { name = 'Move' },
    ['<leader>bml'] = { '<cmd> BufferLineMoveNext <CR>', desc = 'Move right' },
    ['<leader>bmh'] = { '<cmd> BufferLineMovePrev <CR>', desc = 'Move left' },

    ['<leader>bc'] = { name = 'Close' },
    ['<leader>bch'] = { '<cmd> BufferLineCloseLeft <CR>', desc = 'Close left' },
    ['<leader>bcl'] = { '<cmd> BufferLineCloseRight <CR>', desc = 'Close right' },
    ['<leader>bco'] = { '<cmd> BufferLineCloseOthers <CR>', desc = 'Close others' },
    ['<leader>bcp'] = { '<cmd> BufferLinePickClose <CR>', desc = 'Pick & close' },

    ['<leader>bs'] = { name = 'Sort' },
    ['<leader>bsd'] = { '<cmd> BufferLineSortByDirectory <CR>', desc = 'Sort by directory' },
    ['<leader>bse'] = { '<cmd> BufferLineSortByExtension <CR>', desc = 'Sort by extension' },
  }
}
