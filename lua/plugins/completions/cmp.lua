return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    {
      'L3MON4D3/LuaSnip',
      dependencies = 'rafamadriz/friendly-snippets',
      opts = {
        history = true,
        updateevents = 'TextChanged, TextChangedI'
      }
    },
    {
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'rcarriga/cmp-dap',
    },
  },
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    local icons = require('core.icons')

    -- cmp menu height
    vim.opt.pumheight = 12

    cmp.setup {
      enabled = function()
        return vim.api.nvim_buf_get_option(0, 'buftype') ~= 'prompt'
          or require('cmp_dap').is_dap_buffer()
      end,
      snippet = {
        expand = function(args) luasnip.lsp_expand(args.body) end
      },
      window = {
        completion = {
          border = 'rounded',
          scrollbar = true,
        },
        documentation = {
          border = 'rounded',
          max_width = 65,
          max_height = 24,
        },
      },
      formatting = {
        fields = { 'menu', 'abbr', 'kind' },
        format = function(entry, item)
          item.kind = string.format('%s %s', icons.kind[item.kind], item.kind)
          item.menu = icons.menu[entry.source.name]
          return item
        end,
      },
      mapping = cmp.mapping.preset.insert(require('mappings.cmp')),
      sources = cmp.config.sources {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'nvim_lua' },
        { name = 'path' },
        { name = 'crates' },
      },
    }

    cmp.setup.filetype({ 'dap-repl', 'dapui_watches', 'dapui_hover' }, {
      sources = {
        { name = 'dap' },
      },
    })
  end,
}
