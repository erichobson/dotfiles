return {
    "comfysage/evergarden",
    lazy = false,
    priority = 1000,
    opts = {
        -- style = {
        --     tabline = { reverse = true, color = "green" },
        --     search = { reverse = false, inc_reverse = true },
        --     types = { italic = true },
        --     keyword = { italic = true },
        --     comment = { italic = true },
        --     sign = { highlight = false },
        -- },
        transparent_background = false,
        variant = "medium", -- 'hard'|'medium'|'soft'
        override_terminal = true,
        style = {
            tabline = { "reverse" },
            search = { "italic" },
            incsearch = { "reverse" },
            types = { "italic" },
            keyword = { "italic" },
            comment = { "italic" },
            sign = { highlight = false },
        },
        integrations = {
            blink_cmp = true,
            lualine = true,
            -- cmp = true,
            -- gitsigns = true,
            indent_blankline = true,
            nvimtree = true,
            rainbow_delimiters = true,
            -- symbols_outline = true,
            telescope = true,
            which_key = false,
        },
    },
    config = function(opts)
        require("evergarden").setup(opts)
        vim.cmd.colorscheme("evergarden")
    end,
}
