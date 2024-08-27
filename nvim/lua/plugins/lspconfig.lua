return {
    'neovim/nvim-lspconfig',
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
    },

    config = function()
        require("mason-lspconfig").setup()

        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        require("mason-lspconfig").setup_handlers({
            function(server_name)
                require("lspconfig")[server_name].setup({
                    capabilities = capabilities,
                })
            end,
            lua_ls = function()
                require('lspconfig').lua_ls.setup({
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" },
                                severity = "Warning"
                            }
                        }
                    }
                })
            end
        })
    end,

    keys = {
        { '<leader>do', mode = { 'n' }, vim.diagnostic.open_float, desc = 'Diagnostic Open Float' },
        { '<leader>dp', mode = { 'n' }, vim.diagnostic.goto_prev,  desc = 'Diagnostic Goto Prev' },
        { '<leader>dn', mode = { 'n' }, vim.diagnostic.goto_next,  desc = 'Diagnostic Goto Next' },
        { '<leader>dl', mode = { 'n' }, vim.diagnostic.setloclist, desc = 'Diagnostic Set Loclist' },
    },
}
