
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- Snippet completions
    { name = 'buffer' }, -- Optional buffer completions
    { name = 'path' }, -- Optional path completions
  }),
})


-- nvim-autopairs setup
require('nvim-autopairs').setup({})

-- nvim-ts-autotag setup
require('nvim-ts-autotag').setup({
    filetypes = { "html", "javascriptreact", "typescriptreact", "svelte", "vue", "xml" }, -- Add your filetypes
})
