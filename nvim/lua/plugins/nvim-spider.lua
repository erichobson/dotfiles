--          ╭─────────────────────────────────────────────────────────╮
--          │                       nvim-spider                       │
--          │       https://github.com/chrisgrieser/nvim-spider       │
--          ╰─────────────────────────────────────────────────────────╯
return {
    "chrisgrieser/nvim-spider",
    lazy = true,
    keys = {
        {
            "w",
            "<cmd>lua require('spider').motion('w')<CR>",
            mode = { "n", "o", "x" },
            desc = "Spider-w",
        },
        {
            "e",
            "<cmd>lua require('spider').motion('e')<CR>",
            mode = { "n", "o", "x" },
            desc = "Spider-e",
        },
        {
            "b",
            "<cmd>lua require('spider').motion('b')<CR>",
            mode = { "n", "o", "x" },
            desc = "Spider-b",
        },
    },
}
