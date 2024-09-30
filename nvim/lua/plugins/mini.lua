return {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
        require("mini.cursorword").setup()
        require("mini.pairs").setup()
        require("mini.comment").setup()
    end,
}
