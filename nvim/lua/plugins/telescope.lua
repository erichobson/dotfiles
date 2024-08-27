return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('telescope').setup()
    end,

    keys = {

        { mode = { 'n' }, '<leader>ff', function() require('telescope.builtin').find_files() end,               desc = 'Fuzzy find files in cwd' },
        { mode = { 'n' }, '<leader>fg', function() require('telescope.builtin').live_grep() end,                desc = 'Live grep in cwd' },
        { mode = { 'n' }, '<leader>fb', function() require('telescope.builtin').buffers() end,                  desc = 'List open buffers' },
        { mode = { 'n' }, '<leader>fh', function() require('telescope.builtin').help_tags() end,                desc = 'List available help' },
        { mode = { 'n' }, '<leader>fgf', function() require('telescope.builtin').git_files() end,               desc = 'Fuzzy find Git files' },
        { mode = { 'n' }, '<leader>fr', function() require('telescope.builtin').oldfiles() end,                 desc = 'Find recently opened files' },
        { mode = { 'n' }, '<leader>/', function() require('telescope.builtin').current_buffer_fuzzy_find() end, desc = 'Fuzzy find in current buffer' },
        { mode = { 'n' }, '<leader>fk', function() require('telescope.builtin').keymaps() end,                  desc = 'List and search keymaps' },
    },
}
