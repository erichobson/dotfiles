return {
    'mrjones2014/legendary.nvim',
    priority = 10000,
    lazy = false,
    config = function()
        require('legendary').setup({
            extensions = {
                lazy_nvim = {},
            },

            keymaps = {
                { '<leader>l', '<CMD>Legendary<CR>', description = 'Toggle Legendary' },
                { '<leader>w', '<CMD>update<CR>',    description = 'Save Buffer' },
                { '<leader>q', '<CMD>q<CR>',         description = 'Quit Buffer' },
                { '<leader>Q', '<CMD>q!<CR>',        description = 'Force Quit Buffer' },
                { '<leader>s', '<CMD>Sp<CR>',        description = 'Split' },

                -- vim.keymap.set("n", "<C-S>", ":%s/")
                -- vim.keymap.set("n", "sp", ":sp<CR>")
                -- vim.keymap.set("n", "tj", ":tabprev<CR>")
                -- vim.keymap.set("n", "tk", ":tabnext<CR>")
                -- vim.keymap.set("n", "tn", ":tabnew<CR>")
                -- vim.keymap.set("n", "to", ":tabo<CR>")
                -- vim.keymap.set("n", "vs", ":vs<CR>")
                -- vim.keymap.set("n", "<leader>j", ":cnext<CR>", { silent = true })
                -- vim.keymap.set("n", "<leader>k", ":cprevious<CR>", { silent = true })
                -- vim.keymap.set("n", "<leader>o", ":tabonly<cr>:only<CR>", { silent = true })


            },
        })
    end,
}
