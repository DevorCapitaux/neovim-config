return {
  {
    'simrat39/rust-tools.nvim',
    dependencies = 'neovim/nvim-lspconfig',
    ft = 'rust',
    config = true,
  },
  {
    'saecki/crates.nvim',
    ft = { 'rust', 'toml' },
    config = true,
  }
}
