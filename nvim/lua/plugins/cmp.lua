return {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        'L3MON4D3/LuaSnip',
        'onsails/lspkind.nvim',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
    },
    config = function()
        -- local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        local lspkind = require('lspkind')

        local luasnip = require('luasnip')
        luasnip.config.setup({
            region_check_events = 'CursorMoved',
            delete_check_events = 'TextChanged',
        })

        local cmp = require('cmp')
        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },

            mapping = cmp.mapping.preset.insert({
                ['<CR>'] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = false,
                }),
                ['<C-c>'] = cmp.mapping.close(),
                ['<Tab>'] = function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                end,
                ['<S-Tab>'] = function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end,
            }),

            sources = {
                { name = 'copilot',  max_item_count = 3 },
                { name = 'codeium',  max_item_count = 3 },
                { name = 'nvim_lsp', max_item_count = 5 },
                { name = 'buffer',   max_item_count = 5 },
                { name = 'path',     max_item_count = 3 },
                { name = 'luasnip',  max_item_count = 3 },
            },

            formatting = {
                format = lspkind.cmp_format({
                    mode = 'symbol', -- symbol_text
                    maxwidth = 100,
                    -- maxwidth = function() return math.floor(0.8 * vim.o.columns) end,
                    ellipsis_char = '...',
                    show_labelDetails = true,
                    symbol_map = {
                        Copilot = '',
                        Codeium = '',
                    },
                    before = function(entry, vim_item)
                        vim_item.abbr = string.sub(vim_item.abbr, 1, 80)
                        return vim_item
                    end
                })
            },

            experimental = {
                ghost_text = false,
            },
        })

        -- cmp.event:on(
        --     'confirm_done',
        --     cmp_autopairs.on_confirm_done()
        -- )
    end,
}
