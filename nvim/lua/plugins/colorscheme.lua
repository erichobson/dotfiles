return {
    -- "eldritch-theme/eldritch.nvim",
    -- lazy = false,
    -- priority = 1000,
    -- config = function()
    --     require("eldritch").setup({
    --         transparent = true,
    --         terminal_colors = true,
    --         styles = {
    --             comments = { italic = true },
    --             keywords = { italic = true },
    --             functions = {},
    --             variables = {},
    --         },
    --         hide_inactive_statusline = true,
    --         lualine_bold = false,
    --     })
    --     vim.cmd.colorscheme("eldritch")
    -- end,

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
                -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
            },
        })
        vim.cmd.colorscheme("catppuccin")
    end,

    -- "shaunsingh/nord.nvim",
    -- name = "nord",
    -- priority = 1000,
    -- config = function()
    --     vim.cmd.colorscheme("nord")
    -- end,

    -- "aliqyan-21/darkvoid.nvim",
    -- name = "darkvoid",
    -- priority = 1000,
    -- config = function()
    --     require("darkvoid").setup({
    --         transparent = true, -- set true for transparent
    --         glow = true, -- set true for glow effect
    --         show_end_of_buffer = true, -- set false for not showing end of buffer
    --     })
    --     vim.cmd.colorscheme("darkvoid")
    -- end,
}
