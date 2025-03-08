return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        preset = "modern",
        notify = true,
        plugins = {
            marks = true, -- shows a list of your marks on ' and `
            registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
            -- the presets plugin, adds help for a bunch of default keybindings in Neovim
            -- No actual key bindings are created
            spelling = {
                enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                suggestions = 20, -- how many suggestions should be shown in the list?
            },
            presets = {
                operators = true, -- adds help for operators like d, y, ...
                motions = true, -- adds help for motions
                text_objects = true, -- help for text objects triggered after entering an operator
                windows = true, -- default bindings on <c-w>
                nav = true, -- misc bindings to work with windows
                z = true, -- bindings for folds, spelling and others prefixed with z
                g = true, -- bindings for prefixed with g
            },
        },
        win = {
            -- don't allow the popup to overlap with the cursor
            no_overlap = true,
            -- width = 1,
            -- height = { min = 4, max = 25 },
            -- col = 0,
            -- row = math.huge,
            -- border = "none",
            padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
            title = true,
            title_pos = "center",
            zindex = 1000,
            -- Additional vim.wo and vim.bo options
            bo = {},
            wo = {
                -- winblend = 10, -- value between 0-100 0 for fully opaque and 100 for fully transparent
            },
        },
        layout = {
            width = { min = 20 }, -- min and max width of the columns
            spacing = 5, -- spacing between columns
        },
        keys = {
            scroll_down = "<c-d>", -- binding to scroll down inside the popup
            scroll_up = "<c-u>", -- binding to scroll up inside the popup
        },
    },
    -- keys = {
    --     {
    --         "<leader>?",
    --         function()
    --             require("which-key").show({ global = false })
    --         end,
    --         desc = "Buffer Local Keymaps (which-key)",
    --     },
    -- },
    -- config = function()
    --     local wk = require("which-key")
    --     wk.add({
    --         { "<leader>f", group = "file" }, -- group
    --         { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
    --         {
    --             "<leader>fb",
    --             function()
    --                 print("hello")
    --             end,
    --             desc = "Foobar",
    --         },
    --         { "<leader>fn", desc = "New File" },
    --         { "<leader>f1", hidden = true }, -- hide this keymap
    --         { "<leader>w", proxy = "<c-w>", group = "windows" }, -- proxy to window mappings
    --         {
    --             "<leader>b",
    --             group = "buffers",
    --             expand = function()
    --                 return require("which-key.extras").expand.buf()
    --             end,
    --         },
    --         {
    --             -- Nested mappings are allowed and can be added in any order
    --             -- Most attributes can be inherited or overridden on any level
    --             -- There's no limit to the depth of nesting
    --             mode = { "n", "v" }, -- NORMAL and VISUAL mode
    --             { "<leader>q", "<cmd>q<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
    --             { "<leader>w", "<cmd>w<cr>", desc = "Write" },
    --         },
    --     })
    -- end,
}
