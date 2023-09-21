local M = {}

M.lazy_opts = {
  install = {
    missing = true,
    colorscheme = { 'catppuccin' },
  },
  change_detection = {
    notify = false,
  },
  performance = {
    cache = {
      enabled = true,
    },
    rtp = {
      disabled_plugins = {
        'netrw', 'netrwPlugin', 'netrwSettings', 'netrwFileHandlers',
        'syntax',
      },
    },
  },
}

M.map_opts = {
  silent = true,
  noremap = true,
}

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
M.on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  require('core.utils').load_mappings('lspconfig', { buffer = bufnr })

  -- Enable autoformatting
  if client.supports_method('textDocument/formatting') and vim.g.autoformat then
    local filetype = vim.api.nvim_get_option_value('filetype', { buf = bufnr })
    -- If the filetype is in the ignore list then return
    for _, ft in pairs(vim.g.autoformat_ignore) do
      if ft == filetype then
        return
      end
    end

    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format { async = false }
      end
    })
  end
end

return M
