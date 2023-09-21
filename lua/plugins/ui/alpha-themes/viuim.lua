local default_header = {
  type = 'text',
  val = {
    [[                             █]],
    [[  █▀▀▀▄   ▄▄▄▄   ███  █    █    ██   ██]],
    [[ █    █  █    █ █   █  █  █  █ █  █ █  █]],
    [[ █    █  ▀▄▄▄▀ █   █  █  █  █ █   █▀  █]],
    [[  █    █  █     ███    ██   █ █       █]],
    [[           ▀▀▀]],
  },
  opts = {
    position = 'center',
    -- hl = 'Operator',
    hl = {
      -- Column 1
      { -- hl group | start | end (col)
        { 'AlphaViuim5', 28, 32 },  -- i
      },
      -- Column 2
      {
        { 'AlphaViuim1', 1, 17 },   -- n
        { 'AlphaViuim2', 19, 32 },  -- e
        { 'AlphaViuim3', 34, 44 },  -- o
        { 'AlphaViuim4', 45, 49 },  -- v
        { 'AlphaViuim4', 52, 56 },  -- v
        { 'AlphaViuim6', 59, 66 },  -- m
        { 'AlphaViuim6', 68, 75 },  -- m
      },
      -- Column 3
      {
        { 'AlphaViuim1', 0, 4 },    -- n
        { 'AlphaViuim1', 7, 11 },   -- n
        { 'AlphaViuim2', 12, 16 },  -- e
        { 'AlphaViuim2', 19, 23 },  -- e
        { 'AlphaViuim3', 23, 33 },  -- o
        { 'AlphaViuim4', 34, 38 },  -- v
        { 'AlphaViuim4', 39, 43 },  -- v
        { 'AlphaViuim5', 44, 48 },  -- i
        { 'AlphaViuim6', 48, 52 },  -- m
        { 'AlphaViuim6', 53, 61 },  -- m
        { 'AlphaViuim6', 62, 69 },  -- m
      },
      -- Column 4
      {
        { 'AlphaViuim1', 0, 4 },    -- n
        { 'AlphaViuim1', 7, 11 },   -- n
        { 'AlphaViuim2', 12, 28 },  -- e
        { 'AlphaViuim3', 28, 38 },  -- o
        { 'AlphaViuim4', 39, 43 },  -- v
        { 'AlphaViuim4', 44, 48 },  -- v
        { 'AlphaViuim5', 49, 53 },  -- i
        { 'AlphaViuim6', 53, 57 },  -- m
        { 'AlphaViuim6', 59, 66 },  -- m
        { 'AlphaViuim6', 67, 74 },  -- m
      },
      -- Column 5
      {
        { 'AlphaViuim1', 1, 5 },    -- n
        { 'AlphaViuim1', 8, 12 },   -- n
        { 'AlphaViuim2', 13, 17 },  -- e
        { 'AlphaViuim3', 21, 31 },  -- o
        { 'AlphaViuim4', 34, 41 },  -- v
        { 'AlphaViuim5', 43, 47 },  -- i
        { 'AlphaViuim6', 47, 51 },  -- m
        { 'AlphaViuim6', 57, 61 },  -- m
      },
      -- Column 6
      {
        { 'AlphaViuim2', 10, 20 },  -- e
      },
    },
  }
}

local leader = 'SPC'

local function button(map_name, desc, cmd, map_opts)
  local map = map_name:gsub('%s', ''):gsub(leader, '<leader>')

  local opts = {
    position = 'center',
    shortcut = map_name,
    cursor = 3,
    width = 50,
    align_shortcut = 'right',
    hl_shortcut = 'Keyword',
  }

  if cmd then
    map_opts = vim.tbl_deep_extend('force', { noremap = true,
    silent = true, nowait = true}, map_opts or {})
    opts.keymap = { 'n', map, cmd, map_opts }
  end

  local function on_press()
    local key = vim.api.nvim_replace_termcodes(cmd or
    map .. '<Ignore>', true, false, true)
    vim.api.nvim_feedkeys(key, 't', false)
  end

  return {
    type = 'button',
    val = desc,
    on_press = on_press,
    opts = opts,
  }
end

local buttons = {
  type = 'group',
  val = {
    button('e', '  New file', '<cmd>ene <CR>'),
    button('SPC f f', '󰈞  Find file'),
    button('SPC f w', '󰈬  Live grep'),
    button('SPC e', '  Toggle file explorer'),
    button('SPC t f', '  Open terminal'),
    button('SPC q', '  Close'),
  },
  opts = {
    spacing = 1,
  },
}

local config = {
  layout = {
    { type = 'padding', val = 2 },
    default_header,
    { type = 'padding', val = 4 },
    buttons,
  },
  opts = {
    margin = 5,
  }
}

return {
  config = config,
}
