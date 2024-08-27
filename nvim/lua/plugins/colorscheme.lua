return {
    'eldritch-theme/eldritch.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require('eldritch').setup({
            transparent = true,
            terminal_colors = true,
            styles = {
                comments = { italic = true },
                keywords = { italic = true },
                functions = {},
                variables = {},
            },
            hide_inactive_statusline = true,
            lualine_bold = false,
        })
        vim.cmd.colorscheme('eldritch')
    end,
}
