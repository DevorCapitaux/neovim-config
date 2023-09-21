local icons = require('core.icons')

return {
  'lewis6991/gitsigns.nvim',
  enabled = vim.fn.executable 'git' == 1,
  event = 'VeryLazy',
  opts = {
    signs = {
      add = { text = icons.git.sign },
      change = { text = icons.git.sign },
      delete = { text = icons.git.sign },
      topdelete = { text = icons.git.sign },
      changedelete = { text = icons.git.sign },
      untracked = { text = icons.git.sign },
    },
    -- worktrees = vim.g.git_worktrees,
  }
}
