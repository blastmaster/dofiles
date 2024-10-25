return {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        {
            'L3MON4D3/LuaSnip',
            build = (function()
                return 'make install_jsregexp'
            end)(),
            dependencies = {
                -- snippets here
            },
        },
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
    },
    config = function()
        -- see :help cmp
        local cmp = require('cmp')
        local luasnip = require('luasnip')
        luasnip.config.setup {}

        cmp.setup {
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            completion = { completeopt = 'menu,menuone','noinsert' },
            mapping = cmp.mapping.preset.insert {
                ['<CR>'] = cmp.mapping.confirm { select = true },
                ['<Tab>'] = cmp.mapping.select_next_item(),
                ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete {},

                ['<C-l>'] = cmp.mapping(function()
                    if luasnip.expand_or_locally_jumpable() then
                        luasnip.jump()
                    end
                end, { 'i', 's' }),
                ['<C-h>'] = cmp.mapping(function()
                    if luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    end
                end, { 'i', 's' }),
        },
        sources = {
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
            { name = 'path' },
        },
    }
    end,
}
