return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
        labels = "asdfghjklqwertyuiopzxcvbnm",
        search = {
            -- These options can be tweaked if you want
            mode = "fuzzy",
            max_length = 80,
        },
        jump = {
            autojump = true,
        },
        label = {
            uppercase = false,
            rainbow = {
                enabled = true,
                shade = 5,
            },
        },
        highlight = {
            backdrop = true,
            matches = true,
        },
    },
    keys = {
        {
            "s",
            mode = { "n", "x", "o" },
            function()
                require("flash").jump()
            end,
            desc = "Flash",
        },
    },
}
