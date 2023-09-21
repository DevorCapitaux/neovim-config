return {
  'neovim/nvim-lspconfig',
  dependencies = 'williamboman/mason.nvim',
  config = function()
    local lspconfig = require('lspconfig')

    local lsp_defaults = {
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
      on_attach = require('core.defaults').on_attach
    }

    -- Extend lsp config with cmp caps and core.defaults
    lspconfig.util.default_config = vim.tbl_deep_extend(
      'force',
      lspconfig.util.default_config,
      lsp_defaults
    )

    -- Diagnostic options
    vim.diagnostic.config {
      virtual_text = false,
      severity_sort = true,
      float = {
        border = 'rounded',
        source = 'always',
      },
    }

    local sign = function(opts)
      vim.fn.sign_define(opts.name, {
        texthl = opts.name,
        text = opts.text,
        numhl = ''
      })
    end

    -- Set diagnostic icons
    sign({ name = 'DiagnosticSignError', text = '󰅙' })
    sign({ name = 'DiagnosticSignWarn', text = '󰋼' })
    sign({ name = 'DiagnosticSignHint', text = '󰌵' })
    sign({ name = 'DiagnosticSignInfo', text = '' })

    -- Set rounded border for the hover popup
    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
      vim.lsp.handlers.hover,
      { border = 'rounded' }
    )

    -- Set rounded border for the sig_help popup
    vim.lsp.handlers['textDocument/signature_help'] = vim.lsp.with(
      vim.lsp.handlers.signature_help,
      { border = 'rounded' }
    )

    ------------------------------------------------------------
    -- LSP Servers configurations
    ------------------------------------------------------------
    lspconfig.clangd.setup {}         -- C & C++
    lspconfig.rust_analyzer.setup {}  -- Rust
    lspconfig.asm_lsp.setup {}        -- Assembly
    lspconfig.bashls.setup {}         -- Bash
    lspconfig.pyright.setup {}        -- Python
    lspconfig.html.setup {}           -- HTML
    lspconfig.cssls.setup {}          -- CSS & SCSS & LESS
    lspconfig.lemminx.setup {}        -- XML
    lspconfig.cmake.setup {}          -- Cmake
    lspconfig.yamlls.setup {}         -- Yaml
    lspconfig.jsonls.setup {}         -- JSON

    -- Lua
    lspconfig.lua_ls.setup {
      settings = {
        Lua = {
          diagnostics = {
            globals = {
              'vim',
              'ls', 's', 'sn', 't', 'i', 'f',
              'd', 'fmt', 'fmta', 'rep'
            },
          },
          telemetry = { enable = false }
        }
      }
    }
  end,
}
