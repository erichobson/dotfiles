--          ╭─────────────────────────────────────────────────────────╮
--          │                     Cinnamon Scroll                     │
--          │        https://github.com/declancm/cinnamon.nvim        │
--          ╰─────────────────────────────────────────────────────────╯
return {
    "declancm/cinnamon.nvim",
    version = "*",
    opts = {
        keymaps = {
            basic = true,
            extra = true,
        },
        options = { mode = "cursor", delay = 5 },
    },
}
