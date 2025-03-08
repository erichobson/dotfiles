return {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    config = function()
        vim.api.nvim_set_hl(0, "TinyInlineError", { fg = "#E67E80" })
        vim.api.nvim_set_hl(0, "TinyInlineWarn", { fg = "#DBBC7F" })
        vim.api.nvim_set_hl(0, "TinyInlineInfo", { fg = "#B2C98F" })
        vim.api.nvim_set_hl(0, "TinyInlineHint", { fg = "#9BB5CF" })
        vim.api.nvim_set_hl(0, "TinyInlineArrow", { fg = "#94AAA0" })
        require("tiny-inline-diagnostic").setup({
            hi = {
                error = "TinyInlineError",
                warn = "TinyInlineWarn",
                info = "TinyInlineInfo",
                hint = "TinyInlineHint",
                arrow = "TinyInlineArrow",
                background = "CursorLine",
                mixing_color = "#1C2225",
            },

            options = {
                show_source = false,
                use_icons_from_diagnostic = true,
                add_messages = true,
                throttle = 20,
                softwrap = 30,
                multiple_diag_under_cursor = true,
                multilines = {
                    enabled = true,
                    always_show = true,
                },
                show_all_diags_on_cursorline = true,
                enable_on_insert = false,
                enable_on_select = false,

                overflow = {
                    mode = "wrap",
                    padding = 0,
                },

                break_line = {
                    enabled = false,
                    after = 30,
                },

                virt_texts = {
                    priority = 2048,
                },
            },
        })

        vim.diagnostic.config({ virtual_text = false })
        vim.keymap.set("n", "<leader>td", function()
            require("tiny-inline-diagnostic").toggle()
        end, { desc = "Toggle inline diagnostics" })
    end,
}
