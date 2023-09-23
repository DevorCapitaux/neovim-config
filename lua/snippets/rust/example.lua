return {
  require('luasnip').snippet(
    { -- Table 1: snippet parameters
      trig = 'hi',
      dscr = 'Expands to `Hello, World!`',
    },
    { -- Table 2: snippet nodes
      t('Hello, World!'),
    }
    -- Table 3: advanced snippet options
  )
}
