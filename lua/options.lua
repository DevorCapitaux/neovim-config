local utils = require('core.utils')

local opt = vim.opt
local g = vim.g

g.colorscheme = 'catppuccin'
g.mapleader = ' '

-- Set autoformat to true to enable it for all available filetypes
-- or to a table to use it only for specified filetypes
-- g.autoformat = true
g.autoformat = { 'rust', }
-- Use autoformat_ignore to exclude filetypes from autoformat list
-- g.autoformat_ignore = { 'cs', 'c', }

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.colorcolumn = '80'
opt.scrolloff = 8
opt.breakindent = true
opt.linebreak = true

-- Search options
opt.ignorecase = true
opt.smartcase = true

opt.mouse = 'a'
opt.undofile = true
opt.clipboard = 'unnamedplus'
opt.hidden = true
opt.synmaxcol = 240
opt.termguicolors = true

-- Splits
opt.splitbelow = true
opt.splitright = true
opt.equalalways = false

-- Set default indention
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- Set 2-spaaces indention for certain filetypes
utils.set_indent_for_ft(2, {
  'lua', 'python',
})

-- Set actual tabs for certain filetypes
utils.set_indent_for_ft(8, {
  'asm',
})

-- Disable autocomment on next line
utils.dissable_autocomment()

utils.autoreload_on_disk_change()

-- Adding more filetype associations
vim.filetype.add {
  extension = {
    sh = 'bash',
    axaml = 'xml',
    xaml = 'xml',
  }
}

g.mason_ensure_installed = {
  -- LSP
  'lua-language-server', 'bash-language-server', 'pyright',
  'rust-analyzer',
  'clangd', 'cmake-language-server',
  'asm-lsp',
  'html-lsp', 'css-lsp', 'lemminx',
  'yaml-language-server', 'json-lsp',
  -- 'ltex-ls',
  -- 'omnisharp',

  -- Formatters
  'clang-format',

  -- DAP
  'bash-debug-adapter',
  'codelldb',
  'debugpy',
}

g.ts_ensure_installed = {
  'rust', 'toml',
  'c', 'cpp', 'c_sharp',
  'make', 'cmake', 'meson', 'ninja',
  'python', 'lua',
  'bash', 'fish', 'strace',
  'html', 'css', 'scss',
  'yaml', 'json', 'xml',
  'dockerfile', 'sql',
  'markdown', 'latex',
  'dap_repl',
  'vim', 'regex', 'markdown_inline',
}
