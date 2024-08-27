return {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
        require('mini.cursorword').setup()
        require('mini.pairs').setup()
        require('mini.comment').setup()
        -- require('mini.indentscope').setup()
        -- require('mini.move').setup()
        -- require('mini.pick').setup()
        -- require('mini.splitjoin').setup()
        -- require('mini.surround').setup()
    end,
}
