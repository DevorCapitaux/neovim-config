return {
  'numToStr/Comment.nvim',
  keys = {
    { 'gcc', mode = 'n' },
    { 'gc', mode = 'v' },
    { 'gbc', mode = 'n' },
    { 'gb', mode = 'v' },
  },
  init = function()
    require('core.utils').load_mappings('comment')
  end,
  config = true,
}
