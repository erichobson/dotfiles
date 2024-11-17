return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "iguanacucumber/magazine.nvim",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup()

        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        require("mason-lspconfig").setup_handlers({
            function(server_name)
                require("lspconfig")[server_name].setup({
                    capabilities = capabilities,
                })
            end,

            ["lua_ls"] = function()
                require("lspconfig").lua_ls.setup({
                    capabilities = capabilities,
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" },
                                severity = "Warning",
                            },
                        },
                    },
                })
            end,
        })
    end,
}
