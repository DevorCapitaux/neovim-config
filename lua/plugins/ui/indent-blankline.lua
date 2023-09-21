return {
  'lukas-reineke/indent-blankline.nvim',
  config = function()
    require('indent_blankline').setup {
      show_current_context = true,
      show_current_context_start = true,
      char = '┆',
      context_char = '┆',
      use_treesitter = true,
      show_trailing_blankline_indent = false,
      show_first_indent_level = false,
    }
  end,
}
