local cmp = require "cmp"

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ 
            behavior = cmp.ConfirmBehavior.Insert,
            select = true 
        }),
        ['<C-Space>'] = cmp.mapping.complete(),
    }),

    sources = {
        { name = 'buffer', keyword_length = 5 },
        { name = 'path' },
    },
    formatting = {
        fields = {'menu', 'abbr', 'kind'},
        format = function(entry, item)
            local menu_icon = {
                nvim_lsp = '',
                buffer = '',
                path = '',
            }
            item.menu = menu_icon[entry.source.name]
            return item
        end,
    },
})


