-- return {
--     "hrsh7th/nvim-cmp",
--     event = "InsertEnter",
--     dependencies = {
--         "L3MON4D3/LuaSnip",
--         "onsails/lspkind.nvim",
--         "saadparwaiz1/cmp_luasnip",
--         "hrsh7th/cmp-nvim-lsp",
--         "hrsh7th/cmp-buffer",
--         "hrsh7th/cmp-path",
--     },
--     config = function()
--         local lspkind = require("lspkind")
--
--         local luasnip = require("luasnip")
--         luasnip.config.setup({
--             region_check_events = "CursorMoved",
--             delete_check_events = "TextChanged",
--         })
--
--         local cmp = require("cmp")
--         cmp.setup({
--             snippet = {
--                 expand = function(args)
--                     luasnip.lsp_expand(args.body)
--                 end,
--             },
--
--             mapping = cmp.mapping.preset.insert({
--                 ["<CR>"] = cmp.mapping.confirm({
--                     behavior = cmp.ConfirmBehavior.Replace,
--                     select = false,
--                 }),
--                 ["<C-Esc>"] = cmp.mapping.close(),
--                 ["<Tab>"] = function(fallback)
--                     if cmp.visible() then
--                         cmp.select_next_item()
--                     else
--                         fallback()
--                     end
--                 end,
--                 ["<S-Tab>"] = function(fallback)
--                     if cmp.visible() then
--                         cmp.select_prev_item()
--                     else
--                         fallback()
--                     end
--                 end,
--             }),
--
--             sources = {
--                 -- { name = "copilot", max_item_count = 3 },
--                 -- { name = "codeium", max_item_count = 3 },
--                 { name = "nvim_lsp", max_item_count = 3 },
--                 { name = "buffer", max_item_count = 3 },
--                 { name = "path", max_item_count = 3 },
--                 { name = "luasnip", max_item_count = 3 },
--             },
--
--             formatting = {
--                 format = lspkind.cmp_format({
--                     mode = "symbol",
--                     maxwidth = function()
--                         return math.floor(0.8 * vim.o.columns)
--                     end,
--                     ellipsis_char = "...",
--                     show_labelDetails = true,
--                     -- symbol_map = {
--                     --     Copilot = "",
--                     --     Codeium = "",
--                     -- },
--                     before = function(entry, vim_item)
--                         vim_item.abbr = string.sub(vim_item.abbr, 1, 80)
--                         return vim_item
--                     end,
--                 }),
--             },
--             performance = {
--                 debounce = 150,
--                 throttle = 60,
--                 fetching_timeout = 200,
--             },
--             window = {
--                 completion = cmp.config.window.bordered(),
--                 documentation = cmp.config.window.bordered(),
--             },
--
--             experimental = {
--                 ghost_text = false,
--             },
--         })
--     end,
-- }

return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "L3MON4D3/LuaSnip",
        "onsails/lspkind.nvim",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "rafamadriz/friendly-snippets",
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local lspkind = require("lspkind")
        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            window = {
                completion = cmp.config.window.bordered({
                    border = "rounded",
                    winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
                    scrollbar = false,
                }),
                documentation = cmp.config.window.bordered({
                    border = "rounded",
                    winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
                }),
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = false,
                }),
                -- ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
            }),
            formatting = {
                format = lspkind.cmp_format({
                    mode = "symbol_text",
                    maxwidth = 50,
                    ellipsis_char = "...",
                    before = function(entry, vim_item)
                        vim_item.menu = ({
                            nvim_lsp = "[LSP]",
                            luasnip = "[Snippet]",
                            buffer = "[Buffer]",
                            path = "[Path]",
                        })[entry.source.name]
                        return vim_item
                    end,
                }),
            },
            experimental = {
                ghost_text = {
                    hl_group = "LspCodeLens",
                },
            },
            view = {
                entries = { name = "custom", selection_order = "near_cursor" },
            },
        })
    end,
}
