--          ╭─────────────────────────────────────────────────────────╮
--          │                    no-neck-pain.nvim                    │
--          │     https://github.com/shortcuts/no-neck-pain.nvim      │
--          ╰─────────────────────────────────────────────────────────╯
return {
    "shortcuts/no-neck-pain.nvim",
    config = function()
        require("no-neck-pain").setup({
            width = 40,
            buffers = {
                scratchPad = {
                    enabled = true,
                    location = "~/Documents/scratch",
                },
                wo = {
                    fillchars = "eob: ",
                },
            },
            bo = {
                filetype = "md",
            },
        })
    end,
}
