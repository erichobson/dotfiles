return {
    "yochem/autosplit.nvim",
    event = "VimEnter",
    config = function()
        local autosplit = require("autosplit")

        autosplit.setup({
            split = "auto",
            min_win_width = 80,
        })

        vim.keymap.set("n", "<leader>s", ":Split<CR>", { noremap = true, silent = true, desc = "Auto split" })
    end,
}
