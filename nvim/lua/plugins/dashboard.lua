return {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("dashboard").setup({
            theme = "hyper",
            config = {
                week_header = {
                    enable = true,
                },
                shortcut = {
                    {
                        desc = "Update Plugins",
                        group = "@property",
                        action = "Lazy update",
                        key = "u",
                    },
                    {
                        icon = " ",
                        icon_hl = "@variable",
                        desc = "Find Files",
                        group = "Label",
                        action = "Telescope find_files",
                        key = "f",
                    },
                    {
                        icon = "󰱼 ",
                        icon_hl = "@string",
                        desc = "Find Text",
                        group = "Label",
                        action = function()
                            require("telescope.builtin").live_grep()
                        end,
                        key = "g",
                    },
                    {
                        desc = "Recent Files",
                        group = "DiagnosticHint",
                        action = "Telescope oldfiles",
                        key = "r",
                    },
                    {
                        desc = "Open Config",
                        group = "Number",
                        action = "edit ~/.config/nvim/init.lua",
                        key = "c",
                    },
                },
                project = {
                    enable = false,
                    limit = 5,
                    action = "Telescope find_files cwd=",
                },
                mru = {
                    limit = 10,
                },
            },
        })
    end,
}
