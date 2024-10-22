--          ╭─────────────────────────────────────────────────────────╮
--          │                    comment-box.nvim                     │
--          │     https://github.com/LudoPinelli/comment-box.nvim     │
--          ╰─────────────────────────────────────────────────────────╯
return {
    "LudoPinelli/comment-box.nvim",
    config = function()
        require("comment-box").setup({
            doc_width = 80,
            box_width = 60,
            borders = {
                top = "─",
                bottom = "─",
                left = "│",
                right = "│",
                top_left = "╭",
                top_right = "╮",
                bottom_left = "╰",
                bottom_right = "╯",
            },
        })

        -- local keymap = vim.keymap.set
        -- local opts = { noremap = true, silent = true }
        -- local cb = require("comment-box")
        --
        -- -- left aligned fixed size box with left aligned text
        -- keymap({ "n", "v"}, "<Leader>cb", "<Cmd>CBllbox<CR>", opts)
        -- -- centered adapted box
        -- keymap({ "n", "v"}, "<Leader>cc", "<Cmd>CBacbox<CR>", opts)
        --
        -- -- left aligned titled line with left aligned text
        -- keymap({ "n", "v" }, "<Leader>ct", "<Cmd>llline<CR>", opts)
        --
        -- -- centered line
        -- keymap("n", "<Leader>cl", "<Cmd>CBcline<CR>", opts)
        -- keymap("i", "<M-l>", "<Cmd>CBcline<CR>", opts)
        --
        -- -- remove a box or a titled line
        -- keymap({ "n", "v" }, "<Leader>cd", "<Cmd>CBd<CR>", opts)

        local keymap = vim.keymap.set
        local opts = { noremap = true, silent = true }

        -- Create a Boxed Comment (Centered Box with Centered Text)
        keymap({ "n", "v" }, "<Leader>cb", "<Cmd>CBccbox<CR>", { desc = "Create Comment Box" })

        -- Create a Titled Line (Left Aligned Line with Left Aligned Text)
        keymap({ "n", "v" }, "<Leader>cl", "<Cmd>CBlline<CR>", { desc = "Create Comment Line" })

        -- Create a Simple Line (Centered Line)
        keymap("n", "<Leader>c-", "<Cmd>CBcline<CR>", { desc = "Create Simple Line" })

        -- Remove a Comment Box or Line
        keymap({ "n", "v" }, "<Leader>cd", "<Cmd>CBd<CR>", { desc = "Delete Comment Box/Line" })

        -- Open the Comment Box Catalog
        keymap("n", "<Leader>cc", "<Cmd>CBcatalog<CR>", { desc = "Open Comment Box Catalog" })
    end,
}
