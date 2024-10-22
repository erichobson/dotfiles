--          ╭─────────────────────────────────────────────────────────╮
--          │                     autosplit.nvim                      │
--          │        https://github.com/yochem/autosplit.nvim         │
--          ╰─────────────────────────────────────────────────────────╯
return {
    "yochem/autosplit.nvim",
    event = "VimEnter",
    config = function()
        require("autosplit").setup({
            split = "auto",
            min_win_width = 80,
        })
    end,
    keys = {
        {
            "<leader>s",
            "<CMD>Split<CR>",
            mode = "n",
            desc = "Auto split",
        },
    },
}
