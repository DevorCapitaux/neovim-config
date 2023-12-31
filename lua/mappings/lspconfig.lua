return {
  n = {
    ['K'] = { vim.lsp.buf.hover, desc = 'Hover' },
    ['gD'] = { vim.lsp.buf.declaration, desc = 'Show declaration' },
    ['gd'] = { vim.lsp.buf.definition, desc = 'Show definition' },
    ['gi'] = { vim.lsp.buf.implementation, desc = 'Show implementation' },
    ['gr'] = { vim.lsp.buf.references, desc = 'Show references' },
    ['<F2>'] = { vim.lsp.buf.rename, desc = 'Rename' },
    ['<F4>'] = { vim.lsp.buf.code_action, desc = 'Code action' },
    ['gl'] = { vim.diagnostic.open_float, desc = 'Show diagnostic info' },
    ['[d'] = { vim.diagnostic.goto_next, desc = 'Show next diagnostic' },
    [']d'] = { vim.diagnostic.goto_prev, desc = 'Show prev diagnostic' },

    ['<leader>l'] = { name = 'Lsp' },
    ['<leader>lh'] = { vim.lsp.buf.hover, desc = 'Hover' },
    ['<leader>lD'] = { vim.lsp.buf.declaration, desc = 'Show declaration' },
    ['<leader>ld'] = { vim.lsp.buf.definition, desc = 'Show definition' },
    ['<leader>li'] = { vim.lsp.buf.implementation, desc = 'Show implementation' },
    ['<leader>lR'] = { vim.lsp.buf.references, desc = 'Show references' },
    ['<leader>ls'] = { vim.lsp.buf.signature_help, desc = 'Show signature_help' },
    ['<leader>lr'] = { vim.lsp.buf.rename, desc = 'Rename' },
    ['<leader>la'] = { vim.lsp.buf.code_action, desc = 'Code action' },
    ['<leader>ll'] = { vim.diagnostic.open_float, desc = 'Show diagnostic info' },
    ['<leader>ln'] = { vim.diagnostic.goto_next, desc = 'Show next diagnostic' },
    ['<leader>lp'] = { vim.diagnostic.goto_prev, desc = 'Show prev diagnostic' },
    ['<leader>lf'] = { vim.lsp.buf.format, desc = 'Format buffer' },
  },
  i = {
    ['<C-k>'] = { vim.lsp.buf.signature_help, desc = 'Show signature_help' },
  }
}
