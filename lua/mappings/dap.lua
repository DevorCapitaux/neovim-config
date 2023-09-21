local dap = require('dap')
local dap_ui = require('dapui')
local dap_ui_wgts = require('dap.ui.widgets')

return {
  n = {
    ['<leader>d'] = { name = 'Debugger' },
    ['<leader>db'] = { dap.toggle_breakpoint, desc = 'Toggle breakpoint' },
    ['<leader>dB'] = { dap.clear_breakpoints, desc = 'Clear breakpoints' },
    ['<leader>di'] = { dap.step_into, desc = 'Step into' },
    ['<leader>do'] = { dap.step_over, desc = 'Step over' },
    ['<leader>dc'] = { dap.continue, desc = 'Start/Continue' },
    ['<leader>ds'] = { dap.run_to_cursor, desc = 'Run to cursor' },
    -- ['<leader>dQ'] = { dap.terminate, desc = 'Terminate session' },
    ['<leader>dQ'] = { function()
      dap.terminate()
      dap_ui.close()
      vim.cmd('sleep 50ms')
      dap.repl.close()
    end, desc = 'Terminate session' },
    ['<leader>dC'] = {
      function()
        vim.ui.input({ prompt = 'Condition: ' }, function(condition)
          if condition then
            dap.set_breakpoint(condition)
          end
        end)
      end, desc = 'Set breakpoint with condition' },
    ['<leader>du'] = { dap_ui.toggle, desc = 'Toggle Debugger UI' },
    ['<leader>dh'] = { dap_ui_wgts.hover, desc = 'Debugger hover' },
  },
}
