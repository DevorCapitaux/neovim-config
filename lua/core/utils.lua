local U = {}
local defaults = require('core.defaults')
local icons = require('core.icons')
local merge_tbl = vim.tbl_deep_extend

U.set_indent_for_ft = function(indent, ft_tbl)
  assert(type(indent) == 'number', '`indent` option must be number')
  assert(type(ft_tbl) == 'table', '`ft_tbl` option must be table')

  local au = string.format(
    'au FileType %s setl tabstop=%d softtabstop=%d shiftwidth=%d %sexpandtab',
    table.concat(ft_tbl, ','), indent, indent, indent,
    indent == 8 and 'no' or '')

  vim.cmd(au)
end

U.dissable_autocomment = function()
  vim.cmd('au FileType * set fo-=ro')
end

U.load_mappings = function(plugin, map_opts)
  vim.schedule(function()
    local function set_mappings(mappings)
      for mode, maps in pairs(mappings) do
        for map, opts in pairs(maps) do
          -- Merge all map options
          opts = merge_tbl('force', defaults.map_opts, opts or {})
          opts = merge_tbl('force', opts, map_opts or {})

          -- Get cmd
          local cmd = opts[1]
          opts[1] = nil

          -- If there are multiple mods for the map
          if mode == 'other' then
            mode = opts['mode'] or 'n'
            opts['mode'] = nil
          end

          if not cmd and opts.name then
            -- Get and set icon if it exists
            local group_icon = icons.which_key[opts.name]
            if group_icon then
              opts.name = group_icon .. ' ' .. opts.name
            end

            U.add_which_key_group(map, opts)
          else
            -- Set mapping
            vim.keymap.set(mode, map, cmd, opts)
          end
        end
      end
    end

    local map_path = 'mappings'
    if type(plugin) == 'string' then
      map_path = map_path .. '.' .. plugin
    end

    -- Loading mappings from file
    local ok, res = pcall(require, map_path)
    if not ok then
      vim.notify('Module `' .. map_path .. '` wasn\'t found',
        vim.log.levels.ERROR)
    else
      set_mappings(res)
    end
  end)
end

U.add_which_key_group = function(map, opts)
  local wk = require('which-key')
  wk.register({ [map] = opts })
end

U.load_plugin_manager = function()
  local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable', -- latest stable release
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)

  require('lazy').setup({
    { import = 'plugins' },
    { import = 'plugins.ui' },
    { import = 'plugins.lsp' },
    { import = 'plugins.completions' },
    { import = 'plugins.dap' },
  }, defaults.lazy_opts)
end

U.autoreload_on_disk_change = function()
  vim.opt.autoread = true
  vim.api.nvim_create_autocmd({ 'BufEnter', 'FocusGained', 'CursorHold', 'CursorHoldI' }, {
    pattern = '*',
    callback = function()
      if vim.api.nvim_get_mode()['mode'] ~= 'c' then
        vim.cmd.checktime()
      end
    end
  })
  -- Get notified when the buffer reloads
  vim.api.nvim_create_autocmd({ 'FileChangedShellPost' },{
    pattern = '*',
    callback = function()
      vim.notify('File changed on disk. Buffer reloaded.', vim.log.levels.WARN)
    end
  })
end

-- Close and wipe current buffer without messing the layout
U.bw = function()
  local api = vim.api
  local bo = vim.bo

  -- Get current buffer
  local cur_buf = api.nvim_get_current_buf()

  -- Find current buffer window
  local window = nil
  for _, win in pairs(vim.api.nvim_list_wins()) do
    if api.nvim_win_get_buf(win) == cur_buf then
      window = win
      break
    end
  end

  if window == nil then
    vim.notify('core.utils.bw: Window is nil!', vim.log.levels.ERROR)
    return
  end

  -- Get table of other opened buffers
  local other_buffers = vim.tbl_filter(
    function(buf)
      return api.nvim_buf_is_valid(buf) and bo[buf].buflisted and buf ~= cur_buf
    end,
    api.nvim_list_bufs()
  )

  -- Switch to last used buffer or create new one
  local switch_buffer

  if #other_buffers > 0 then
    local lastused = -1

    for _, buf in pairs(other_buffers) do
      local bufinfo = vim.fn.getbufinfo(buf)[1]
      if bufinfo.lastused > lastused then
        switch_buffer = buf
        lastused = bufinfo.lastused
      end
    end
  else
    switch_buffer = api.nvim_create_buf(true, false)

    if switch_buffer == 0 then
      vim.notify('core.utils.bw: Failed to create buffer')
      return
    end
  end

  api.nvim_win_set_buf(window, switch_buffer)

  if api.nvim_buf_is_valid(cur_buf) then
    vim.cmd.bwipeout({ count = cur_buf, bang = false })
  end
end

return U
