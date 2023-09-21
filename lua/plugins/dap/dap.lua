return {
  'rcarriga/nvim-dap-ui',
  dependencies = {
    'mfussenegger/nvim-dap',
    { 'theHamsta/nvim-dap-virtual-text', config = true, },
    { 'LiadOz/nvim-dap-repl-highlights', config = true, },
  },
  ft = {
    'c', 'cpp', 'rust',
    'python',
    'bash',
  },
  config = function()
    local dap = require('dap')
    local dap_ui = require('dapui')

    dap_ui.setup {
      floating = {
        border = 'rounded'
      },
    }

    dap.defaults.fallback.external_terminal = {
      command = '/usr/bin/kitty',
    }
    dap.defaults.fallback.focus_terminal = true

    dap.listeners.after.event_initialized['dapui_config'] = function() dap_ui.open() end

    vim.fn.sign_define(
      'DapBreakpoint',
      { text = '●' }
    )

    vim.fn.sign_define(
      'DapBreakpointCondition',
      { text = '◆' }
    )

    -- Importing configuration for a filetype
    require('plugins.dap.configuration.conf_bash')
    require('plugins.dap.configuration.conf_lldb')
    require('plugins.dap.configuration.conf_py')

    require('core.utils').load_mappings('dap')
  end,
}
