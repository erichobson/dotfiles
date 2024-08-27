return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
        preset = 'modern', -- classic, modern, helix
    },
    config = function(_, opts)
        require('which-key').setup(opts)
    end,
}
