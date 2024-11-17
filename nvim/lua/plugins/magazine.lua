return {
    "iguanacucumber/magazine.nvim",
    name = "nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "L3MON4D3/LuaSnip",
        "onsails/lspkind.nvim",
        "rafamadriz/friendly-snippets",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-buffer",
        "FelipeLema/cmp-async-path",
        "lukas-reineke/cmp-rg",
    },
    config = function()
        local lspkind = require("lspkind")

        local luasnip = require("luasnip")
        luasnip.config.setup({
            region_check_events = "CursorMoved",
            delete_check_events = "TextChanged",
        })

        require("luasnip.loaders.from_vscode").lazy_load()

        local cmp = require("cmp")
        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-Space>"] = cmp.mapping(function()
                    if cmp.visible() then
                        cmp.abort()
                    else
                        cmp.complete()
                    end
                end, { "i", "s" }),
                ["<CR>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = false,
                }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<C-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),
            sources = {
                -- { name = "codeium", max_item_count = 5 },
                -- { name = "copilot", max_item_count = 5 },
                { name = "nvim_lsp", max_item_count = 5 },
                { name = "nvim_lsp_signature_help" },
                { name = "luasnip", max_item_count = 3 },
                { name = "buffer", max_item_count = 3 },
                { name = "async_path", max_item_count = 3 },
                { name = "rg", max_item_count = 3 },
            },
            formatting = {
                format = lspkind.cmp_format({
                    mode = "symbol_text",
                    maxwidth = function()
                        return math.floor(0.8 * vim.o.columns)
                    end,
                    ellipsis_char = "...",
                    show_label_details = true,
                    before = function(_, vim_item)
                        vim_item.abbr = string.sub(vim_item.abbr, 1, 80)
                        return vim_item
                    end,
                }),
            },
            performance = {
                debounce = 150,
                throttle = 60,
                fetching_timeout = 200,
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
            experimental = {
                ghost_text = false,
            },
            view = {
                entries = { name = "custom", selection_order = "near_cursor" },
            },
        })
    end,
}
