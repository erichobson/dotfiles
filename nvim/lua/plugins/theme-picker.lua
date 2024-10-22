--          ╭─────────────────────────────────────────────────────────╮
--          │                    theme-picker.nvim                    │
--          │    https://github.com/panghu-huang/theme-picker.nvim    │
--          ╰─────────────────────────────────────────────────────────╯
return {
    "panghu-huang/theme-picker.nvim",
    lazy = false,
    opts = {
        picker = {
            layout_config = {
                width = 0.35,
                height = 0.5,
            },
        },
        themes = {
            {
                name = "Catppuccin",
                colorscheme = "catppuccin",
            },
            {
                name = "Tokyo Night (Moon)",
                colorscheme = "tokyonight-moon",
            },
            {
                name = "Tokyo Night (Night)",
                colorscheme = "tokyonight-night",
            },
            {
                name = "Tokyo Night (Storm)",
                colorscheme = "tokyonight-storm",
            },
            -- {
            --     name = "",
            --     colorscheme = "",
            -- },
        },
    },
    keys = {
        {
            "<leader>tp",
            function()
                require("theme-picker").open_theme_picker()
            end,
            desc = "Open Theme Picker",
        },
    },
}
