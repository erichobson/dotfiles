return {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
        require("mini.ai").setup()
        require("mini.cursorword").setup()
        require("mini.pairs").setup()
        require("mini.surround").setup()
        require("mini.comment").setup()
    end,
}
