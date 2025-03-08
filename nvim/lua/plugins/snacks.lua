return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        animate = { enabled = true },
        dashboard = { enabled = true },
        -- explorer = {},
        picker = {},
        terminal = {},
        scratch = {},

        input = { enabled = true },
        indent = {
            scope = {
                char = "│",
                hl = {
                    "RainbowRed",
                    "RainbowOrange",
                    "RainbowYellow",
                    "RainbowGreen",
                    "RainbowAqua",
                    "RainbowBlue",
                    "RainbowPurple",
                },
            },
        },
        notifier = {
            enabled = true,
            timeout = 3000, -- default timeout in ms
            width = { min = 40, max = 0.4 },
            height = { min = 1, max = 0.6 },

            margin = { top = 1, right = 1, bottom = 0 },
            padding = true,
            sort = { "level", "added" },
            level = vim.log.levels.TRACE,
            icons = {
                error = " ",
                warn = " ",
                info = " ",
                debug = " ",
                trace = " ",
            },
            keep = function(notif)
                return vim.fn.getcmdpos() > 0
            end,
            style = "compact",
            top_down = true,
            date_format = "%R",
            more_format = " ↓ %d lines ",
            refresh = 50,
        },

        notify = {
            enabled = true,
            replace = true,
        },

        scroll = {
            animate = {
                duration = { step = 15, total = 250 },
                easing = "linear",
            },
            animate_repeat = {
                delay = 100,
                duration = { step = 5, total = 50 },
                easing = "linear",
            },
        },

        toggle = {
            map = vim.keymap.set, -- keymap.set function to use
            which_key = true, -- integrate with which-key to show enabled/disabled icons and colors
            notify = true, -- show a notification when toggling
            -- icons for enabled/disabled states
            icon = {
                enabled = " ",
                disabled = " ",
            },
            -- colors for enabled/disabled states
            color = {
                enabled = "green",
                disabled = "yellow",
            },
        },
    },
    keys = {
        {
            "<leader><space>",
            function()
                Snacks.picker.smart()
            end,
            desc = "Smart Find Files",
        },
        {
            "<leader>,",
            function()
                Snacks.picker.buffers()
            end,
            desc = "Buffers",
        },
        {
            "<leader>/",
            function()
                Snacks.picker.grep()
            end,
            desc = "Grep",
        },
        {
            "<leader>:",
            function()
                Snacks.picker.command_history()
            end,
            desc = "Command History",
        },
        {
            "<leader>n",
            function()
                Snacks.picker.notifications()
            end,
            desc = "Notification History",
        },
        -- {
        --     "<leader>e",
        --     function()
        --         -- Snacks.explorer()
        --         Snacks.explorer.open()
        --     end,
        --     desc = "File Explorer",
        -- },

        {
            "<C-\\>",
            function()
                Snacks.terminal.toggle()
            end,
            desc = "Toggle Terminal",
        },
    },
    -- init = function()
    --     vim.api.nvim_create_autocmd("User", {
    --         pattern = "VeryLazy",
    --         callback = function()
    --             Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
    --             Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
    --             Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
    --             Snacks.toggle.diagnostics():map("<leader>ud")
    --             Snacks.toggle.line_number():map("<leader>ul")
    --             Snacks.toggle
    --                 .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
    --                 :map("<leader>uc")
    --             Snacks.toggle.treesitter():map("<leader>uT")
    --             Snacks.toggle
    --                 .option("background", { off = "light", on = "dark", name = "Dark Background" })
    --                 :map("<leader>ub")
    --             Snacks.toggle.inlay_hints():map("<leader>uh")
    --             Snacks.toggle.indent():map("<leader>ug")
    --             Snacks.toggle.dim():map("<leader>uD")
    --         end,
    --     })
    -- end,
}
