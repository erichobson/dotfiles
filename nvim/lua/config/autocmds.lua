-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = '*',
    callback = function()
        local save_cursor = vim.fn.getpos('.')
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.setpos('.', save_cursor)
    end
})

-- Executes the callback function every time a
-- language server is attached to a buffer.
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf }

        local keymap_opts = function(desc)
            return vim.tbl_extend('force', opts, { desc = desc })
        end

        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', keymap_opts("Hover Documentation"))
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', keymap_opts("Go to Definition"))
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', keymap_opts("Go to Declaration"))
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', keymap_opts("Go to Implementation"))
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', keymap_opts("Go to Type Definition"))
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', keymap_opts("Find References"))
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', keymap_opts("Signature Help"))
        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', keymap_opts("Rename"))
        vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', keymap_opts("Format"))
        vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', keymap_opts("Code Action"))
    end,
})

-- Reset cursor style on exit
vim.cmd([[
    au VimLeave * set guicursor=a:hor20-blinkwait800
]])
