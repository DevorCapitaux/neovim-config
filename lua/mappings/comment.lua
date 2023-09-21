return {
  n = {
    ['<leader>/'] = {
      function()
        require('Comment.api').toggle.linewise.current()
      end,
      desc = 'Toggle comment',
    },
  },

  v = {
    ['<leader>/'] = {
      '<Esc><cmd> lua require(\'Comment.api\').toggle.linewise(vim.fn.visualmode()) <CR>',
      desc = 'Toggle comment',
    },
  },
}
