return {
  'nvim-tree/nvim-tree.lua',
  cmd = { 'NvimTreeToggle', 'NvimTreeFocus' },
  init = function()
    require('core.utils').load_mappings('nvim-tree')
  end,
  opts = {
    disable_netrw = true,
    select_prompts = true,
    filters = {
      git_ignored = false,
    },
    view = {
      preserve_window_proportions = true,
    },
    update_focused_file = {
      enable = true,
    },
  },
}
