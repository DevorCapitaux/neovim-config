return {
  'williamboman/mason.nvim',
  cmd = {
    'Mason',
    'MasonInstall',
    'MasonInstallAll',
    'MasonUninstall',
    'MasonUninstallAll',
    'MasonUpdate',
    'MasonLog',
  },
  config = function()
    local g = vim.g

    require('mason').setup {
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        }
      }
    }

    vim.api.nvim_create_user_command('MasonInstallAll', function()
      if g.mason_ensure_installed == nil then
        return
      elseif type(g.mason_ensure_installed) ~= 'table' then
        vim.notify('`mason_ensure_installed` varible must be a table',
          vim.log.levels.ERROR)
        return
      end

      local stdpath = vim.fn.stdpath('data')
      local mason_dir = stdpath .. '/mason/packages'

      local files = io.popen('ls ' .. mason_dir)
      if files == nil then
        vim.notify('Can\'t access mason packages directory',
          vim.log.levels.ERROR)
        return
      end

      local installed = {}
      for file in files:lines() do
        table.insert(installed, file)
      end
      files:close()

      local to_install = {}
      for _, pkg in pairs(g.mason_ensure_installed) do
        local found = false
        for _, file in pairs(installed) do
          if file == pkg then
            found = true
            break
          end
        end
        if not found then
          table.insert(to_install, pkg)
        end
      end

      if next(to_install) == nil then
        vim.notify('Nothing to install', vim.log.levels.INFO)
      else
        vim.cmd('MasonInstall ' .. table.concat(to_install, ' '))
      end
    end, {})
  end,
}
