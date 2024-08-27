return {
    'zbirenbaum/copilot.lua',
    event = { 'VimEnter' },
    config = function()
        require('copilot').setup({
            suggestion = { enabled = false },
            panel = { enabled = false },
        })
    end,
}
