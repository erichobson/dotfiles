return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    dependencies = {
        "mason.nvim",
    },
    config = function()
        local conform = require("conform")
        conform.setup({
            formatters_by_ft = {
                lua = { "stylua" },
                c = { "clang-format" },
                yaml = { "prettier" },
                zsh = { "beautysh" },
                bash = { "beautysh" },
                sh = { "beautysh" },
                swift = { "swiftformat" },
            },
            format_on_save = {
                timeout_ms = 1000,
                lsp_fallback = true,
            },
            trim_automatic = true,
            formatters = {
                stylua = {
                    prepend_args = { "--indent-type", "Spaces", "--indent-width", "4" },
                },
                beautysh = {
                    prepend_args = { "--indent-size", "4" },
                },
            },
        })
    end,
}
