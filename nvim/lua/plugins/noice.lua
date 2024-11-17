return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        {
            "rcarriga/nvim-notify",
            config = function()
                require("notify").setup({
                    background_colour = "#000000",
                })
            end,
        },
    },
    config = function()
        require("noice").setup({
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
                progress = { enabled = false },
                hover = {
                    enabled = true,
                    silent = false,
                    view = nil,
                    opts = {},
                },
                signature = {
                    enabled = true,
                    auto_open = {
                        enabled = true,
                        trigger = true,
                        luasnip = true,
                        throttle = 50,
                    },
                    view = nil,
                    opts = {},
                },
                message = {
                    enabled = true,
                    view = "notify",
                    opts = {},
                },

                documentation = {
                    view = "hover",
                    opts = {
                        lang = "markdown",
                        replace = true,
                        render = "plain",
                        format = { "{message}" },
                        win_options = { concealcursor = "n", conceallevel = 3 },
                    },
                },
            },
            views = {
                cmdline_popup = {
                    border = {
                        style = "rounded",
                        padding = { 2, 3 },
                    },
                    position = {
                        row = "50%",
                        col = "50%",
                    },
                    filter_options = {},
                    win_options = {
                        winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
                    },
                },
            },

            cmdline = {
                enabled = true,
                view = "cmdline_popup",
                format = {
                    cmdline = { icon = ":" },
                    search_down = { icon = "/" },
                    search_up = { icon = "?" },
                    filter = { icon = "$" },
                    lua = { icon = "" },
                    help = { icon = "" },
                },
            },
            popupmenu = {
                enabled = true,
                backend = "nui",
            },
            history = {
                enabled = true,
                view = "split",
            },
            messages = {
                enabled = true,
                view = "notify",
                view_error = "notify",
                view_warn = "notify",
                view_history = "messages",
                view_search = "virtualtext",
            },
            notify = {
                enabled = true,
                view = "notify",
            },
            presets = {
                bottom_search = false,
                command_palette = true,
                long_message_to_split = true,
                inc_rename = true,
                lsp_doc_border = true,
            },
        })
    end,
}
