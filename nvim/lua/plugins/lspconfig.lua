return {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp", "williamboman/mason-lspconfig.nvim" },
    opts = {
        servers = {
            lua_ls = {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            },
        },
    },
    config = function(_, opts)
        local mason_lspconfig = require("mason-lspconfig")
        local lspconfig = require("lspconfig")

        lspconfig.sourcekit.setup({
            capabilities = require("blink.cmp").get_lsp_capabilities({}),
            cmd = { vim.trim(vim.fn.system("xcrun -f sourcekit-lsp")) },
        })

        mason_lspconfig.setup_handlers({
            function(server_name)
                local server_opts = opts.servers[server_name] or {}
                server_opts.capabilities = require("blink.cmp").get_lsp_capabilities(server_opts.capabilities)
                lspconfig[server_name].setup(server_opts)
            end,
        })
    end,
}
