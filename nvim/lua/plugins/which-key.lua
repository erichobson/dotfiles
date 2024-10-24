--          ╭─────────────────────────────────────────────────────────╮
--          │                        Which Key                        │
--          │         https://github.com/folke/which-key.nvim         │
--          ╰─────────────────────────────────────────────────────────╯
return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        require("which-key").setup({
            preset = "modern",
        })
    end,
}
