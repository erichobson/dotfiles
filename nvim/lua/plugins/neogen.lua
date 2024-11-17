return {
    "danymat/neogen",
    config = function()
        require("neogen").setup({
            enabled = true,
            input_after_comment = true,
            languages = {
                lua = {
                    template = {
                        annotation_convention = "ldoc",
                    },
                },
                python = {
                    template = {
                        annotation_convention = "google_docstrings",
                    },
                },
            },
        })
    end,
    dependencies = "nvim-treesitter/nvim-treesitter",
    cmd = { "Neogen" },
    keys = {
        {
            "<leader>nf",
            function()
                require("neogen").generate()
            end,
            desc = "Generate Documentation",
        },
        {
            "<leader>nc",
            function()
                require("neogen").generate({ type = "class" })
            end,
            desc = "Generate Class Documentation",
        },
        {
            "<leader>nt",
            function()
                require("neogen").generate({ type = "type" })
            end,
            desc = "Generate Type Documentation",
        },
        {
            "<leader>nF",
            function()
                require("neogen").generate({ type = "file" })
            end,
            desc = "Generate File Documentation",
        },
    },
}
