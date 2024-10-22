--         ╭──────────────────────────────────────────────────────────╮
--         │               tiny-inline-diagnostic.nvim                │
--         │https://github.com/rachartier/tiny-inline-diagnostic.nvim │
--         ╰──────────────────────────────────────────────────────────╯
return {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    config = function()
        vim.diagnostic.config({
            signs = {
                virtual_text = false,
                text = {
                    [vim.diagnostic.severity.ERROR] = "●",
                    [vim.diagnostic.severity.WARN] = "●",
                    [vim.diagnostic.severity.INFO] = "●",
                    [vim.diagnostic.severity.HINT] = "●",

                    -- Alternate icons
                    -- [vim.diagnostic.severity.ERROR] = "",
                    -- [vim.diagnostic.severity.WARN] = "",
                    -- [vim.diagnostic.severity.INFO] = "",
                    -- [vim.diagnostic.severity.HINT] = "",
                },
            },
        })
        require("tiny-inline-diagnostic").setup()
    end,
}
