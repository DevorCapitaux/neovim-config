-- It is not meant to be loaded through core.utils.load_mappings

local cmp = require('cmp')
local luasnip = require('luasnip')

return {
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<C-e>'] = cmp.mapping.abort(),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
  ['<C-n>'] = cmp.mapping.scroll_docs(4),
  ['<C-p>'] = cmp.mapping.scroll_docs(-4),
  ['<Tab>'] = cmp.mapping(function(fallback)
    local col = vim.fn.col('.') - 1

    if cmp.visible() then
      cmp.select_next_item()
    elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
      fallback()
    else
      cmp.complete()
    end
  end, { 'i', 's' }),
  ['<S-Tab>'] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
    else
      fallback()
    end
  end, { 'i', 's' }),
  ['<C-d>'] = cmp.mapping(function(fallback)
    if luasnip.jumpable() then
      luasnip.jump(1)
    else
      fallback()
    end
  end, { 'i', 's' }),
  ['<C-b>'] = cmp.mapping(function(fallback)
    if luasnip.jumpable(-1) then
      luasnip.jump(-1)
    else
      fallback()
    end
  end, { 'i', 's' }),
}
