--          ╭─────────────────────────────────────────────────────────╮
--          │                       flash.nvim                        │
--          │      https://github.com/folke/flash.nvim#-examples      │
--          ╰─────────────────────────────────────────────────────────╯
return {
    "folke/flash.nvim",
    dependencies = {
        "declancm/cinnamon.nvim",
    },
    event = "VeryLazy",
    opts = {
        labels = "asdfghjklqwertyuiopzxcvbnm",
        search = {
            mode = "fuzzy",
            max_length = 80,
        },
        jump = {
            autojump = true,
        },
        label = {
            uppercase = true,
            rainbow = {
                enabled = true,
                shade = 8,
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
        {
            "S",
            mode = { "n", "x", "o" },
            function()
                require("flash").treesitter()
            end,
            desc = "Flash Treesitter",
        },
        {
            "r",
            mode = "o",
            function()
                require("flash").remote()
            end,
            desc = "Remote Flash",
        },
        {
            "R",
            mode = { "o", "x" },
            function()
                require("flash").treesitter_search()
            end,
            desc = "Treesitter Search",
        },
        {
            "<c-s>",
            mode = { "c" },
            function()
                require("flash").toggle()
            end,
            desc = "Toggle Flash Search",
        },
    },
    config = function(_, opts)
        require("flash").setup(vim.tbl_deep_extend("force", opts, {
            action = function(match, state)
                require("cinnamon").scroll(function()
                    require("flash.jump").jump(match, state)
                    require("flash.jump").on_jump(state)
                end)
            end,
        }))
    end,
}
