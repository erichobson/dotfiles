return {
    "stevearc/conform.nvim",
    dependencies = {
        "williamboman/mason.nvim",
    },
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "isort", "black" },
            c = { "clang-format" },
            yaml = { "prettier" },
            zsh = { "beautysh" },
            bash = { "beautysh" },
            sh = { "beautysh" },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true,
        },
        formatters = {
            stylua = {
                prepend_args = { "--indent-type", "Spaces", "--indent-width", "4" },
            },
            beautysh = {
                prepend_args = { "--indent-size", "4" },
            },
        },
    },
}
