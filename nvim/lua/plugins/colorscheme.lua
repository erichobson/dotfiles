return {
    --          ╭─────────────────────────────────────────────────────────╮
    --          │                       catppuccin                        │
    --          │           https://github.com/catppuccin/nvim            │
    --          ╰─────────────────────────────────────────────────────────╯
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
                transparent_background = true,
                dim_inactive = {
                    enabled = false,
                    shade = "dark",
                    percentage = 0.15,
                },
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    nvimtree = true,
                    telescope = true,
                    notify = true,
                    mini = true,
                },
            })
        end,
    },

    --          ╭─────────────────────────────────────────────────────────╮
    --          │                       Tokyo Night                       │
    --          │        https://github.com/folke/tokyonight.nvim         │
    --          ╰─────────────────────────────────────────────────────────╯
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            transparent = true,
        },
    },
}
