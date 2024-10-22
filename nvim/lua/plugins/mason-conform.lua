--          ╭─────────────────────────────────────────────────────────╮
--          │                   mason-conform.nvim                    │
--          │      https://github.com/zapling/mason-conform.nvim      │
--          ╰─────────────────────────────────────────────────────────╯
return {
    "zapling/mason-conform.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "stevearc/conform.nvim",
    },
    config = function()
        require("mason-conform").setup()
    end,
}
